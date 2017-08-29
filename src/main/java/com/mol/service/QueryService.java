package com.mol.service;

import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;

import java.util.List;

/**
 * Created by usher on 2017/8/26.
 */
public interface QueryService {
    List<QueryOrder> searchMyQueryOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status);
}
