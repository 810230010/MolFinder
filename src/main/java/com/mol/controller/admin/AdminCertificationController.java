package com.mol.controller.admin;

import com.mol.common.controller.PageResult;
import com.mol.common.util.StringUtils;
import com.mol.dto.AdminCertificationTableDTO;
import com.mol.entity.admin.AdminMemberDTO;
import com.mol.service.admin.AdminCertificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by usher on 2018/5/23.
 */
@Controller
@RequestMapping("/admin/certification")
public class AdminCertificationController {
    @Autowired
    private AdminCertificationService adminCertificationService;
    /**
     * 实名认证已审核列表页面
     * @return
     */
    @RequestMapping("/certificated.html")
    public String viewToCertificated(){
        return "admin/certification/certificated";
    }
    /**
     * 实名认证待审核列表页面
     * @return
     */
    @RequestMapping("/certificating.html")
    public String viewToCertificating(){
        return "admin/certification/certificating";
    }

    /**
     * 实名认证详情
     * @return
     */
    @RequestMapping("/certificationDetail.html")
    public String viewToCertificationDetail(int certificateId, Model model){
        model.addAttribute("", "");
        return "admin/certification/certification_detail";
    }
    /**
     * 列出所有所有认证审核完成的(包括通过和未通过)
     * @return
     */
    @RequestMapping("/listCertificated")
    @ResponseBody
    public Object listCertificated( @RequestParam("draw") int draw,
                                        @RequestParam(value = "searchKey", required = false) String searchKey,
                                        @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                        @RequestParam(value = "orderType", required = false) String orderType,
                                        @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                        @RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<AdminCertificationTableDTO> certificatedList= adminCertificationService.searchCertificated(page, pageSize, searchKey, orderColumn, orderType);
        return new PageResult<AdminCertificationTableDTO>(certificatedList, draw);
    }
}
