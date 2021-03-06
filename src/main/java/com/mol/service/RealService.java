package com.mol.service;

import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    /**
     * 根据状态查询当前用户发布的实单列表
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param status
     * @return
     */
    List<RealOrder> searchMyRealOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status);

    /**
     * 改变实单状态
     * @param realOrderId
     * @param state
     * @return
     */
    int changeRealOrderState(Integer realOrderId, String state);

    /**
     * 重新发布实单
     * @param
     * @return
     */
    int republishRealOrder(RealOrder realOrder);

    boolean getCurrentUserCallpriceState(HttpServletRequest request, Integer realOrderId);
}
