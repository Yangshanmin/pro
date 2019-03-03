package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (TeamInfo)实体类
 *
 * @author makejava
 * @since 2019-01-08 21:10:23
 */
public class TeamInfo extends BaseModel {
    private static final long serialVersionUID = -93312488003367116L;
    
    private Long id;
    
    private String teamName;
    
    private String teamPhoto;
    
    private String teamHistory;
    
    private String teamManager;
    
    private String teamBoss;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamPhoto() {
        return teamPhoto;
    }

    public void setTeamPhoto(String teamPhoto) {
        this.teamPhoto = teamPhoto;
    }

    public String getTeamHistory() {
        return teamHistory;
    }

    public void setTeamHistory(String teamHistory) {
        this.teamHistory = teamHistory;
    }

    public String getTeamManager() {
        return teamManager;
    }

    public void setTeamManager(String teamManager) {
        this.teamManager = teamManager;
    }

    public String getTeamBoss() {
        return teamBoss;
    }

    public void setTeamBoss(String teamBoss) {
        this.teamBoss = teamBoss;
    }

}