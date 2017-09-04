package com.mol.dto;

import lombok.Data;
import java.math.BigDecimal;

/**
 * Created by usher on 2017/9/4.
 */
@Data
public class RealCallpriceMemberDTO {
    private Integer userId;
    private Integer realCallId;
    private String companyName;
    private String callPriceMoney;
    private String callSubmitDeadline;
    private BigDecimal vilationMoneyAmount;
    private BigDecimal prepayedMoneyAmount;
    private String callPurity;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRealCallId() {
        return realCallId;
    }

    public void setRealCallId(Integer realCallId) {
        this.realCallId = realCallId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCallPriceMoney() {
        return callPriceMoney;
    }

    public void setCallPriceMoney(String callPriceMoney) {
        this.callPriceMoney = callPriceMoney;
    }

    public String getCallSubmitDeadline() {
        return callSubmitDeadline;
    }

    public void setCallSubmitDeadline(String callSubmitDeadline) {
        this.callSubmitDeadline = callSubmitDeadline;
    }

    public BigDecimal getVilationMoneyAmount() {
        return vilationMoneyAmount;
    }

    public void setVilationMoneyAmount(BigDecimal vilationMoneyAmount) {
        this.vilationMoneyAmount = vilationMoneyAmount;
    }

    public BigDecimal getPrepayedMoneyAmount() {
        return prepayedMoneyAmount;
    }

    public void setPrepayedMoneyAmount(BigDecimal prepayedMoneyAmount) {
        this.prepayedMoneyAmount = prepayedMoneyAmount;
    }

    public String getCallPurity() {
        return callPurity;
    }

    public void setCallPurity(String callPurity) {
        this.callPurity = callPurity;
    }
}
