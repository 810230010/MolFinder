package com.mol.dto;

import lombok.Data;

import java.util.Date;

/**
 * Created by usher on 2017/11/11.
 */
@Data
public class QueryCallpriceDetailDTO {
    private Integer queryCallId;

    private Integer queryOrderId;

    private Integer userId;
    private String casNo;
    private String englishName;
    private String chineseName;
    private String image;
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
    private String expressType;
}
