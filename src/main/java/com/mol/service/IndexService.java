package com.mol.service;

import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;

import java.util.List;

/**
 * Created by 江建平 on 2017/8/10.
 */
public interface IndexService {
    /**
     * 查询首页实单前六条记录
     * @return
     */
    List<RealOrder> getRealOrderOfIndex();

    /**
     * 查询首页询单前六条记录
     * @return
     */
    List<QueryOrder> getQueryOrderOfIndex();
}
