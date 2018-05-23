package com.mol.dto;

import com.sun.org.apache.xalan.internal.xsltc.dom.SAXImpl;
import lombok.Data;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
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
    public String getSubmitDeadline1(){
        return submitDeadline.contains("周") ? submitDeadline : submitDeadline + "周";
    }
    @JsonSerialize
    public Date getBeginTime() {
        return beginTime;
    }
    public String getPurity() {
        if(purity.contains("%"))
            return purity;
        return purity.concat("%");
    }
    public String getUnit(){
        if(buyAmount.contains("g"))
            return "g";
        else if(buyAmount.contains("mg"))
            return "mg";
        else
            return "kg";
    }
    public String getBuyAmountWithoutUnit(){
        String unit = getUnit();
        return buyAmount.substring(0, buyAmount.indexOf(unit));
    }
    public String[] getPrices(){
        return priceBetween.split("-");
    }
    public String[] getDeadlines(){
        return submitDeadline.split("-");
    }

}
