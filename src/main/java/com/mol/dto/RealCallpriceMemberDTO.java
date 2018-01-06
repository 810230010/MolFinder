package com.mol.dto;

import com.mol.common.GlobalConstant;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by usher on 2017/9/4.
 */
@Getter
@Setter
public class RealCallpriceMemberDTO{
    private Integer realOrderId;
    private Integer userId;
    private Integer realCallId;
    private String companyName;
    private String callPriceAmount;
    private String callPriceMoney;
    private String callSubmitDeadline;
    private BigDecimal vilationMoneyAmount;
    private BigDecimal prepayedMoneyAmount;
    private String callPurity;
    private Integer certificateId;
    private List<String> callPriceCompleted;

    public String getSubmitDeadline1(){
        return callSubmitDeadline.contains("周") ? callSubmitDeadline : callSubmitDeadline + "周";
    }
}
