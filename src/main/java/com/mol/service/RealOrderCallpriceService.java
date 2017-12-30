package com.mol.service;

import com.mol.dto.RealCallpriceDetailDTO;
import com.mol.dto.RealCallpriceMemberDTO;
import com.mol.dto.RealOrderCallpriceDTO;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;

import java.util.List;

/**
 * Created by usher on 2017/8/28.
 */
public interface RealOrderCallpriceService {
    /**
     * 根据状态查询已报价实单列表
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param status
     * @return
     */
    List<RealOrderCallpriceDTO> searchCallpriceRealOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status);

    /**
     * 查询报价实单的成员
     * @param page
     * @param pageSize
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @return
     */
    List<RealCallpriceMemberDTO> searchCallpriceRealOrdersMembers(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey,Integer realOrderId);

    /**
     * 获得具体报价详情
     * @param realCallId
     * @return
     */
    RealCallpriceDetailDTO getRealCallpriceDetail(Integer realCallId, Integer realOrderId);

    /**
     * 实单报价
     * @param realOrder
     * @return
     */
    int addRealOrderCallprice(RealOrderCallprice realOrder);
}
