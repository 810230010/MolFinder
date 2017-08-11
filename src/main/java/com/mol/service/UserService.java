package com.mol.service;


import com.mol.common.controller.RestResult;
import com.mol.entity.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    /**
     * 根据用户id得到用户
     * @param userId
     * @return
     */
    User getUserById(Integer userId);

    /**
     * 注册用户
     * @param user
     * @return
     */
    RestResult registerUser(User user);

    /**
     * 用户登录验证
     * @param phone
     * @param password
     * @return
     */
    RestResult loginUser(String phone, String password, HttpServletRequest request);
}
