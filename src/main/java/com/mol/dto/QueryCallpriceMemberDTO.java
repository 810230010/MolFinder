package com.mol.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by usher on 2017/11/11.
 */
@Data
public class QueryCallpriceMemberDTO {
    private Integer queryOrderId;
    private Integer userId;
    private Integer queryCallId;
    private String companyName;
    private String callPriceMoney;
    private String callSubmitDeadline;
    private BigDecimal vilationMoneyAmount;
    private BigDecimal prepayedMoneyAmount;
    private String callPurity;
    private Integer certificateId;
    public String getSubmitDeadline1(){
        return callSubmitDeadline.contains("周") ? callSubmitDeadline : callSubmitDeadline + "周";
    }
}
