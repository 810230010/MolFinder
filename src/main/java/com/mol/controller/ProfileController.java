package com.mol.controller;

import com.mol.common.controller.PageResult;
import com.mol.common.util.StringUtils;
import com.mol.common.util.WebUtil;
import com.mol.entity.RealOrder;
import com.mol.service.RealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by usher on 2017/8/17.
 */
@Controller
@RequestMapping("/profile")
public class ProfileController
{
    @Autowired
    private RealService realService;
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

    /**
     * 实单报价详情页面
     * @return
     */
    @RequestMapping("/realCallPriceDetailPage")
    public String view2realCallPriceDetail(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_call_price";
    }

    /**
     * 查询我发布的抢单中的实单
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/mypublish/realOrderOnsale")
    @ResponseBody
    public Object search(@RequestParam("draw") int draw,
                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                         @RequestParam(value = "orderType", required = false) String orderType,
                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                         @RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                         HttpServletRequest request) {
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<RealOrder> realOrders = realService.searchMyRealOrderOnsale(page, pageSize, orderColumn, orderType, userId);
        return new PageResult<RealOrder>(realOrders, draw);
    }
}
