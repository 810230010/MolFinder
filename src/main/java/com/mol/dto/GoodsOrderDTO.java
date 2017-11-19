package com.mol.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * Created by usher on 2017/11/18.
 */
@Data
public class GoodsOrderDTO {
    private String goodsOrderId;
    private String companyName;
    private BigDecimal orderPrice;
    private String casNo;
    private String chineseName;
    private String createTime;
    private String expressWay;
    private String orderType;
    private String makeBill;
    private String image;

    public String getOrderType() {
        if(orderType.equals("QUERY"))
            return "询单";
        return "实单";
    }

}
