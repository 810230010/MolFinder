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

    /**
     * 查询当前用户发布的正在抢单状态的实单
     * @param orderColumn
     * @param orderType
     * @param userId
     * @return
     */
    List<RealOrder> listRealOrderByUserId(@Param("orderColumn") String orderColumn,
                                          @Param("orderType") String orderType,
                                          @Param("searchKey") String searchKey,
                                          @Param("userId") Integer userId);

    /**
     * 查询当前用户发布的已派单的实单
     * @param orderColumn
     * @param orderType
     * @param userId
     * @return
     */
    List<RealOrder> listRealOrderSendedByUserId(@Param("orderColumn") String orderColumn,
                                                @Param("orderType") String orderType,
                                                @Param("searchKey") String searchKey,
                                                @Param("userId") Integer userId);

    /**
     * 查询当前用户发布的停止抢单的实单
     * @param orderColumn
     * @param orderType
     * @param userId
     * @return
     */
    List<RealOrder> listRealOrderStoppedByUserId(@Param("orderColumn") String orderColumn,
                                                @Param("orderType") String orderType,
                                                @Param("searchKey") String searchKey,
                                                @Param("userId") Integer userId);
    /**
     * 查询当前用户发布的已成单的实单
     * @param orderColumn
     * @param orderType
     * @param userId
     * @return
     */
    List<RealOrder> listRealOrderSuccessByUserId(@Param("orderColumn") String orderColumn,
                                                 @Param("orderType") String orderType,
                                                 @Param("searchKey") String searchKey,
                                                 @Param("userId") Integer userId);

    /**
     * 根据状态查询当前用户发布的实单
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param userId
     * @param status
     * @return
     */
    List<RealOrder> listRealOrderWithStatus(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType, @Param("searchKey") String searchKey, @Param("userId") Integer userId, @Param("status") String status);

    /**
     * 改变实单状态
     * @param realOrderId
     * @param state
     * @return
     */
    int changeRealOrderState(@Param("realOrderId") Integer realOrderId, @Param("state") String state);
}
