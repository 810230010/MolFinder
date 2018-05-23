package com.mol.controller.admin;

import com.mol.common.controller.PageResult;
import com.mol.common.controller.RestResult;
import com.mol.common.util.StringUtils;
import com.mol.entity.admin.AdminMemberDTO;
import com.mol.service.admin.AdminMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
    @Autowired
    private AdminMemberService adminMemberService;
    /**
     * 正常用户列表页面
     * @return
     */
    @RequestMapping("/normalMembers.html")
    public String viewToNormalMemberList(){
        return "admin/member/normal_member_list";
    }
    /**
     * 拉黑用户列表页面
     * @return
     */
    @RequestMapping("/forbiddenMembers.html")
    public String viewToMemberList(){
        return "admin/member/forbid_member_list";
    }

    /**
     * 列出所有正常用户
     * @return
     */
    @RequestMapping("/listNormalMembers")
    @ResponseBody
    public Object listNormalMembers( @RequestParam("draw") int draw,
                                     @RequestParam(value = "searchKey", required = false) String searchKey,
                                     @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                     @RequestParam(value = "orderType", required = false) String orderType,
                                     @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                     @RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<AdminMemberDTO> userList= adminMemberService.searchNormalMembers(page, pageSize, searchKey, orderColumn, orderType);
        return new PageResult<AdminMemberDTO>(userList, draw);
    }

    /**
     * 拉黑用户
     * @param userId
     * @return
     */
    @RequestMapping("/forbidMember")
    @ResponseBody
    public Object forbidMember(int userId){
        RestResult result = new RestResult();
        result = adminMemberService.forbidMember(userId);
        return result;
    }
    /**
     * 列出所有拉黑用户
     * @return
     */
    @RequestMapping("/listForbiddenMembers")
    @ResponseBody
    public Object listForbiddenMembers( @RequestParam("draw") int draw,
                                     @RequestParam(value = "searchKey", required = false) String searchKey,
                                     @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                     @RequestParam(value = "orderType", required = false) String orderType,
                                     @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                     @RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<AdminMemberDTO> userList= adminMemberService.searchForbiddenMembers(page, pageSize, searchKey, orderColumn, orderType);
        return new PageResult<AdminMemberDTO>(userList, draw);
    }
    /**
     * 恢复用户
     * @param userId
     * @return
     */
    @RequestMapping("/recover")
    @ResponseBody
    public Object recoverMember(int userId){
        RestResult result = new RestResult();
        result = adminMemberService.recoverMember(userId);
        return result;
    }
}
