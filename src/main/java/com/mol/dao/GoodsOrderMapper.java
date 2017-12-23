package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.dto.GoodsOrderDTO;
import com.mol.entity.GoodsOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2017/11/5.
 */
public interface GoodsOrderMapper extends BaseDao<GoodsOrder, String> {
    /**
     * 根据订单状态查询我购买的订单
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param state
     * @return
     */
    List<GoodsOrderDTO> listMyPurchaseOrdersWithStatus(@Param("orderColumn") String orderColumn,
                                                       @Param("orderType")String orderType,
                                                       @Param("searchKey") String searchKey,
                                                       @Param("userId") Integer userId,
                                                       @Param("state") String state);

    int updateGoodsOrderState(@Param("goodsOrderId") String goodsOrderId, @Param("state") String state);

    List<GoodsOrderDTO> listMySendOrdersWithStatus(@Param("orderColumn") String orderColumn,
                                                       @Param("orderType")String orderType,
                                                       @Param("searchKey") String searchKey,
                                                       @Param("userId") Integer sellerId,
                                                       @Param("state") String state);
}
