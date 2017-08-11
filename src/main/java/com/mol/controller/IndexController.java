package com.mol.controller;

import com.mol.common.util.WebUtil;
import com.mol.entity.User;
import com.mol.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private IndexService indexService;
    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping("/indexPage")
    public String view2index(HttpServletRequest request, Model model){
        model.addAttribute("realList", indexService.getRealOrderOfIndex());
        model.addAttribute("queryList", indexService.getQueryOrderOfIndex());
        return "/index";
    }
}
