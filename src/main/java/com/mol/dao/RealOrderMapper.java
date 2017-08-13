package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.dto.RealDetailDTO;
import com.mol.entity.RealOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 江建平 on 2017/8/10.
 */
public interface RealOrderMapper extends BaseDao<RealOrder, Integer>{
    /**
     * 查询首页的实单列表
     * @return
     */
    List<RealOrder> getRealOrderList();

    /**
     * 实单详情
     * @param realOrderId
     * @return
     */
    RealDetailDTO getRealDetail(@Param("realOrderId") Integer realOrderId);
}
