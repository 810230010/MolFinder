package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.common.GlobalConstant;
import com.mol.common.util.DateUtil;
import com.mol.common.util.OrderUtil;
import com.mol.dao.GoodsOrderMapper;
import com.mol.dao.QueryOrderMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.dto.GoodsOrderDTO;
import com.mol.entity.GoodsOrder;
import com.mol.service.GoodsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2017/11/5.
 */
@Service
public class GoodsOrderServiceImpl implements GoodsOrderService {
    @Autowired
    private GoodsOrderMapper goodsOrderMapper;
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Autowired
    private QueryOrderMapper queryOrderMapper;
    @Override
    public int createOrderBill(GoodsOrder goodsOrder) {
        String orderId = OrderUtil.generateOrderId();
        goodsOrder.setGoodsOrderId(orderId);
        String date = DateUtil.convertCurrentDatetimeToString();
        goodsOrder.setCreateTime(date);
        if(goodsOrder.getOrderType().equals("REAL")){
            realOrderMapper.changeRealOrderState(goodsOrder.getCallPriceId(), GlobalConstant.REAL_ORDER_SENDED);
        }else{
            queryOrderMapper.changeQueryOrderState(goodsOrder.getCallPriceId(), GlobalConstant.QUERY_ORDER_SENDED);
        }

        return goodsOrderMapper.insertSelective(goodsOrder);
    }

    @Override
    public List<GoodsOrderDTO> searchMypurchaseOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String state) {
        return goodsOrderMapper.listMyPurchaseOrdersWithStatus(orderColumn, orderType, searchKey, userId, state);
    }

    @Override
    public int updateGoodsOrderState(String goodsOrderId, String state) {
        return goodsOrderMapper.updateGoodsOrderState(goodsOrderId, state);
    }
}
