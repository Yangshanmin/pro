package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.TeamInfo;
import com.nba.mgr.pro.entity.TeamUser;
import com.nba.mgr.pro.service.TeamInfoService;
import com.nba.mgr.pro.service.TeamUserService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * (TeamUser)表控制层
 *
 * @author makejava
 * @since 2019-03-06 22:05:40
 */
@Controller
@RequestMapping("teamUser")
public class TeamUserController {
    /**
     * 服务对象
     */
    @Autowired
    private TeamUserService teamUserService;

    @Autowired
    private TeamInfoService teamInfoService;
    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public TeamUser selectOne(Long id) {
        return this.teamUserService.getById(id);
    }

    @RequestMapping("/index")
    public String index (Model model) {
        List<TeamInfo> teamInfoList = teamInfoService.queryByArgs(new TeamInfo());
        model.addAttribute("teamList", teamInfoList);
        return "pro/teamUserList";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult<TeamUser> list (@RequestBody TeamUser teamUser) {

        return teamUserService.queryPage(teamUser);
    }
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public String saveOrUpdate (@RequestBody TeamUser teamUser) {
        teamUserService.saveOrUpdate(teamUser);
        return "success";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete (@PathVariable String id) {

        teamUserService.del(id);
        return "success";
    }

    @RequestMapping("/getById/{id}")
    @ResponseBody
    public TeamUser getById (@PathVariable String id) {
        return teamUserService.getById(id);
    }
}