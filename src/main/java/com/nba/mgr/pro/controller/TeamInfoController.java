package com.nba.mgr.pro.controller;


import com.nba.mgr.pro.entity.TeamInfo;
import com.nba.mgr.pro.service.TeamInfoService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * (TeamInfo)表控制层
 *
 * @author makejava
 * @since 2019-01-08 21:10:23
 */
@Controller
@RequestMapping("teamInfo")
public class TeamInfoController {
    /**
     * 服务对象
     */
    @Autowired
    private TeamInfoService teamInfoService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public TeamInfo selectOne(Long id) {
        return this.teamInfoService.getById(id);
    }


    @RequestMapping("/index")
    public String index () {
        return "pro/projectInfoList";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult<TeamInfo> list (@RequestBody TeamInfo teamInfo) {
        return teamInfoService.queryPage(teamInfo);
    }

    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public String saveOrUpdate (@RequestBody TeamInfo teamInfo) {
        teamInfoService.saveOrUpdate(teamInfo);
        return "success";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete (@PathVariable String id) {

        teamInfoService.del(id);
        return "success";
    }

    @RequestMapping("/getById/{id}")
    @ResponseBody
    public TeamInfo getById (@PathVariable String id) {

        return teamInfoService.getById(id);

    }



}