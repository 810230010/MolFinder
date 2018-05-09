package com.mol.controller;

import com.mol.common.controller.RestResult;
import com.mol.common.util.GraphicGenerator;
import com.mol.common.util.WebUtil;
import com.mol.entity.User;
import com.mol.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;

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
    public Object userLogin(String phone, String password, String checkCode, HttpServletRequest request){
        RestResult result = userService.loginUser(phone, password, checkCode, request);
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
    @RequestMapping("/getCheckCode")
    public void getCheckCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        final int width = 140; // 图片宽度
        final int height = 40; // 图片高度
        final String imgType = "jpeg"; // 指定图片格式 (不是指MIME类型)
        final OutputStream output = response.getOutputStream(); // 获得可以向客户端返回图片的输出流
        // (字节流)
        // 创建验证码图片并返回图片上的字符串
        String code = GraphicGenerator.createCheckCode(width, height, imgType, output);
        HttpSession session = request.getSession();
        session.setAttribute("CHECK_CODE", code);
        System.out.println("验证码内容: " + code);
    }
}
