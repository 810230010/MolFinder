package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.dto.QueryOrderCallpriceDTO;
import com.mol.dto.RealOrderCallpriceDTO;
import com.mol.entity.QueryOrderCallprice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2017/9/1.
 */
public interface QueryOrderCallpriceMapper extends BaseDao<QueryOrderCallprice, Integer> {
    /**
     * 根据状态查询已报价询单列表
     * @param orderColumn
     * @param orderType
     * @param orderType
     * @param userId
     * @param status
     * @return
     */
    List<QueryOrderCallpriceDTO> listCallpriceQueryOrdersWithStatus(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType, @Param("searchKey") String searchKey, @Param("userId") Integer userId, @Param("status") String status);
}
