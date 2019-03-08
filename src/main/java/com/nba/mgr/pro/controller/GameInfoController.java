package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.GameInfo;
import com.nba.mgr.pro.entity.TeamInfo;
import com.nba.mgr.pro.service.GameInfoService;
import com.nba.mgr.pro.service.TeamInfoService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Array;
import java.util.List;

/**
 * (GameInfo)表控制层
 *
 * @author makejava
 * @since 2019-03-07 13:29:12
 */
@Controller
@RequestMapping("gameInfo")
public class GameInfoController {
    /**
     * 服务对象
     */
    @Autowired
    private GameInfoService gameInfoService;

    @Autowired
    private TeamInfoService teamInfoService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public GameInfo selectOne(Long id) {
        return this.gameInfoService.getById(id);
    }

    @RequestMapping("/index")
    public String index (Model model) {
        List<TeamInfo> teamInfoList = teamInfoService.queryByArgs(new TeamInfo());
        model.addAttribute("teamList", teamInfoList);
        return "pro/gameInfoList";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult<GameInfo> list (@RequestBody GameInfo gameInfo) {
        System.out.println(gameInfoService.queryPage(gameInfo));
        return gameInfoService.queryPage(gameInfo);
    }

    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public String saveOrUpdate (@RequestBody GameInfo gameInfo) {

        gameInfoService.saveOrUpdate(gameInfo);
        return "success";
    }
}