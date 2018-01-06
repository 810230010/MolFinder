package com.mol.entity;

import java.util.Date;
import java.util.List;

public class RealOrderCallprice {
    private Integer realCallId;

    private Integer realOrderId;

    private Integer buyerId;

    private Integer userId;

    private String callPriceAmount;

    private String callPriceMoney;

    private String callPriceValidtime;

    private String callPurity;

    private String callSubmitDeadline;

    private String offerDiagram;

    private String makeBill;

    private String otherRequire;

    private Long prepayedMoneyAmount;

    private String attachment;

    private String shape;

    private String color;

    private Long vilationMoneyAmount;

    private String state;

    private String expressType;

    private Date createTime;
    public String getSubmitDeadline1(){
        return callSubmitDeadline.contains("周") ? callSubmitDeadline : callSubmitDeadline + "周";
    }
//    public List<String> getRealCallpriceCompleted() {
//        return realCallpriceCompleted;
//    }
//
//    public void setRealCallpriceCompleted(List<String> realCallpriceCompleted) {
//        this.realCallpriceCompleted = realCallpriceCompleted;
//    }

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

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
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

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape == null ? null : shape.trim();
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
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

    public String getExpressType() {
        return expressType;
    }

    public void setExpressType(String expressType) {
        this.expressType = expressType == null ? null : expressType.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}