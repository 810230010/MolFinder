package com.mol.service;

import com.mol.dto.AcceptGoodsAddressInfo;
import com.mol.entity.AcceptAddress;

import java.util.List;

/**
 * Created by usher on 2017/10/29.
 */
public interface AcceptAddressService {
    /**
     * 获得收货地址列表
     * @param userId
     * @return
     */
    List<AcceptGoodsAddressInfo> listAcceptAddress(Integer userId);

    /**
     * 添加收货地址
     * @param acceptAddress
     * @return
     */
    int addAcceptAddress(AcceptAddress acceptAddress);

    /**
     * 删除收获地址
     * @param address
     * @return
     */
    int deleteAcceptAddress(Integer address);
}
