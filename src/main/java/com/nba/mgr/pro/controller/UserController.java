package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.User;
import com.nba.mgr.pro.service.UserService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2019-01-09 14:38:50
 */
@Controller
@RequestMapping("user")
public class UserController {
    /**
     * 服务对象
     */
    @Autowired
    private UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public User selectOne(Long id) {
        return this.userService.getById(id);
    }

}