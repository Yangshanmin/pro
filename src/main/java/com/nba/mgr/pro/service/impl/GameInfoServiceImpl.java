package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.GameInfo;
import com.nba.mgr.pro.dao.GameInfoDao;
import com.nba.mgr.pro.service.GameInfoService;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (GameInfo)表服务实现类
 *
 * @author makejava
 * @since 2019-03-07 13:29:12
 */
@Service("gameInfoService")
public class GameInfoServiceImpl extends CrudServiceImpl<GameInfoDao, GameInfo> implements GameInfoService {
    @Resource
    private GameInfoDao gameInfoDao;
}