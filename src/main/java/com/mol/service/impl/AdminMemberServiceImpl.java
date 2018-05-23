package com.mol.service.impl;

import com.github.pagehelper.PageHelper;
import com.mol.common.GlobalConstant;
import com.mol.common.controller.RestResult;
import com.mol.dao.admin.AdminMemberMapper;
import com.mol.entity.admin.AdminMemberDTO;
import com.mol.service.admin.AdminMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
@Service
public class AdminMemberServiceImpl implements AdminMemberService {
    @Autowired
    private AdminMemberMapper adminMemberMapper;
    @Override
    public List<AdminMemberDTO> searchNormalMembers(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminMemberMapper.listNormalMembers(searchKey, orderColumn, orderType);
    }

    @Override
    public RestResult forbidMember(int userId) {
        RestResult result = null;
        int row = adminMemberMapper.forbidMember(userId);
        if(row != 1){
            result = new RestResult("拉黑失败", GlobalConstant.UPDATE_ERROR_CODE);
        }else{
            result = new RestResult();
        }
        return result;
    }

    @Override
    public List<AdminMemberDTO> searchForbiddenMembers(Integer page, Integer pageSize, String searchKey, String orderColumn, String orderType) {
        PageHelper.startPage(page, pageSize);
        return adminMemberMapper.listForbiddenMembers(searchKey, orderColumn, orderType);
    }

    @Override
    public RestResult recoverMember(int userId) {
        RestResult result = null;
        int row = adminMemberMapper.recoverMember(userId);
        if(row != 1){
            result = new RestResult("恢复失败", GlobalConstant.UPDATE_ERROR_CODE);
        }else{
            result = new RestResult();
        }
        return result;
    }
}
