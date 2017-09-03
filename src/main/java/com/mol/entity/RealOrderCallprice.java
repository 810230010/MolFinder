package com.mol.entity;

import java.util.Date;

public class RealOrderCallprice {
    private Integer realCallId;

    private Integer realOrderId;

    private Integer userId;

    private String callPriceMoney;

    private String callPriceValidtime;

    private String callPurity;

    private String callSubmitDeadline;

    private String offerDiagram;

    private String makeBill;

    private String otherRequire;

    private Long prepayedMoneyAmount;

    private String attachment;

    private Long vilationMoneyAmount;

    private String state;

    private Date createTime;

    public Integer getRealCallId() {
        return realCallId;
    }

    public void setRealCallId(Integer realCallId) {
        this.realCallId = realCallId;
    }

    public Integer getRealOrderId() {
        return realOrderId;
    }

    public void setRealOrderId(Integer realOrderId) {
        this.realOrderId = realOrderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCallPriceMoney() {
        return callPriceMoney;
    }

    public void setCallPriceMoney(String callPriceMoney) {
        this.callPriceMoney = callPriceMoney == null ? null : callPriceMoney.trim();
    }

    public String getCallPriceValidtime() {
        return callPriceValidtime;
    }

    public void setCallPriceValidtime(String callPriceValidtime) {
        this.callPriceValidtime = callPriceValidtime == null ? null : callPriceValidtime.trim();
    }

    public String getCallPurity() {
        return callPurity;
    }

    public void setCallPurity(String callPurity) {
        this.callPurity = callPurity == null ? null : callPurity.trim();
    }

    public String getCallSubmitDeadline() {
        return callSubmitDeadline;
    }

    public void setCallSubmitDeadline(String callSubmitDeadline) {
        this.callSubmitDeadline = callSubmitDeadline == null ? null : callSubmitDeadline.trim();
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

    public Long getPrepayedMoneyAmount() {
        return prepayedMoneyAmount;
    }

    public void setPrepayedMoneyAmount(Long prepayedMoneyAmount) {
        this.prepayedMoneyAmount = prepayedMoneyAmount;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    public Long getVilationMoneyAmount() {
        return vilationMoneyAmount;
    }

    public void setVilationMoneyAmount(Long vilationMoneyAmount) {
        this.vilationMoneyAmount = vilationMoneyAmount;
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