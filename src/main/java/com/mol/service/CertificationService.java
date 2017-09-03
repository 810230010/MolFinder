package com.mol.service;

import com.mol.entity.Certification;

/**
 * Created by usher on 2017/9/3.
 */
public interface CertificationService {
    /**
     * 添加实名认证记录
     * @param certification
     * @return
     */
    int addCertificateUser(Certification certification);
}
