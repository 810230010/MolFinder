package com.mol.service;

import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;

/**
 * Created by 江建平 on 2017/8/11.
 */
public interface RealService {
    /**
     * 得到实弹详情
     * @param realOrderId
     * @return
     */
    RealDetailDTO getRealDetail(Integer realOrderId);

    /**
     * 发布实单
     * @param realOrder
     * @return
     */
    int publishReal(RealOrder realOrder);
}
