package com.mol.entity;

import java.util.Date;

public class MaterialBuy {
    private Integer materialPurchaseId;

    private Integer userId;

    private String casNo;

    private String purchaseAmount;

    private String acceptGoodsPlace;

    private String remark;

    private Boolean isInfoShow;

    private Date createTime;

    public Integer getMaterialPurchaseId() {
        return materialPurchaseId;
    }

    public void setMaterialPurchaseId(Integer materialPurchaseId) {
        this.materialPurchaseId = materialPurchaseId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCasNo() {
        return casNo;
    }

    public void setCasNo(String casNo) {
        this.casNo = casNo == null ? null : casNo.trim();
    }

    public String getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(String purchaseAmount) {
        this.purchaseAmount = purchaseAmount == null ? null : purchaseAmount.trim();
    }

    public String getAcceptGoodsPlace() {
        return acceptGoodsPlace;
    }

    public void setAcceptGoodsPlace(String acceptGoodsPlace) {
        this.acceptGoodsPlace = acceptGoodsPlace == null ? null : acceptGoodsPlace.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Boolean getIsInfoShow() {
        return isInfoShow;
    }

    public void setIsInfoShow(Boolean isInfoShow) {
        this.isInfoShow = isInfoShow;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}