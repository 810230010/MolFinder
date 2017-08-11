package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;

import java.util.List;

/**
 * Created by 江建平 on 2017/8/10.
 */
public interface QueryOrderMapper extends BaseDao<QueryOrder, Integer> {
    /**
     * 查询首页的询单列表
     * @return
     */
    List<QueryOrder> getQueryOrderList();
}
