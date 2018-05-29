package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.dao.CertificationMapper;
import com.mol.dao.UserMapper;
import com.mol.dao.admin.AdminCertificationMapper;
import com.mol.dto.AdminCertificationTableDTO;
import com.mol.entity.Certification;
import com.mol.entity.User;
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
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CertificationMapper certificationMapper;
    @Override
    public List<AdminCertificationTableDTO> searchCertificated(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminCertificationMapper.listCertificated(searchKey, orderColumn, orderType);
    }

    @Override
    public List<AdminCertificationTableDTO> searchCertificating(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminCertificationMapper.listCertificating(searchKey, orderColumn, orderType);
    }

    @Override
    public RestResult updateCertificationState(Integer certificateId, String state) {
        RestResult result = new RestResult();
        Certification certification = certificationMapper.selectByPrimaryKey(certificateId);
        int userId = certification.getUserId();
        int row = adminCertificationMapper.updateCertificationState(certificateId, state);
        userMapper.updateUserCertificateState(userId, state);
        return result;
    }
}
