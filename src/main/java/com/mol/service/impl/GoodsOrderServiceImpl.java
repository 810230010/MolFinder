package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.common.GlobalConstant;
import com.mol.common.util.DateUtil;
import com.mol.common.util.OrderUtil;
import com.mol.dao.GoodsOrderMapper;
import com.mol.dao.QueryOrderMapper;
import com.mol.dao.RealOrderCallpriceMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.dto.GoodsOrderDTO;
import com.mol.entity.GoodsOrder;
import com.mol.entity.RealOrderCallprice;
import com.mol.service.GoodsOrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by usher on 2017/11/5.
 */
@Service
public class GoodsOrderServiceImpl implements GoodsOrderService {
    private static Logger logger = Logger.getLogger(GoodsOrderServiceImpl.class);
    @Autowired
    private GoodsOrderMapper goodsOrderMapper;
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Autowired
    private QueryOrderMapper queryOrderMapper;
    @Autowired
    private RealOrderCallpriceMapper realOrderCallpriceMapper;
    @Override
    public int createOrderBill(GoodsOrder goodsOrder) {
        String orderId = OrderUtil.generateOrderId();
        goodsOrder.setGoodsOrderId(orderId);
        String date = DateUtil.convertCurrentDatetimeToString();
        goodsOrder.setCreateTime(date);
        int callPriceId = goodsOrder.getCallPriceId();
        //下单，改变实单状态为已派单SEND
        if(goodsOrder.getOrderType().equals("REAL")){
            //改变实单状态为已发单
            realOrderMapper.changeRealOrderState(goodsOrder.getOrderId(), GlobalConstant.REAL_ORDER_SEND);
            //改变实单报价状态
            RealOrderCallprice callprice = realOrderCallpriceMapper.selectByPrimaryKey(callPriceId);
            int sellerId = callprice.getUserId();
            int realOrderId = callprice.getRealOrderId();
            realOrderCallpriceMapper.changeRealOrderCallpriceStateOfHere(realOrderId, sellerId);
            realOrderCallpriceMapper.changeRealOrderCallpriceStateOfOther(realOrderId, sellerId);
        }else{
            queryOrderMapper.changeQueryOrderState(goodsOrder.getOrderId(), GlobalConstant.QUERY_ORDER_SEND);
        }

        return goodsOrderMapper.insertSelective(goodsOrder);
    }

    @Override
    public List<GoodsOrderDTO> searchMypurchaseOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String state) {
        return goodsOrderMapper.listMyPurchaseOrdersWithStatus(orderColumn, orderType, searchKey, userId, state);
    }

    @Override
    public int updateGoodsOrderState(String goodsOrderId, String state) {
        Map<String, Integer> map= goodsOrderMapper.getRealOrderIdAndRealCallIdByGoodsOrderId(goodsOrderId);
        Integer realCallId = map.get("realCallId");
        Integer realOrderId = map.get("realOrderId");
        if(state.equals("SUCCESS")){
            realOrderMapper.changeRealOrderState(realOrderId, "SUCCESS");
        }else if(state.equals("SEND")){
            realOrderMapper.changeRealOrderState(realOrderId, "SEND");
        }
        return goodsOrderMapper.updateGoodsOrderState(goodsOrderId, state);
    }

    @Override
    public List<GoodsOrderDTO> searchMySendOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String state) {
        return goodsOrderMapper.listMySendOrdersWithStatus(orderColumn, orderType, searchKey, userId, state);
    }
}
