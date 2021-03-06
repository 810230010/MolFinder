package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.common.util.WebUtil;
import com.mol.dao.RealOrderCallpriceMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;
import com.mol.entity.User;
import com.mol.service.RealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 江建平 on 2017/8/11.
 */
@Service
public class RealServiceImpl implements RealService{
    @Autowired
    private RealOrderMapper realOrderMapper;
    @Autowired
    private RealOrderCallpriceMapper realOrderCallpriceMapper;
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

    @Override
    public int changeRealOrderState(Integer realOrderId, String state) {
        //如果取消实单，实单对应的报价都清零
        if(state.equals("CLOSE")){
            realOrderCallpriceMapper.cancelAllCallprice(realOrderId);
        }
        return realOrderMapper.changeRealOrderState(realOrderId, state);
    }

    @Override
    public int republishRealOrder(RealOrder realOrder) {
        realOrder.setBeginTime(new Date());
        realOrder.setState("BIDDING");
        return realOrderMapper.updateByPrimaryKeySelective(realOrder);
    }

    @Override
    public boolean getCurrentUserCallpriceState(HttpServletRequest request, Integer realOrderId) {
        User currentUser = WebUtil.getCurrentUser(request);
        if(currentUser != null){
            RealOrderCallprice flag = realOrderCallpriceMapper.queryCurrentUserCallpriceState(currentUser.getUserId(), realOrderId);
            if(flag == null)
                return false;
            return true;
        }
        return false;
    }


}
