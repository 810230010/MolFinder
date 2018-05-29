package com.mol.dao;

import com.mol.common.dao.BaseDao;
import com.mol.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/6.
 */

public interface UserMapper extends BaseDao<User, Integer> {
    /**
     * 根据手机号查询
     * @param phone
     * @return
     */
    User selectUserByPhone(@Param("phone") String phone);

    /**
     * 根据邮箱查询
     * @param email
     * @return
     */
    User selectUserByEmail(@Param("email") String email);

    /**
     * 验证用户登录
     * @param phone
     * @param password
     * @return
     */
    User selectUserByPhoneAndPassword(@Param("phone") String phone, @Param("password") String password);

    void updateUserCertificateState(@Param("userId") int userId, @Param("state") String state);
}
