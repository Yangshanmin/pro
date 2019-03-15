package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (TeamUser)实体类
 *
 * @author makejava
 * @since 2019-03-06 22:05:40
 */
public class TeamUser extends BaseModel {
    private static final long serialVersionUID = 128322214565091613L;
    
    private Long id;
    
    private Long teamId;
    
    private String name;
    
    private String mobile;
    
    private String password;
    
    private String email;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTeamId() {
        return teamId;
    }

    public void setTeamId(Long teamId) {
        this.teamId = teamId;
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