package com.mol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping
    public String view2enquiryPublish(){
        return "enquiry_publish";
    }
}
