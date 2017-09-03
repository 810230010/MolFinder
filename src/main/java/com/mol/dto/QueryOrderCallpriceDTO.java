package com.mol.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by usher on 2017/9/1.
 */
@Data
public class QueryOrderCallpriceDTO {
    private Integer certificateId;
    private Integer userId;
    private Integer queryCallId;
    private String companyName;
    private String casNo;
    private String callPriceMoney;
    private String callSubmitDeadline;
    private BigDecimal vilationMoneyAmount;
    private BigDecimal prepayedMoneyAmount;
    private String state;
    private Date createTime;
    private String image;
}
