package com.nba.mgr.pro.service;

import java.util.List;

import com.nba.mgr.pro.entity.TeamInfo;
import org.free.persistence.service.BaseService;


/**
 * (TeamInfo)表服务接口
 *
 * @author makejava
 * @since 2019-01-08 21:10:23
 */
public interface TeamInfoService extends BaseService<TeamInfo> {
    public void del(String id);
}