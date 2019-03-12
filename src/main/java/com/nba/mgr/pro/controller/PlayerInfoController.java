package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.PlayerInfo;
import com.nba.mgr.pro.entity.TeamInfo;
import com.nba.mgr.pro.service.PlayerInfoService;
import com.nba.mgr.pro.service.TeamInfoService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * (PlayerInfo)表控制层
 *
 * @author makejava
 * @since 2019-03-05 19:57:20
 */
@Controller
@RequestMapping("playerInfo")
public class PlayerInfoController {
    /**
     * 服务对象
     */
    @Autowired
    private PlayerInfoService playerInfoService;
    @Autowired
    private TeamInfoService teamInfoService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public PlayerInfo selectOne(Long id) {
        return this.playerInfoService.getById(id);
    }

    @RequestMapping("/index")
    public String index (Model model) {
        List<TeamInfo> teamInfoList = teamInfoService.queryByArgs(new TeamInfo());
        model.addAttribute("teamList", teamInfoList);
        return "pro/playerInfoList";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageResult<PlayerInfo> list (@RequestBody PlayerInfo playerInfo) {
        return playerInfoService.queryPage(playerInfo);
    }

    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public String saveOrUpdate (@RequestBody PlayerInfo playerInfo) {
        playerInfoService.saveOrUpdate(playerInfo);
        return "success";
    }

    @RequestMapping("/getById/{id}")
    @ResponseBody
    public PlayerInfo getById (@PathVariable String id) {
        return playerInfoService.getById(id);
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete (@PathVariable String id) {
        playerInfoService.del(id);
        return "success";
    }

    //得分排行榜
    @RequestMapping("/score")
    public String score (Model model) {
        return "pro/scoreList";
    }

    @RequestMapping("/scoreList")
    @ResponseBody
    public PageResult<PlayerInfo> scoreList () {
        return playerInfoService.scoreList();
    }

    //篮板球
    @RequestMapping("/backboard")
    public String backboard (Model model) {
        return "pro/backboardList";
    }

    @RequestMapping("/backboardList")
    @ResponseBody
    public PageResult<PlayerInfo> backboardList() {
        return playerInfoService.backboardList();
    }

    @RequestMapping("/assists")
    public String assists (Model model) {
        return "pro/assistsList";
    }

    @RequestMapping("/assistsList")
    @ResponseBody
    public PageResult<PlayerInfo> assistsList () {
        return playerInfoService.assistsList();
//        return  playerInfoService.queryByArgsList();
    }
}