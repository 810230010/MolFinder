package com.mol.service.impl;

import com.mol.common.util.DateUtil;
import com.mol.dao.AcceptAddressMapper;
import com.mol.dto.AcceptGoodsAddressInfo;
import com.mol.entity.AcceptAddress;
import com.mol.service.AcceptAddressService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2017/10/29.
 */
@Service
public class AcceptAddressServiceImpl implements AcceptAddressService {
    private static Logger logger = Logger.getLogger(AcceptAddressServiceImpl.class);
    @Autowired
    private AcceptAddressMapper acceptAddressMapper;
    @Override
    public List<AcceptGoodsAddressInfo> listAcceptAddress(Integer userId) {
        return acceptAddressMapper.listAcceptGoodsAddressByUserId(userId);
    }

    @Override
    public int addAcceptAddress(AcceptAddress acceptAddress) {
        acceptAddress.setAddTime(DateUtil.convertCurrentDatetimeToString());
        acceptAddress.setUpdateTime(DateUtil.convertCurrentDatetimeToString());
        return acceptAddressMapper.insertSelective(acceptAddress);
    }

    @Override
    public int deleteAcceptAddress(Integer addressId) {
        return acceptAddressMapper.deleteByPrimaryKey(addressId);
    }
}
