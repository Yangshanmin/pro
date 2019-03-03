package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

import javax.validation.constraints.NotNull;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2019-01-09 14:38:50
 */
public class User extends BaseModel {
    private static final long serialVersionUID = -26698270358537099L;
    
    private Long id;
    
    private String name;
    
    private String mobile;
    
    private String password;

    @NotNull
    private String email;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}