package com.mol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
    /**
     *
     * 跳转到实单下单页面
     * @return
     */
    @RequestMapping("/realMakeOrderPage")
    public String view2RealMakeOrder(){
        return "real_make_order";
    }
}
