package com.nba.mgr.pro.service;

import com.nba.mgr.pro.entity.PlayerInfo;
import org.free.persistence.model.PageResult;
import org.free.persistence.service.BaseService;

import java.util.List;


/**
 * (PlayerInfo)表服务接口
 *
 * @author makejava
 * @since 2019-03-05 19:57:20
 */
public interface PlayerInfoService extends BaseService<PlayerInfo> {

    public void del(String id);
    public PageResult<PlayerInfo> scoreList();
    public PageResult<PlayerInfo> backboardList();
    public PageResult<PlayerInfo> assistsList();
}