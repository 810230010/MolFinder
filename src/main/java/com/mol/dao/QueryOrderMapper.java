package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

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

    /**
     * 根据状态查询我的询单的列表
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param status
     * @return
     */
    List<QueryOrder> listQueryOrdersWithStatus(@Param("orderColumn") String orderColumn,
                                               @Param("orderType") String orderType,
                                               @Param("searchKey") String searchKey,
                                               @Param("userId") Integer userId,
                                               @Param("status") String status);

    int changeQueryOrderState(@Param("queryOrderId") Integer queryOrderId, @Param("state") String state);
}
