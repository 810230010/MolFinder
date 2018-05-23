package com.mol.service.admin;

import com.mol.common.controller.RestResult;
import com.mol.entity.admin.Admin;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by usher on 2018/5/22.
 */
public interface AdminLoginService {
    RestResult checkAdminLogin(String adminName, String adminPass, HttpServletRequest request);
}
