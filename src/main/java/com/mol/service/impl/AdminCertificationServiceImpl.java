package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.dao.admin.AdminCertificationMapper;
import com.mol.dto.AdminCertificationTableDTO;
import com.mol.entity.admin.AdminMemberDTO;
import com.mol.service.admin.AdminCertificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
@Service
public class AdminCertificationServiceImpl implements AdminCertificationService {
    @Autowired
    private AdminCertificationMapper adminCertificationMapper;
    @Override
    public List<AdminCertificationTableDTO> searchCertificated(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminCertificationMapper.listCertificated(searchKey, orderColumn, orderType);
    }
}
