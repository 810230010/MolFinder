package com.mol.entity;

import java.util.Date;

public class QueryOrder {
    private Integer queryOrderId;

    private Integer userId;

    private String casNo;

    private String englishName;

    private String chineseName;

    private String purity;

    private String buyAmount;

    private String submitDeadline;

    private String diagramRequire;

    private Double guaranteeMoneyPercent;

    private Double rewardMoneyPercent;

    private Date beginTime;

    private Date endTime;

    private String otherRequire;

    private String image;

    private String referDoc;

    private String makeBill;

    private Integer joinCount;

    private String state;

    public Integer getQueryOrderId() {
        return queryOrderId;
    }

    public void setQueryOrderId(Integer queryOrderId) {
        this.queryOrderId = queryOrderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public String getPurity() {
        return purity;
    }

    public void setPurity(String purity) {
        this.purity = purity == null ? null : purity.trim();
    }

    public String getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(String buyAmount) {
        this.buyAmount = buyAmount == null ? null : buyAmount.trim();
    }

    public String getSubmitDeadline() {
        return submitDeadline;
    }

    public void setSubmitDeadline(String submitDeadline) {
        this.submitDeadline = submitDeadline == null ? null : submitDeadline.trim();
    }

    public String getDiagramRequire() {
        return diagramRequire;
    }

    public void setDiagramRequire(String diagramRequire) {
        this.diagramRequire = diagramRequire == null ? null : diagramRequire.trim();
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

    public String getOtherRequire() {
        return otherRequire;
    }

    public void setOtherRequire(String otherRequire) {
        this.otherRequire = otherRequire == null ? null : otherRequire.trim();
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

    public String getMakeBill() {
        return makeBill;
    }

    public void setMakeBill(String makeBill) {
        this.makeBill = makeBill == null ? null : makeBill.trim();
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