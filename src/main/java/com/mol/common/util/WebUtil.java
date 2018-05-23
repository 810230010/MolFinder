package com.mol.common.util;

import com.mol.entity.User;
import com.mol.entity.admin.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 江建平 on 2017/8/9.
 */
public class WebUtil {

    //用户登陆成功储存当前用户
    public static void registerCurrentUser(HttpServletRequest request, User user){
        HttpSession session = request.getSession();
        session.setAttribute("currentUser", user);
    }
    //用户登陆成功储存当前用户
    public static void registerCurrentAdmin(HttpServletRequest request, Admin user){
        HttpSession session = request.getSession();
        session.setAttribute("currentAdmin", user);
    }

    //得到当前用户
    public static User getCurrentUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        return user;
    }

    //注销
    public static void logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
    }

    public static Admin getCurrentAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Admin user = (Admin)session.getAttribute("currentAdmin");
        return user;
    }
}
