package com.nba.mgr.pro.service;

import com.nba.mgr.pro.entity.TeamUser;
import java.util.List;
import org.free.persistence.service.BaseService;


/**
 * (TeamUser)表服务接口
 *
 * @author makejava
 * @since 2019-03-06 22:05:40
 */
public interface TeamUserService extends BaseService<TeamUser> {
    public void del(String id);
}