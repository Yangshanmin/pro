package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.PlayerInfo;
import com.nba.mgr.pro.dao.PlayerInfoDao;
import com.nba.mgr.pro.service.PlayerInfoService;
import org.free.persistence.model.PageResult;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (PlayerInfo)表服务实现类
 *
 * @author makejava
 * @since 2019-03-05 19:57:20
 */
@Service("playerInfoService")
public class PlayerInfoServiceImpl extends CrudServiceImpl<PlayerInfoDao, PlayerInfo> implements PlayerInfoService {
    @Resource
    private PlayerInfoDao playerInfoDao;

    @Override
    public void del(String id) {
        playerInfoDao.del(id);
    }

    @Override
    public PageResult<PlayerInfo> scoreList() {
        List<PlayerInfo> list = playerInfoDao.scoreList();
       return new PageResult<PlayerInfo>(Long.valueOf(list.size()), list);
    }


    @Override
    public PageResult<PlayerInfo> backboardList() {
        List<PlayerInfo> list = playerInfoDao.backboardList();
        return new PageResult<PlayerInfo>(Long.valueOf(list.size()), list);
    }

    @Override
    public PageResult<PlayerInfo> assistsList() {
        List<PlayerInfo> list = playerInfoDao.assistsList();
        return new PageResult<PlayerInfo>(Long.valueOf(list.size()), list);
    }
}