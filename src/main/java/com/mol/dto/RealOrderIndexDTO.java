package com.mol.dto;

import java.util.Date;

/**
 * Created by 江建平 on 2017/8/10.
 */
public class RealOrderIndexDTO {
    private Integer realOrderId;
    private String casNo;
    private String purity;
    private String priceBetween;
    private String buyAmount;
    private String submitDeadline;
    private Integer joinCount;//参与抢实单人数
    private Date endTime;

    public Integer getRealOrderId() {
        return realOrderId;
    }

    public void setRealOrderId(Integer realOrderId) {
        this.realOrderId = realOrderId;
    }

    public String getCasNo() {
        return casNo;
    }

    public void setCasNo(String casNo) {
        this.casNo = casNo;
    }

    public String getPurity() {
        return purity;
    }

    public void setPurity(String purity) {
        this.purity = purity;
    }

    public String getPriceBetween() {
        return priceBetween;
    }

    public void setPriceBetween(String priceBetween) {
        this.priceBetween = priceBetween;
    }

    public String getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(String buyAmount) {
        this.buyAmount = buyAmount;
    }

    public String getSubmitDeadline() {
        return submitDeadline;
    }

    public void setSubmitDeadline(String submitDeadline) {
        this.submitDeadline = submitDeadline;
    }

    public Integer getJoinCount() {
        return joinCount;
    }

    public void setJoinCount(Integer joinCount) {
        this.joinCount = joinCount;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
