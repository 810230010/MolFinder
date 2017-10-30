package com.mol.dto;

import lombok.Data;

@Data
public class AcceptGoodsAddressInfo {
    private Integer id;
    private Integer userId;
    private String acceptGoodsUsername;
    private String contactTel;
    private String acceptGoodsAddress;
}
