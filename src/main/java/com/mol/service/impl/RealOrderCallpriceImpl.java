package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.dao.RealOrderCallpriceMapper;
import com.mol.dto.RealOrderCallpriceDTO;
import com.mol.entity.RealOrderCallprice;
import com.mol.service.RealOrderCallpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2017/8/28.
 */
@Service
public class RealOrderCallpriceImpl implements RealOrderCallpriceService {
    @Autowired
    private RealOrderCallpriceMapper realOrderCallpriceMapper;
    @Override
    public List<RealOrderCallpriceDTO> searchCallpriceRealOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status) {
        PageHelper.startPage(page, pageSize);
        return realOrderCallpriceMapper.listCallpriceRealOrdersWithStatus(orderColumn, orderType, searchKey, userId, status);
    }
}
