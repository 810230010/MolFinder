package com.mol.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by usher on 2017/8/28.
 */
@Data
public class RealOrderCallpriceDTO {
    private Integer certificateId;
    private Integer realOrderId;
    private Integer userId;
    private Integer realCallId;
    private String companyName;
    private String casNo;
    private String callPriceMoney;
    private String callSubmitDeadline;
    private BigDecimal vilationMoneyAmount;
    private BigDecimal prepayedMoneyAmount;
    private String state;
    private Date createTime;
    private String image;
    public String getSubmitDeadline1(){
        return callSubmitDeadline.contains("周") ? callSubmitDeadline : callSubmitDeadline + "周";
    }
}
