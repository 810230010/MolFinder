package com.mol.service;

import com.mol.dto.QueryOrderCallpriceDTO;
import com.mol.dto.RealOrderCallpriceDTO;

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
}
