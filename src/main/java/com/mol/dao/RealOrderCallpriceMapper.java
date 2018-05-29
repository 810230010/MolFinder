package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.dto.RealCallpriceDetailDTO;
import com.mol.dto.RealCallpriceMemberDTO;
import com.mol.dto.RealOrderCallpriceDTO;
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
    List<RealOrderCallpriceDTO> listCallpriceRealOrdersWithStatus(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType, @Param("searchKey") String searchKey, @Param("userId") Integer userId, @Param("status") String status);

    /**
     * 查询报价实单的成员列表
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @return
     */
    List<RealCallpriceMemberDTO> listRealCallpriceMembers(@Param("orderColumn") String orderColumn, @Param("orderType") String orderType, @Param("searchKey") String searchKey, @Param("realOrderId") Integer realOrderId);

    /**
     * 获取实单报价详情
     * @param realCallId
     * @return
     */
    RealCallpriceDetailDTO getRealOrderCallpriceDetail(@Param("realCallId") Integer realCallId, @Param("realOrderId") Integer realOrderId);

    /**
     * 取消报价
     * @param realCallId
     * @return
     */
    int updateRealOrderCallpriceStatusWithCancel(Integer realCallId);

    int cancelAllCallprice(Integer realOrderId);

    RealOrderCallprice queryCurrentUserCallpriceState(@Param("userId") Integer userId, @Param("realOrderId") Integer realOrderId);

    void changeRealOrderCallpriceStateOfHere(@Param("realOrderId") int realOrderId, @Param("sellerId") int sellerId);
    void changeRealOrderCallpriceStateOfOther(@Param("realOrderId") int realOrderId, @Param("sellerId") int sellerId);
}
