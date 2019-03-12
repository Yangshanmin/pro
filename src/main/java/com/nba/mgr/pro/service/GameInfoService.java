package com.nba.mgr.pro.service;

import com.nba.mgr.pro.entity.GameInfo;
import java.util.List;
import org.free.persistence.service.BaseService;


/**
 * (GameInfo)表服务接口
 *
 * @author makejava
 * @since 2019-03-07 13:29:12
 */
public interface GameInfoService extends BaseService<GameInfo> {
    public void del(String id);
}