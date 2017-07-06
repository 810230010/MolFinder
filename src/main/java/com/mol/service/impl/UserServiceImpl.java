package com.mol.service.impl;

import com.mol.dao.UserMapper;
import com.mol.entity.User;
import com.mol.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 江建平
 * @description
 * @create 2017-07-06 16:00
 **/
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    public User getUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}
