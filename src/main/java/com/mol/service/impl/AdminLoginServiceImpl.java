package com.mol.service.impl;

import com.mol.common.GlobalConstant;
import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.dao.admin.AdminLoginMapper;
import com.mol.entity.admin.Admin;
import com.mol.service.admin.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by usher on 2018/5/22.
 */
@Service
public class AdminLoginServiceImpl implements AdminLoginService{
    @Autowired
    private AdminLoginMapper adminLoginMapper;
    @Override
    public RestResult checkAdminLogin(String adminName, String adminPass, HttpServletRequest request) {
        RestResult result = new RestResult();
        Admin queryAdminResult = adminLoginMapper.queryAdmin(adminName, adminPass);
        if(queryAdminResult == null){
            result = new RestResult("用户名或密码错误", GlobalConstant.WRONG_USER_CODE);
        }else{
            WebUtil.registerCurrentAdmin(request, queryAdminResult);
        }
        return result;
    }
}
