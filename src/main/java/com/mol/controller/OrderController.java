package com.mol.controller;

import com.mol.common.controller.RestResult;
import com.mol.common.util.WebUtil;
import com.mol.dto.AcceptGoodsAddressInfo;
import com.mol.dto.RealCallpriceDetailDTO;
import com.mol.entity.AcceptAddress;
import com.mol.service.AcceptAddressService;
import com.mol.service.RealOrderCallpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private AcceptAddressService acceptAddressService;
    @Autowired
    private RealOrderCallpriceService realOrderCallpriceService;
    /**
     *
     * 跳转到实单下单页面
     * @return
     */
    @RequestMapping("/realMakeOrderPage")
    public String view2RealMakeOrder(HttpServletRequest request, Model model, Integer realCallId, Integer realOrderId){
        RealCallpriceDetailDTO realCallpriceDetailDTO = realOrderCallpriceService.getRealCallpriceDetail(realCallId, realOrderId);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<AcceptGoodsAddressInfo> list = acceptAddressService.listAcceptAddress(userId);
        model.addAttribute("addressList", list);
        model.addAttribute("realCallpriceDetail", realCallpriceDetailDTO);
        return "real_make_order";
    }

    /**
     * 跳转到添加收货地址页面
     * @return
     */
    @RequestMapping("/addAcceptOrderAddressPage")
    public String view2addAdress(AcceptAddress acceptAddress){

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
         List<AcceptGoodsAddressInfo> acceptGoodsAddressInfoList = acceptAddressService.listAcceptAddress(userId);
         return acceptGoodsAddressInfoList;
    }

    /**
     * 添加收货地址
     * @param acceptAddress
     * @return
     */
    @RequestMapping("/addAcceptOrderAddress")
    @ResponseBody
    public Object addAcceptAddress(AcceptAddress acceptAddress){
        RestResult result = new RestResult();
        acceptAddressService.addAcceptAddress(acceptAddress);
        return result;
    }

    /**
     * 删除收货地址
     * @param addressId
     * @return
     */
    @RequestMapping("/deleteAcceptAddress")
    @ResponseBody
    public Object deleteAcceptAddress(@RequestParam("id") Integer addressId){
        RestResult result = new RestResult();
        int affectedRow = acceptAddressService.deleteAcceptAddress(addressId);
        return result;
    }
}

