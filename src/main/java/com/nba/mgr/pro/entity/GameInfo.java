package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (GameInfo)实体类
 *
 * @author makejava
 * @since 2019-03-07 13:29:12
 */
public class GameInfo extends BaseModel {
    private static final long serialVersionUID = 474700086556442733L;
    
    private Long id;
    
    private Long teamZhuId;

    private String teamZhuName;

    private Long teamKeId;

    private String teamKeName;

    private String gameTime;
    
    private String gameScore;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTeamZhuId() {
        return teamZhuId;
    }

    public void setTeamZhuId(Long teamZhuId) {
        this.teamZhuId = teamZhuId;
    }

    public Long getTeamKeId() {
        return teamKeId;
    }

    public void setTeamKeId(Long teamKeId) {
        this.teamKeId = teamKeId;
    }

    public String getGameTime() {
        return gameTime;
    }

    public void setGameTime(String gameTime) {
        this.gameTime = gameTime;
    }

    public String getGameScore() {
        return gameScore;
    }

    public void setGameScore(String gameScore) {
        this.gameScore = gameScore;
    }

    public String getTeamZhuName() {
        return teamZhuName;
    }

    public void setTeamZhuName(String teamZhuName) {
        this.teamZhuName = teamZhuName;
    }

    public String getTeamKeName() {
        return teamKeName;
    }

    public void setTeamKeName(String teamKeName) {
        this.teamKeName = teamKeName;
    }
}