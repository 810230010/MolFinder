package com.mol.controller;

import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.mol.common.controller.RestResult;
import com.mol.common.qiniu.QiniuUtil;
import com.mol.common.util.PropertyReader;
import com.mol.common.util.RequestUtil;
import com.mol.entity.RealOrder;
import com.mol.service.RealService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Enumeration;
import java.util.UUID;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/real")
public class RealController {
    @Autowired
    private RealService realService;
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

}
