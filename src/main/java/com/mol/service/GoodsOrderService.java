package com.mol.service;

import com.mol.dto.GoodsOrderDTO;
import com.mol.entity.GoodsOrder;

import java.util.List;

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


    List<GoodsOrderDTO> searchMypurchaseOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String state);

    int updateGoodsOrderState(String goodsOrderId, String state);

    List<GoodsOrderDTO> searchMySendOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String state);
}
