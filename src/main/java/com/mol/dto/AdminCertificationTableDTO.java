package com.mol.dto;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by usher on 2018/5/23.
 */
@Data
public class AdminCertificationTableDTO {
    private Integer certificateId;
    private Integer userId;
    private String certificateType;
    private String phone;
    private Date createTime;
    private String createTime1;
    private String IDNumber;
    private String realname;
    private String isPass;

    public String getCertificateType() {
        if("COMPANY".equals(certificateType))
            return "公司";
        return "个人实验室";
    }

    public String getCreateTime1() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(createTime);
    }

    public String getPass() {
        if("CHECKING".equals(isPass))
            return "待审核";
        if("PASS".equals(isPass))
            return "审核通过";
        return "审核未通过";
    }
}
