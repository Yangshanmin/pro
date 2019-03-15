/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.MailCode;
import com.nba.mgr.pro.entity.NormalUser;
import com.nba.mgr.pro.entity.TeamUser;
import com.nba.mgr.pro.entity.User;
import com.nba.mgr.pro.service.*;
import com.nba.mgr.pro.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)， 真正登录的POST请求由Filter完成,
 * 
 * @author calvin
 */
@Controller
public class LoginController {

	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private MailCodeService mailCodeService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private NormalUserService normalUserService;
    @Autowired
    private TeamUserService teamUserService;

	@RequestMapping(value = "/")
	public String index(HttpServletRequest request) {

		if (request.getSession().getAttribute("user") != null) {
			logger.debug(">>>>已登录，将跳转至主页");
			return "/sysmgr/index";
		} else {
			return "login";
		}
	}

	/***
	 * 登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, User user, Model model) {
		String DBpassword = Md5Util.getMD5(user.getPassword());
		user.setPassword(DBpassword);
		User virifyUser =  userService.queryTop1(user);
		if (virifyUser != null) {
			request.getSession().setAttribute("user", virifyUser);
			model.addAttribute("username", virifyUser.getName());
			logger.debug(">>>>已登录，将跳转至主页");
			return "/sysmgr/index";
		} else {
			return "login";
		}
	}

	/***
	 * 注销
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "/login";
	}

	@RequestMapping(value = "/homepage")
	public String homepage() {
		return "homepage";
	}

	/***
	 * 发送
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "sendCode")
	@ResponseBody
	public void getCode(@RequestParam("email") String email) throws Exception{
		String randcode = String.valueOf((int)((Math.random()*9+1)*1000));

		MailCode mailCode = new MailCode();
		mailCode.setCode(randcode);
		mailCode.setCreateTime(new Date());
		mailCode.setUserMail(email);
		mailCodeService.saveOrUpdate(mailCode);

		String content="<html>\n" +
                "<body>\n" +
                "    <h3>你的验证码为:</h3>\n" + "<span style='color: red'>" +
				randcode + "</span>" +
                "</body>\n" +
                "</html>";
        emailService.sendHtmlEmail(email,"NBA系统找回密码!",content);
	}

	@RequestMapping(value = "modify")
	@ResponseBody
	public String modify(@RequestParam("email") String email,@RequestParam("code") String code,@RequestParam("newpassword") String newpassword) {
		if (StringUtils.isNotBlank(email)) {
			MailCode mailCode = mailCodeService.queryByMail(email);
			if (mailCode.getCode().equals(code)) {
				String newPass = Md5Util.getMD5(newpassword);

				User user = userService.getByEmail(email);
				if (user == null) {
					return "邮箱错误, 请检查";
				}
				user.setPassword(newPass);
				userService.saveOrUpdate(user);
				return "success";
			} else {
				return "验证码错误啦!";
			}
		} else {
			return "邮箱不能为空!";
		}
	}

	//普通用户登陆界面
	@RequestMapping(value = "/normalLogin")
	public String normalLogin(HttpServletRequest request) {
			return "normalLogin";
	}

	@RequestMapping(value = "/normalLogin1")
	public String normalLogin1(HttpServletRequest request, NormalUser normalUser, Model model) {
		String DBpassword = Md5Util.getMD5(normalUser.getPassword());
		normalUser.setPassword(DBpassword);
		NormalUser virifyUser =  normalUserService.queryTop1(normalUser);
		if (virifyUser != null) {
			request.getSession().setAttribute("user", virifyUser);
			model.addAttribute("username", virifyUser.getName());
			logger.debug(">>>>已登录，将跳转至主页");
			return "/sysmgr/normalIndex";
		} else {
			return "normalLogin";
		}
	}

	//球队管理员登陆界面
	@RequestMapping(value = "/teamLogin")
	public String teamLogin(HttpServletRequest request) {
		return "teamLogin";
	}

	@RequestMapping(value = "/teamLogin1")
	public String teamLogin1(HttpServletRequest request, TeamUser teamUser, Model model) {
		String DBpassword = Md5Util.getMD5(teamUser.getPassword());
        teamUser.setPassword(DBpassword);
		TeamUser virifyUser =  teamUserService.queryTop1(teamUser);
		if (virifyUser != null) {
			request.getSession().setAttribute("user", virifyUser);
			model.addAttribute("username", virifyUser.getName());

			model.addAttribute("userTeamId",virifyUser.getTeamId());
			logger.debug(">>>>已登录，将跳转至主页");
			return "/sysmgr/teamIndex";
		} else {
			return "teamLogin";
		}
	}
}
