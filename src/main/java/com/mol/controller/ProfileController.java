package com.mol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by usher on 2017/8/17.
 */
@Controller
@RequestMapping("/profile")
public class ProfileController
{
    /**
     * 跳转到我的定制合成页面
     * @return
     */
    @RequestMapping("/profilePage")
    public String view2profilePage(){
        return "profile/left_nav";
    }

    /**
     * 我发布的实单页面
     * @return
     */
    @RequestMapping("/myRealSendPage")
    public String view2myRealSend(){
        return "profile/my_real_send";
    }
}
