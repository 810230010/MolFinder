package com.mol.service;

import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;

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
}
