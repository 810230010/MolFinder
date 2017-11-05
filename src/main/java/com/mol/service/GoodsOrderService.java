package com.mol.service;

import com.mol.entity.GoodsOrder;

/**
 * Created by usher on 2017/11/5.
 */
public interface GoodsOrderService {
    /**
     * 创建订单
     * @param goodsOrder
     * @return
     */
    int createOrderBill(GoodsOrder goodsOrder);
}
