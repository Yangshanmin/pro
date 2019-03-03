package com.nba.mgr.pro.service;

import com.nba.mgr.pro.entity.MailCode;
import java.util.List;
import org.free.persistence.service.BaseService;


/**
 * (MailCode)表服务接口
 *
 * @author makejava
 * @since 2019-01-09 15:05:10
 */
public interface MailCodeService extends BaseService<MailCode> {
    public MailCode queryByMail(String mail);
}