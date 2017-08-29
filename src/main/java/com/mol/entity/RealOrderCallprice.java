package com.mol.entity;

import java.util.Date;

public class RealOrderCallprice {
    private Integer realCallId;

    private Integer orderId;

    private Integer userId;

    private String callPriceAmount;

    private String callPriceValidtime;

    private String offerDiagram;

    private String makeBill;

    private String otherRequire;

    private Boolean isPrepayed;

    private Double prepayedMoneyAmount;

    private String attachment;

    private Boolean acceptVialationMoney;

    private Double acceptVialationMoneyAmount;

    private String state;

    private Date createTime;

    public Integer getRealCallId() {
        return realCallId;
    }

    public void setRealCallId(Integer realCallId) {
        this.realCallId = realCallId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCallPriceAmount() {
        return callPriceAmount;
    }

    public void setCallPriceAmount(String callPriceAmount) {
        this.callPriceAmount = callPriceAmount == null ? null : callPriceAmount.trim();
    }

    public String getCallPriceValidtime() {
        return callPriceValidtime;
    }

    public void setCallPriceValidtime(String callPriceValidtime) {
        this.callPriceValidtime = callPriceValidtime == null ? null : callPriceValidtime.trim();
    }

    public String getOfferDiagram() {
        return offerDiagram;
    }

    public void setOfferDiagram(String offerDiagram) {
        this.offerDiagram = offerDiagram == null ? null : offerDiagram.trim();
    }

    public String getMakeBill() {
        return makeBill;
    }

    public void setMakeBill(String makeBill) {
        this.makeBill = makeBill == null ? null : makeBill.trim();
    }

    public String getOtherRequire() {
        return otherRequire;
    }

    public void setOtherRequire(String otherRequire) {
        this.otherRequire = otherRequire == null ? null : otherRequire.trim();
    }

    public Boolean getIsPrepayed() {
        return isPrepayed;
    }

    public void setIsPrepayed(Boolean isPrepayed) {
        this.isPrepayed = isPrepayed;
    }

    public Double getPrepayedMoneyAmount() {
        return prepayedMoneyAmount;
    }

    public void setPrepayedMoneyAmount(Double prepayedMoneyAmount) {
        this.prepayedMoneyAmount = prepayedMoneyAmount;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    public Boolean getAcceptVialationMoney() {
        return acceptVialationMoney;
    }

    public void setAcceptVialationMoney(Boolean acceptVialationMoney) {
        this.acceptVialationMoney = acceptVialationMoney;
    }

    public Double getAcceptVialationMoneyAmount() {
        return acceptVialationMoneyAmount;
    }

    public void setAcceptVialationMoneyAmount(Double acceptVialationMoneyAmount) {
        this.acceptVialationMoneyAmount = acceptVialationMoneyAmount;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}