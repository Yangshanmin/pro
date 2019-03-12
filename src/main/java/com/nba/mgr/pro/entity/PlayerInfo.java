package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (PlayerInfo)实体类
 *
 * @author makejava
 * @since 2019-03-05 19:57:14
 */
public class PlayerInfo extends BaseModel {
    private static final long serialVersionUID = 834164592124124504L;
    
    private Long id;
    
    private Long teamId;

    private String teamName;
    
    private String playerName;
    
    private String playerAge;
    
    private String playerPhoto;
    
    private String playerHeight;
    
    private String playerWeight;
    
    private String playerArmlength;
    
    private Integer playerScore;
    
    private Integer playerBackboard;
    
    private Integer playerAssists;
    
    private String playerState;


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

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getPlayerAge() {
        return playerAge;
    }

    public void setPlayerAge(String playerAge) {
        this.playerAge = playerAge;
    }

    public String getPlayerPhoto() {
        return playerPhoto;
    }

    public void setPlayerPhoto(String playerPhoto) {
        this.playerPhoto = playerPhoto;
    }

    public String getPlayerHeight() {
        return playerHeight;
    }

    public void setPlayerHeight(String playerHeight) {
        this.playerHeight = playerHeight;
    }

    public String getPlayerWeight() {
        return playerWeight;
    }

    public void setPlayerWeight(String playerWeight) {
        this.playerWeight = playerWeight;
    }

    public String getPlayerArmlength() {
        return playerArmlength;
    }

    public void setPlayerArmlength(String playerArmlength) {
        this.playerArmlength = playerArmlength;
    }


    public Integer getPlayerScore() {
        return playerScore;
    }

    public void setPlayerScore(Integer playerScore) {
        this.playerScore = playerScore;
    }

    public Integer getPlayerBackboard() {
        return playerBackboard;
    }

    public void setPlayerBackboard(Integer playerBackboard) {
        this.playerBackboard = playerBackboard;
    }

    public Integer getPlayerAssists() {
        return playerAssists;
    }

    public void setPlayerAssists(Integer playerAssists) {
        this.playerAssists = playerAssists;
    }

    public String getPlayerState() {
        return playerState;
    }

    public void setPlayerState(String playerState) {
        this.playerState = playerState;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}