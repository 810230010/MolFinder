package com.mol.entity;


import com.mol.common.util.JsonDateSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;


import java.util.Date;

public class RealOrder {
    private Integer realOrderId;

    private Integer sellerId;
    private Integer buyerId;

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

    private Double guaranteeMoneyPercent;

    private Double rewardMoneyPercent;

    private String image;

    private String referDoc;

    private String remark;

    private Integer joinCount;

    private String state;

    public Integer getRealOrderId() {
        return realOrderId;
    }

    public void setRealOrderId(Integer realOrderId) {
        this.realOrderId = realOrderId;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public String getCasNo() {
        return casNo;
    }

    public void setCasNo(String casNo) {
        this.casNo = casNo == null ? null : casNo.trim();
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName == null ? null : englishName.trim();
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName == null ? null : chineseName.trim();
    }

    public String getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(String buyAmount) {
        this.buyAmount = buyAmount == null ? null : buyAmount.trim();
    }

    public String getPurity() {
        return purity;
    }

    public void setPurity(String purity) {
        this.purity = purity == null ? null : purity.trim();
    }

    public String getPriceBetween() {
        return priceBetween;
    }

    public void setPriceBetween(String priceBetween) {
        this.priceBetween = priceBetween == null ? null : priceBetween.trim();
    }

    public String getSubmitDeadline() {
        return submitDeadline;
    }

    public void setSubmitDeadline(String submitDeadline) {
        this.submitDeadline = submitDeadline == null ? null : submitDeadline.trim();
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    @JsonSerialize(using= JsonDateSerializer.class)
    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getDiagramRequire() {
        return diagramRequire;
    }

    public void setDiagramRequire(String diagramRequire) {
        this.diagramRequire = diagramRequire == null ? null : diagramRequire.trim();
    }

    public String getMakeBill() {
        return makeBill;
    }

    public void setMakeBill(String makeBill) {
        this.makeBill = makeBill == null ? null : makeBill.trim();
    }

    public Double getGuaranteeMoneyPercent() {
        return guaranteeMoneyPercent;
    }

    public void setGuaranteeMoneyPercent(Double guaranteeMoneyPercent) {
        this.guaranteeMoneyPercent = guaranteeMoneyPercent;
    }

    public Double getRewardMoneyPercent() {
        return rewardMoneyPercent;
    }

    public void setRewardMoneyPercent(Double rewardMoneyPercent) {
        this.rewardMoneyPercent = rewardMoneyPercent;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getReferDoc() {
        return referDoc;
    }

    public void setReferDoc(String referDoc) {
        this.referDoc = referDoc == null ? null : referDoc.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getJoinCount() {
        return joinCount;
    }

    public void setJoinCount(Integer joinCount) {
        this.joinCount = joinCount;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}