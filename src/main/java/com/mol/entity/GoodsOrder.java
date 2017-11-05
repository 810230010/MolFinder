package com.mol.entity;

public class GoodsOrder {
    private String goodsOrderId;

    private Integer callPriceId;

    private Integer buyerId;

    private String expressWay;

    private String acceptGoodsInfoId;

    private String attachment;

    private String state;

    private String remark;

    private String orderType;

    private String createTime;

    private Long orderPrice;

    public String getGoodsOrderId() {
        return goodsOrderId;
    }

    public void setGoodsOrderId(String goodsOrderId) {
        this.goodsOrderId = goodsOrderId == null ? null : goodsOrderId.trim();
    }

    public Integer getCallPriceId() {
        return callPriceId;
    }

    public void setCallPriceId(Integer callPriceId) {
        this.callPriceId = callPriceId;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public String getExpressWay() {
        return expressWay;
    }

    public void setExpressWay(String expressWay) {
        this.expressWay = expressWay == null ? null : expressWay.trim();
    }

    public String getAcceptGoodsInfoId() {
        return acceptGoodsInfoId;
    }

    public void setAcceptGoodsInfoId(String acceptGoodsInfoId) {
        this.acceptGoodsInfoId = acceptGoodsInfoId == null ? null : acceptGoodsInfoId.trim();
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType == null ? null : orderType.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public Long getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Long orderPrice) {
        this.orderPrice = orderPrice;
    }
}