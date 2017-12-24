package com.mol.service.impl;

import com.mol.dao.CertificationMapper;
import com.mol.entity.Certification;
import com.mol.service.CertificationService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by usher on 2017/9/3.
 */
@Service
public class CertificationServiceImpl implements CertificationService {
    private static Logger logger = Logger.getLogger(CertificationServiceImpl.class);
    @Autowired
    private CertificationMapper certificationMapper;
    @Override
    public int addCertificateUser(Certification certification) {
        certification.setCreateTime(new Date());
        return certificationMapper.insertSelective(certification);
    }
}
