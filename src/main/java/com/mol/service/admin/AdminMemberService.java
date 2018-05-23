package com.mol.service.admin;

import com.mol.common.controller.RestResult;
import com.mol.entity.admin.AdminMemberDTO;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
public interface AdminMemberService {
    /**
     * 查询正常用户列表
     * @param page
     * @param pageSize
     * @param searchKey
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<AdminMemberDTO> searchNormalMembers(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType);

    RestResult forbidMember(int userId);

    List<AdminMemberDTO> searchForbiddenMembers(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType);

    RestResult recoverMember(int userId);
}
