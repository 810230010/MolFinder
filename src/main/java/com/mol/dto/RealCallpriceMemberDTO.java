package com.mol.dto;

import com.mol.common.GlobalConstant;
import lombok.Data;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by usher on 2017/9/4.
 */
@Data
public class RealCallpriceMemberDTO {
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
    public List<String> getCallPriceCompleted(){
        List<String> result = new ArrayList<>();
        String[] amountList = callPriceAmount.split(",");
        String[] priceList = callPriceMoney.split(",");
        for(int i=0; i<amountList.length; i++){
            for(int j=0; j<priceList.length; i++){
                if(i == j){
                    result.add(amountList[i] + "/" + priceList[i]);
                    break;
                }
            }
        }
        return result;
    }
}
