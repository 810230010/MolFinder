package com.mol.controller;

import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.entity.User;
import com.mol.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 江建平 on 2017/7/9.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private static Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    /**
     * 注册页面
     * @return
     */
    @RequestMapping("/registerPage")
    public String view2register(){
        return "registery";
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public Object register(User user){
        RestResult result = userService.registerUser(user);
        return result;
    }

    /**
     * 登录页面
     * @return
     */
    @RequestMapping("/loginPage")
    public String view2login(){
        return "login";
    }

    /**
     * 登录验证
     * @param phone
     * @param password
     * @return
     */
    @RequestMapping("/checkLogin")
    @ResponseBody
    public Object userLogin(String phone, String password, HttpServletRequest request){
        RestResult result = userService.loginUser(phone, password, request);
        User currentUser = WebUtil.getCurrentUser(request);
        return result;
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        WebUtil.logout(request);
        return "redirect:/index/indexPage";
    }
}
