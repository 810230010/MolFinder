package com.mol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by usher on 2017/9/5.
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
    /**
     * 企业门户网站
     * @return
     */
    @RequestMapping("/companyDetailPage")
    public String view2companyDetail(Integer certificateId){
        return "company_detail";
    }
}
