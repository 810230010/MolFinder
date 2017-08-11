package com.mol.dto;

import lombok.Data;

import java.util.Date;

/**
 * Created by 江建平 on 2017/8/11.
 */
@Data
public class RealDetailDTO {
    private Integer realOrderId;
    private Integer userId;
    private String casNo;
    private String englishName;
    private String chineseName;
    private String buyAmount;
    private String purity;
    private String priceBetween;
    private String submitDeadline;
    private Date beginTime;
    private Date endTime;
    private String diagramRequire;
    private Boolean makeBill;
    private String image;
    private String referDoc;
    private Integer joinCount;
}
