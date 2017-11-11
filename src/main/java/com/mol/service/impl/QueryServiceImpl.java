package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.dao.QueryOrderMapper;
import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;
import com.mol.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2017/8/26.
 */
@Service
public class QueryServiceImpl implements QueryService {
    @Autowired
    private QueryOrderMapper queryOrderMapper;
    @Override
    public List<QueryOrder> searchMyQueryOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status) {
        PageHelper.startPage(page, pageSize);
        return queryOrderMapper.listQueryOrdersWithStatus(orderColumn, orderType, searchKey, userId, status);
    }

    @Override
    public QueryOrder getQueryOrderDetail(Integer queryOrderId) {
        return queryOrderMapper.selectByPrimaryKey(queryOrderId);
    }

    @Override
    public int changeQueryOrderState(Integer queryOrderId, String state) {
        return queryOrderMapper.changeQueryOrderState(queryOrderId, state);
    }
}
