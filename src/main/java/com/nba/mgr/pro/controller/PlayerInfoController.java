package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.PlayerInfo;
import com.nba.mgr.pro.service.PlayerInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * (PlayerInfo)表控制层
 *
 * @author makejava
 * @since 2019-03-03 21:38:46
 */
@Controller
@RequestMapping("playerInfo")
public class PlayerInfoController {
    /**
     * 服务对象
     */
    @Autowired
    private PlayerInfoService playerInfoService;

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

}