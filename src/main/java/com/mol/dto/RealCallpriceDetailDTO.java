package com.mol.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Setter
@Getter
public class RealCallpriceDetailDTO {
    private Integer realCallId;
    private Integer realOrderId;
    private Integer userId;
    private String casNo;
    private String englishName;
    private String chineseName;
    private String image;
    private String callPriceMoney;

    private String callPriceAmount;

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
    private List<String> realCallpriceCompleted;
}
