package com.mol.entity.admin;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by usher on 2018/5/23.
 */
@Data
public class AdminMemberDTO {
    private Integer userId;
    private String userName;
    private String email;
    private boolean stateFlag;
    private String state;
    private Date createTime;
    private String createTime1;

    public String getState() {
        if(stateFlag == true)
            return "正常";
        return "拉黑";
    }

    public String getCreateTime1() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(createTime);
    }
}
