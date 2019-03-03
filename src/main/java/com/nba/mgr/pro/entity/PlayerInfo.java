package com.nba.mgr.pro.entity;

import java.io.Serializable;
import org.free.persistence.model.BaseModel;

/**
 * (PlayerInfo)实体类
 *
 * @author makejava
 * @since 2019-03-03 21:38:46
 */
public class PlayerInfo extends BaseModel {
    private static final long serialVersionUID = 206796390520220053L;
    
    private Long id;
    
    private Long teamId;
    
    private String playerName;
    
    private String playerAge;
    
    private String playerPhoto;
    
    private String playerHeight;
    
    private String playerWeight;
    
    private String playerArmlength;
    
    private String playerScore;
    
    private String playerBackboard;
    
    private String playerAssists;
    
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

    public String getPlayerScore() {
        return playerScore;
    }

    public void setPlayerScore(String playerScore) {
        this.playerScore = playerScore;
    }

    public String getPlayerBackboard() {
        return playerBackboard;
    }

    public void setPlayerBackboard(String playerBackboard) {
        this.playerBackboard = playerBackboard;
    }

    public String getPlayerAssists() {
        return playerAssists;
    }

    public void setPlayerAssists(String playerAssists) {
        this.playerAssists = playerAssists;
    }

    public String getPlayerState() {
        return playerState;
    }

    public void setPlayerState(String playerState) {
        this.playerState = playerState;
    }

}