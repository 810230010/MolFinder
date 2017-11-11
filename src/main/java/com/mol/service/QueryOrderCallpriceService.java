package com.mol.service;

import com.mol.dto.*;

import java.util.List;

/**
 * Created by usher on 2017/9/1.
 */
public interface QueryOrderCallpriceService {
    /**
     * 根据状态查询已报价询单列表
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param status
     * @return
     */
    List<QueryOrderCallpriceDTO> searchCallpriceQueryOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status);
    /**
     * 查询报价询单的成员
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @return
     */
    List<QueryCallpriceMemberDTO> searchCallpriceQueryOrdersMembers(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer queryOrderId);
    /**
     * 获得具体报价详情
     * @param realCallId
     * @return
     */
    QueryCallpriceDetailDTO getQueryCallpriceDetail(Integer realCallId, Integer realOrderId);
}
