package com.nba.mgr.pro.controller;

import com.nba.mgr.pro.entity.MailCode;
import com.nba.mgr.pro.service.MailCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * (MailCode)表控制层
 *
 * @author makejava
 * @since 2019-01-09 15:05:10
 */
@Controller
@RequestMapping("mailCode")
public class MailCodeController {
    /**
     * 服务对象
     */
    @Autowired
    private MailCodeService mailCodeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public MailCode selectOne(Long id) {
        return this.mailCodeService.getById(id);
    }

}