package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.TeamUser;
import com.nba.mgr.pro.dao.TeamUserDao;
import com.nba.mgr.pro.service.TeamUserService;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TeamUser)表服务实现类
 *
 * @author makejava
 * @since 2019-03-06 22:05:40
 */
@Service("teamUserService")
public class TeamUserServiceImpl extends CrudServiceImpl<TeamUserDao, TeamUser> implements TeamUserService {
    @Resource
    private TeamUserDao teamUserDao;

    @Override
    public void del(String id) {
        teamUserDao.del(id);
    }
}