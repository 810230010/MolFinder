package com.mol.controller;

import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.mol.common.controller.PageResult;
import com.mol.common.controller.RestResult;
import com.mol.common.qiniu.QiniuUtil;
import com.mol.common.util.PropertyReader;
import com.mol.common.util.RequestUtil;
import com.mol.common.util.StringUtils;
import com.mol.common.util.WebUtil;
import com.mol.dto.QueryOrderCallpriceDTO;
import com.mol.dto.RealCallpriceMemberDTO;
import com.mol.entity.RealOrder;
import com.mol.service.RealOrderCallpriceService;
import com.mol.service.RealService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/real")
public class RealController {
    @Autowired
    private RealService realService;
    @Autowired
    private RealOrderCallpriceService realOrderCallpriceService;
    /**
     * 跳转到实单发布页面
     * @return
     */
    @RequestMapping("/realPublishPage")
    public String view2enquiryPublish(Model model){
        model.addAttribute("uploadToken", QiniuUtil.getUploadToken());
        model.addAttribute("baseUrl", QiniuUtil.getBaseUrl());
        return "real_publish";
    }

    /**
     * 实单详情页面
     * @return
     */
    @RequestMapping("/realDetailPage")
    public String view2realDetail(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_detail";
    }

    /**
     * 实单详情页面
     * @return
     */
    @RequestMapping("/realCallpriceMembersPage")
    public String view2realCallpriceMember(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_call_price";
    }
    /**
     * 发布实单
     * @param
     * @return
     */
    @RequestMapping("/publishReal")
    @ResponseBody
    public Object publishReal(@RequestParam("previewImg")MultipartFile file,HttpServletRequest request) throws IOException{
        RestResult result = new RestResult();
        RealOrder realOrder = RequestUtil.request2Bean(request, RealOrder.class);
        String docPath = PropertyReader.getProperty("docPath");
        String originalFilename = file.getOriginalFilename();
        String fileSuffix = originalFilename.substring(
                originalFilename.lastIndexOf(".")).toLowerCase();
        String newFile = UUID.randomUUID().toString().replace("-", "") + fileSuffix;
        realOrder.setImage(newFile);
        int affectedRows = realService.publishReal(realOrder);
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(docPath, newFile));
        return result;
    }

    /**
     * 实单报价简介
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/getRealCallpriceMembers")
    @ResponseBody
    public Object getRealCallpriceDetail(@RequestParam("draw") int draw,
                                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                         @RequestParam(value = "orderType", required = false) String orderType,
                                         @RequestParam(value = "searchKey", required = false) String searchKey,
                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                         @RequestParam(value = "realOrderId") Integer realOrderId){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<RealCallpriceMemberDTO> realOrders = realOrderCallpriceService.searchCallpriceRealOrdersMembers(page, pageSize, orderColumn, orderType, searchKey, realOrderId);
        return new PageResult<RealCallpriceMemberDTO>(realOrders, draw);
    }

}
