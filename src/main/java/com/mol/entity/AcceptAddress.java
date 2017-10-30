package com.mol.entity;

public class AcceptAddress {
    private Integer id;

    private Integer userId;

    private String acceptGoodsUsername;

    private String acceptGoodsAddress;

    private String contactTel;

    private String addTime;

    private String updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAcceptGoodsUsername() {
        return acceptGoodsUsername;
    }

    public void setAcceptGoodsUsername(String acceptGoodsUsername) {
        this.acceptGoodsUsername = acceptGoodsUsername == null ? null : acceptGoodsUsername.trim();
    }

    public String getAcceptGoodsAddress() {
        return acceptGoodsAddress;
    }

    public void setAcceptGoodsAddress(String acceptGoodsAddress) {
        this.acceptGoodsAddress = acceptGoodsAddress == null ? null : acceptGoodsAddress.trim();
    }

    public String getContactTel() {
        return contactTel;
    }

    public void setContactTel(String contactTel) {
        this.contactTel = contactTel == null ? null : contactTel.trim();
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime == null ? null : addTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }
}