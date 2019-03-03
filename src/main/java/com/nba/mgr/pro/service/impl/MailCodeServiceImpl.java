package com.nba.mgr.pro.service.impl;

import com.nba.mgr.pro.entity.MailCode;
import com.nba.mgr.pro.dao.MailCodeDao;
import com.nba.mgr.pro.service.MailCodeService;
import org.springframework.stereotype.Service;
import org.free.persistence.service.CrudServiceImpl;

import javax.annotation.Resource;
import java.util.List;

/**
 * (MailCode)表服务实现类
 *
 * @author makejava
 * @since 2019-01-09 15:05:10
 */
@Service("mailCodeService")
public class MailCodeServiceImpl extends CrudServiceImpl<MailCodeDao, MailCode> implements MailCodeService {
    @Resource
    private MailCodeDao mailCodeDao;

    @Override
    public MailCode queryByMail(String mail) {
        return mailCodeDao.queryByMail(mail);
    }
}