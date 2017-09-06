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
    private Integer certificateId;

}
