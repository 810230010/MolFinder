package com.mol.controller;

import com.mol.common.controller.PageResult;
import com.mol.common.controller.PageResult2;
import com.mol.common.controller.RestResult;
import com.mol.common.util.CommonUtil;
import com.mol.common.util.StringUtils;
import com.mol.common.util.WebUtil;
import com.mol.dto.*;
import com.mol.entity.AcceptAddress;
import com.mol.entity.GoodsOrder;
import com.mol.service.AcceptAddressService;
import com.mol.service.GoodsOrderService;
import com.mol.service.QueryOrderCallpriceService;
import com.mol.service.RealOrderCallpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.PathVariable;
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
    private HttpServletRequest request;
    @Autowired
    private AcceptAddressService acceptAddressService;
    @Autowired
    private RealOrderCallpriceService realOrderCallpriceService;
    @Autowired
    private GoodsOrderService goodsOrderService;
    @Autowired
    private QueryOrderCallpriceService queryOrderCallpriceService;
    /**
     *
     * 跳转到实单下单页面
     * @return
     */
    @RequestMapping("/realMakeOrderPage")
    public String view2RealMakeOrder(HttpServletRequest request, Model model, Integer realCallId, Integer realOrderId){
        RealCallpriceDetailDTO realCallpriceDetailDTO = realOrderCallpriceService.getRealCallpriceDetail(realCallId, realOrderId);
        CommonUtil.getRealCallpriceCompleted2(realCallpriceDetailDTO);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<AcceptGoodsAddressInfo> list = acceptAddressService.listAcceptAddress(userId);
        model.addAttribute("addressList", list);
        model.addAttribute("realCallpriceDetail", realCallpriceDetailDTO);
        return "real_make_order";
    }
    /**
     *
     * 跳转到询单下单页面
     * @return
     */
    @RequestMapping("/queryMakeOrderPage")
    public String view2queryMakeOrder(HttpServletRequest request, Model model, Integer queryCallId, Integer queryOrderId){
        QueryCallpriceDetailDTO queryCallpriceDetailDTO = queryOrderCallpriceService.getQueryCallpriceDetail(queryCallId, queryOrderId);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<AcceptGoodsAddressInfo> list = acceptAddressService.listAcceptAddress(userId);
        model.addAttribute("addressList", list);
        model.addAttribute("queryCallpriceDetail", queryCallpriceDetailDTO);
        return "query_make_order";
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

    /**
     * 下单
     * @return
     */
    @RequestMapping("/makeOrderBill")
    @ResponseBody
    public Object makeRealOrder(GoodsOrder goodsOrder){
        RestResult result = new RestResult();
        int affectedRow = goodsOrderService.createOrderBill(goodsOrder);
        return result;
    }

    @RequestMapping("/myPurchaseOrders/{state}")
    @ResponseBody
    public Object getMyPurchaseOrdersWithStatus(@PathVariable String state,
                                                @RequestParam("draw") int draw,
                                                @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                                @RequestParam(value = "orderType", required = false) String orderType,
                                                @RequestParam(value = "searchKey", required = false) String searchKey,
                                                @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                                @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<GoodsOrderDTO> orders = goodsOrderService.searchMypurchaseOrdersWithStatus(page, pageSize, orderColumn, orderType, searchKey, userId, state);
        return new PageResult2<GoodsOrderDTO>(orders, draw);
    }

    @RequestMapping("/updateGoodsOrderStatus/{state}")
    @ResponseBody
    public Object updateGoodsOrderState(@PathVariable String state, String goodsOrderId){
        RestResult result = new RestResult();
        goodsOrderService.updateGoodsOrderState(goodsOrderId, state);
        return result;
    }

    /**
     * 订单详情页面
     * @param goodsOrderId
     * @param model
     * @return
     */
    @RequestMapping("/goodsOrderDetailPage")
    public String view2goodsOrderDetail(String goodsOrderId, Model model){
        return "";
    }
}

