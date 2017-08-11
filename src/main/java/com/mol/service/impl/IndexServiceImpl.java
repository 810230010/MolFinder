package com.mol.service.impl;

import com.mol.dao.QueryOrderMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;
import com.mol.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by 江建平 on 2017/8/10.
 */
@Service
public class IndexServiceImpl implements IndexService {
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Autowired
    private QueryOrderMapper queryOrderMapper;
    @Override
    public List<RealOrder> getRealOrderOfIndex() {
        return realOrderMapper.getRealOrderList();
    }

    @Override
    public List<QueryOrder> getQueryOrderOfIndex() {
        List<QueryOrder> list = queryOrderMapper.getQueryOrderList();
        return list;
    }
}
