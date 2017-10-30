package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.dto.AcceptGoodsAddressInfo;
import com.mol.entity.AcceptAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2017/10/29.
 */
public interface AcceptAddressMapper extends BaseDao<AcceptAddress, Integer> {
    /**
     * 获得收货地址列表
     * @param userId
     * @return
     */
    List<AcceptGoodsAddressInfo> listAcceptGoodsAddressByUserId(@Param("userId") Integer userId);
}
