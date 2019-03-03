package com.nba.mgr.pro.entity;

import java.util.Date;
import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (MailCode)实体类
 *
 * @author makejava
 * @since 2019-01-09 15:09:20
 */
public class MailCode extends BaseModel {
    private static final long serialVersionUID = 877468373418864614L;
    
    private Long id;
    
    private String code;
    
    private String userMail;
    
    private Date createTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}