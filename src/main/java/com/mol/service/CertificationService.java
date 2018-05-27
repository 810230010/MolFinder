package com.mol.service;

import com.mol.common.controller.RestResult;
import com.mol.entity.Certification;

import javax.servlet.http.HttpServletRequest;

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

    /**
     * 当前登录用户的实名认证状态
     * @param request
     * @return
     */
    Certification getCurrentUserCertificateState(HttpServletRequest request);

    RestResult deleteCertification(Integer certificateId);

    Certification getCertificationDetail(int certificateId);

    Certification getUserCertificationInfoByUserID(Integer userId);
}
