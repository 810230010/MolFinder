package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.dao.QueryOrderCallpriceMapper;
import com.mol.dto.QueryCallpriceDetailDTO;
import com.mol.dto.QueryCallpriceMemberDTO;
import com.mol.dto.QueryOrderCallpriceDTO;
import com.mol.service.QueryOrderCallpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2017/9/1.
 */
@Service
public class QueryOrderCallpriceImpl implements QueryOrderCallpriceService{
    @Autowired
    private QueryOrderCallpriceMapper queryOrderCallpriceMapper;
    @Override
    public List<QueryOrderCallpriceDTO> searchCallpriceQueryOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status) {
        PageHelper.startPage(page, pageSize);
        return queryOrderCallpriceMapper.listCallpriceQueryOrdersWithStatus(orderColumn, orderType, searchKey, userId, status);
    }

    @Override
    public List<QueryCallpriceMemberDTO> searchCallpriceQueryOrdersMembers(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer queryOrderId) {
       PageHelper.startPage(page, pageSize);
        return queryOrderCallpriceMapper.listQueryCallpriceMembers(orderColumn, orderType, searchKey, queryOrderId);
    }

    @Override
    public QueryCallpriceDetailDTO getQueryCallpriceDetail(Integer queryCallId, Integer queryOrderId) {
        return queryOrderCallpriceMapper.getQueryOrderCallpriceDetail(queryCallId, queryOrderId);
    }
}
