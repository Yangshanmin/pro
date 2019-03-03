package com.nba.mgr.pro.service.impl;


import com.nba.mgr.pro.dao.TeamInfoDao;
import com.nba.mgr.pro.entity.TeamInfo;
import com.nba.mgr.pro.service.TeamInfoService;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TeamInfo)表服务实现类
 *
 * @author makejava
 * @since 2019-01-08 21:10:23
 */
@Service("teamInfoService")
public class TeamInfoServiceImpl extends CrudServiceImpl<TeamInfoDao, TeamInfo> implements TeamInfoService {
    @Resource
    private TeamInfoDao teamInfoDao;

    @Override
    public void del(String id) {
        teamInfoDao.del(id);
    }
}