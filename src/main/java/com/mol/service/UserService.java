package com.mol.service;


import com.mol.entity.User;

public interface UserService {
    /**
     * 根据用户id得到用户
     * @param userId
     * @return
     */
    User getUserById(Integer userId);
}
