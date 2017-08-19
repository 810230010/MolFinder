package com.mol.controller;

import com.mol.common.controller.RestResult;
import com.mol.common.util.PropertyReader;
import com.mol.common.util.RequestUtil;
import com.mol.entity.RealOrder;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/enquiry")
public class EnquiryController {

    /**
     * 跳转到询单发布页面
     * @return
     */
    @RequestMapping("/enquiryPublishPage")
    public String view2enquiryPublish(){
        return "enquiry_publish";
    }

    /**
     * 发布询单
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/publishEnquiry")
    @ResponseBody
    public Object publishEnquiry(@RequestParam("previewImg")MultipartFile file, HttpServletRequest request){
        RestResult result = new RestResult();
        return result;
    }
}
