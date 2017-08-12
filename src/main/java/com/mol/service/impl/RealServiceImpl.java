package com.mol.service.impl;

import com.mol.dao.RealOrderMapper;
import com.mol.dto.RealDetailDTO;
import com.mol.service.RealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
