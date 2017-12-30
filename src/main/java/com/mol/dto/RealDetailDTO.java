package com.mol.dto;

import com.sun.org.apache.xalan.internal.xsltc.dom.SAXImpl;
import lombok.Data;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 江建平 on 2017/8/11.
 */
@Data
public class RealDetailDTO{
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
    private String makeBill;
    private String image;
    private String referDoc;
    private Integer joinCount;
    private String remark;
    private Double guaranteeMoneyPercent;
    private Double rewardMoneyPercent;

    @JsonSerialize
    public Date getBeginTime() {
        return beginTime;
    }
}
