package com.mol.dao.admin;

import com.mol.entity.admin.Admin;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

/**
 * Created by usher on 2018/5/22.
 */
public interface AdminLoginMapper {
    /**
     * 管理员登录验证
     * @param adminName
     * @param adminPass
     * @return
     */
    Admin queryAdmin(@Param("adminName") String adminName, @Param("adminPass") String adminPass);
}
