package com.mol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/real")
public class RealController {
    /**
     * 跳转到实单发布页面
     * @return
     */
    @RequestMapping
    public String view2enquiryPublish(){
        return "real_publish";
    }

    /**
     * 实单详情页面
     * @return
     */
    @RequestMapping("/realDetailPage")
    public String view2realDetail(){
        return "real_detail";
    }
}
