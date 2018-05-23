package com.mol.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;
@Data
public class Certification {
    private Integer certificateId;

    private Integer userId;

    private String certificateType;

    private String companyName;

    private String username;

    private String phone;

    private String realname;

    private String IDNumber;

    private String guaranteenMaterial;

    private String isPass;

    private Date createTime;

    public String getCertificateType1(){
        if(certificateType.equals("COMPANY"))
            return "企业";
        return "个人";
    }
    public String[] getImages(){
        return guaranteenMaterial.split(",");
    }

    public Integer getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(Integer certificateId) {
        this.certificateId = certificateId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCertificateType() {
        return certificateType;
    }

    public void setCertificateType(String certificateType) {
        this.certificateType = certificateType == null ? null : certificateType.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getIDNumber() {
        return IDNumber;
    }

    public void setIDNumber(String IDNumber) {
        this.IDNumber = IDNumber;
    }

    public String getGuaranteenMaterial() {
        return guaranteenMaterial;
    }

    public void setGuaranteenMaterial(String guaranteenMaterial) {
        this.guaranteenMaterial = guaranteenMaterial == null ? null : guaranteenMaterial.trim();
    }

    public String getIsPass() {
        return isPass;
    }

    public void setIsPass(String isPass) {
        this.isPass = isPass == null ? null : isPass.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}