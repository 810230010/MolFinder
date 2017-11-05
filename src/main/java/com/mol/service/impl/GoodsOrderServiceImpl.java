package com.mol.service.impl;

import com.mol.common.GlobalConstant;
import com.mol.common.util.DateUtil;
import com.mol.common.util.OrderUtil;
import com.mol.dao.GoodsOrderMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.entity.GoodsOrder;
import com.mol.service.GoodsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by usher on 2017/11/5.
 */
@Service
public class GoodsOrderServiceImpl implements GoodsOrderService {
    @Autowired
    private GoodsOrderMapper goodsOrderMapper;
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Override
    public int createOrderBill(GoodsOrder goodsOrder) {
        String orderId = OrderUtil.generateOrderId();
        goodsOrder.setGoodsOrderId(orderId);
        String date = DateUtil.convertCurrentDatetimeToString();
        goodsOrder.setCreateTime(date);
        realOrderMapper.changeRealOrderState(goodsOrder.getCallPriceId(), GlobalConstant.REAL_ORDER_SENDED);
        return goodsOrderMapper.insertSelective(goodsOrder);
    }
}
