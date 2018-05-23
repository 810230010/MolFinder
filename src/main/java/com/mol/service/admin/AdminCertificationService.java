package com.mol.service.admin;

import com.mol.dto.AdminCertificationTableDTO;
import com.mol.entity.admin.AdminMemberDTO;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
public interface AdminCertificationService {
    /**
     * 查询审核过的
     * @param page
     * @param pageSize
     * @param searchKey
     * @param orderColumn
     * @param orderType
     * @return
     */
    List<AdminCertificationTableDTO> searchCertificated(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType);
}
