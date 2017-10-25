package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.dao.RealOrderMapper;
import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;
import com.mol.service.RealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by 江建平 on 2017/8/11.
 */
@Service
public class RealServiceImpl implements RealService{
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Override
    public RealDetailDTO getRealDetail(Integer realOrderId) {
        return realOrderMapper.getRealDetail(realOrderId);
    }

    @Override
    public int publishReal(RealOrder realOrder) {
        realOrder.setBeginTime(new Date());
        return realOrderMapper.insertSelective(realOrder);
    }

    @Override
    public List<RealOrder> searchMyRealOrdersWithStatus(Integer page, Integer pageSize, String orderColumn, String orderType, String searchKey, Integer userId, String status) {
        PageHelper.startPage(page, pageSize);
        return realOrderMapper.listRealOrderWithStatus(orderColumn, orderType, searchKey, userId, status);
    }


}
