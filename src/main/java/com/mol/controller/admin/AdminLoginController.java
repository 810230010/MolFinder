package com.mol.controller.admin;

import com.mol.common.controller.RestResult;
import com.mol.service.admin.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * Created by usher on 2018/5/22.
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
    @Autowired
    private AdminLoginService adminLoginService;
    /**
     * 管理员登录页面
     * @return
     */
    @RequestMapping("/page/login")
    public String viewToAdminLogin(){
        return "admin/login";
    }

    /**
     * 验证登录
     * @param adminName
     * @param adminPass
     * @return
     */
    @RequestMapping("/login/check")
    @ResponseBody
    public Object checkAdminLogin(String adminName, String adminPass, HttpServletRequest request){
        RestResult result = new RestResult();
        result = adminLoginService.checkAdminLogin(adminName, adminPass, request);
        return result;
    }

    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/page/index")
    public String viewToAdminIndex(){
        return "admin/index";
    }

    /**
     * 注销
     * @param request
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "admin/login";
    }
}
