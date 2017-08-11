package com.mol.entity;

import java.util.Date;

public class User {
    private Integer userId;

    private String phone;

    private String email;

    private Boolean isCertificated;

    private String password;

    private String district;

    private Integer credit;

    private String creditRank;

    private Date createTime;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getIsCertificated() {
        return isCertificated;
    }

    public void setIsCertificated(Boolean isCertificated) {
        this.isCertificated = isCertificated;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getCreditRank() {
        return creditRank;
    }

    public void setCreditRank(String creditRank) {
        this.creditRank = creditRank == null ? null : creditRank.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}