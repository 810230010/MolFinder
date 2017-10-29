package com.mol.controller;

import com.mol.dto.AcceptGoodsAddressInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    /**
     *
     * 跳转到实单下单页面
     * @return
     */
    @RequestMapping("/realMakeOrderPage")
    public String view2RealMakeOrder(Integer realCallId){
        return "real_make_order";
    }

    /**
     * 跳转到添加收货地址页面
     * @return
     */
    @RequestMapping("/addAcceptOrderAddress")
    public String view2addAdress(){
        return "add_address";
    }

    /**
     * 获得收货地址列表
     * @param userId
     * @return
     */
    @RequestMapping("/getAcceptGoodsAddress")
    @ResponseBody
    public List getAcceptGoodsAddress(Integer userId){
         List<AcceptGoodsAddressInfo> acceptGoodsAddressInfoList = new ArrayList<>();
         return acceptGoodsAddressInfoList;
    }
}
