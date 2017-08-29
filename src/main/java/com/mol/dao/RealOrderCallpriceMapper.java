package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.entity.RealOrderCallprice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2017/8/28.
 */
public interface RealOrderCallpriceMapper extends BaseDao<RealOrderCallprice, Integer> {
    /**
     * 根据状态查询已报价实单列表
     * @param orderColumn
     * @param orderType
     * @param orderType
     * @param userId
     * @param status
     * @return
     */
    List<RealOrderCallprice> listCallpriceRealOrdersWithStatus(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType, @Param("searchKey") String searchKey, Integer userId, String status);
}
