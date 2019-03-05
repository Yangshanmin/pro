package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.PlayerInfo;
import com.nba.mgr.pro.dao.PlayerInfoDao;
import com.nba.mgr.pro.service.PlayerInfoService;
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
}