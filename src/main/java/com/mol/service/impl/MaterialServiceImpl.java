package com.mol.service.impl;

import com.mol.dao.MaterialBuyMapper;
import com.mol.entity.MaterialBuy;
import com.mol.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by usher on 2017/8/20.
 */
@Service
public class MaterialServiceImpl implements MaterialService {
    @Autowired
    private MaterialBuyMapper materialBuyMapper;
    @Override
    public int publishMeterialBuyRecord(MaterialBuy material) {
        return materialBuyMapper.insertSelective(material);
    }
}
