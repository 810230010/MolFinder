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
    public RestResult loginUser(String phone, String password, String checkCode, HttpServletRequest request) {
        //检验验证码
        RestResult result = new RestResult();
        String code = (String) request.getSession().getAttribute("CHECK_CODE");
        if(!code.equals(checkCode)){
            result = new RestResult("验证码错误", GlobalConstant.WRONG_CHECK_CODE);
            return result;
        }
        User user = userMapper.selectUserByPhoneAndPassword(phone, password);

        if(user == null){
            result = new RestResult("用户名或密码错误", GlobalConstant.WRONG_USER_CODE);
            return result;
        }
        if(user != null && user.getState() == 0){
            result = new RestResult("您已被限制登录", GlobalConstant.FORBID_USER_CODE);
            return result;
        }
        WebUtil.registerCurrentUser(request, user);
        return result;
    }
}
