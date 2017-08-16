package com.mol.service.impl;

import com.mol.common.GlobalConstant;
import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.dao.UserMapper;
import com.mol.entity.User;
import com.mol.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by 江建平 on 2017/8/10.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User getUserById(Integer userId) {
        return null;
    }

    @Override
    public RestResult registerUser(User user) {
        User user1 = userMapper.selectUserByPhone(user.getPhone());
        RestResult result = new RestResult();
        if(user1 != null){
            result = new RestResult("该手机已注册", GlobalConstant.REGISTER_ERROR);
            return result;
        }
        user.setCreateTime(new Date());
        userMapper.insertSelective(user);
        return result;
    }

    @Override
    public RestResult loginUser(String phone, String password, HttpServletRequest request) {
        User user = userMapper.selectUserByPhoneAndPassword(phone, password);
        RestResult result = new RestResult();
        if(user == null){
            result = new RestResult("用户名或密码错误", GlobalConstant.WRONG_USER_CODE);
            return result;
        }
        WebUtil.registerCurrentUser(request, user);
        return result;
    }
}
