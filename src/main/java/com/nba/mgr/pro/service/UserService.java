package com.nba.mgr.pro.service;

import com.nba.mgr.pro.entity.User;
import java.util.List;
import org.free.persistence.service.BaseService;


/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2019-01-09 14:38:50
 */
public interface UserService extends BaseService<User> {
    public User getByEmail(String email);
}