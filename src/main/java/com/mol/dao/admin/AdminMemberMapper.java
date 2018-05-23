package com.mol.dao.admin;

import com.mol.entity.admin.AdminMemberDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
public interface AdminMemberMapper {
    /**
     * 管理员查询正常用户
     * @param searchKey
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<AdminMemberDTO> listNormalMembers(@Param("searchKey") String searchKey,
                                           @Param("orderColumn") String orderColumn,
                                           @Param("orderType") String orderType);

    int forbidMember(int userId);

    List<AdminMemberDTO> listForbiddenMembers(@Param("searchKey") String searchKey,
                                              @Param("orderColumn") String orderColumn,
                                              @Param("orderType") String orderType);

    int recoverMember(int userId);
}
