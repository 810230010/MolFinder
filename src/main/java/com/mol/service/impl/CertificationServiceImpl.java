package com.mol.service.impl;

import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.dao.CertificationMapper;
import com.mol.entity.Certification;
import com.mol.entity.User;
import com.mol.service.CertificationService;
import com.mol.service.admin.AdminCertificationService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by usher on 2017/9/3.
 */
@Service
public class CertificationServiceImpl implements CertificationService {
    private static Logger logger = Logger.getLogger(CertificationServiceImpl.class);
    @Autowired
    private CertificationMapper certificationMapper;
    @Autowired
    private AdminCertificationService adminCertificationService;
    @Override
    public int addCertificateUser(Certification certification) {
        certification.setCreateTime(new Date());
        return certificationMapper.insertSelective(certification);
    }

    @Override
    public Certification getCurrentUserCertificateState(HttpServletRequest request) {
        User user = WebUtil.getCurrentUser(request);
        Integer userId = user.getUserId();
        Certification result = certificationMapper.queryUserCertificateState(userId);
        return result;
    }

    @Override
    public RestResult deleteCertification(Integer certificateId) {
        certificationMapper.deleteByPrimaryKey(certificateId);
        return new RestResult();
    }

    @Override
    public Certification getCertificationDetail(int certificateId) {
        return certificationMapper.selectByPrimaryKey(certificateId);
    }

    @Override
    public Certification getUserCertificationInfoByUserID(Integer userId) {
        return certificationMapper.queryUserCertificateState(userId);
    }
}
