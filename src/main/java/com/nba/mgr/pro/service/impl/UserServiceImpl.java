package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.User;
import com.nba.mgr.pro.dao.UserDao;
import com.nba.mgr.pro.service.UserService;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2019-01-09 14:38:50
 */
@Service("userService")
public class UserServiceImpl extends CrudServiceImpl<UserDao, User> implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public User getByEmail(String email) {
        return userDao.getByEmail(email);
    }
}