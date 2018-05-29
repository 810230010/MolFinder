package com.mol.controller;

import com.mol.common.util.WebUtil;
import com.mol.dao.CertificationMapper;
import com.mol.entity.Certification;
import com.mol.entity.User;
import com.mol.entity.admin.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 江建平 on 2017/7/24.
 */
@ControllerAdvice(basePackages = {"com.mol.controller"})
public class AdminGlobalHandler {
    @Autowired
    private CertificationMapper certificationMapper;
    @ModelAttribute("currentUser")
    public User setCurrentUser(HttpServletRequest request){
        User currentUser = WebUtil.getCurrentUser(request);
        if(currentUser != null){
            Certification certification = certificationMapper.queryUserCertificateState(currentUser.getUserId());
            if(certification == null)
                currentUser.setIsCertificated(false);
            else if(certification.getIsPass().equals("PASS"))
                currentUser.setIsCertificated(true);
            else if(certification.getIsPass().equals("NOTPASS"))
                currentUser.setIsCertificated(false);
        }
        return currentUser;
   }
    @ModelAttribute("currentAdmin")
    public Admin setCurrentAdmin(HttpServletRequest request){
        Admin currentAdmin = WebUtil.getCurrentAdmin(request);
        return currentAdmin;
    }

}
