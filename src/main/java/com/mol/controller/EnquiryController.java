package com.mol.controller;

import com.mol.common.GlobalConstant;
import com.mol.common.controller.PageResult;
import com.mol.common.controller.RestResult;
import com.mol.common.util.PropertyReader;
import com.mol.common.util.RequestUtil;
import com.mol.common.util.StringUtils;
import com.mol.dao.QueryOrderCallpriceMapper;
import com.mol.dao.QueryOrderMapper;
import com.mol.dto.*;
import com.mol.entity.QueryOrder;
import com.mol.entity.QueryOrderCallprice;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;
import com.mol.service.QueryOrderCallpriceService;
import com.mol.service.QueryService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/enquiry")
public class EnquiryController {
    @Autowired
    private QueryService queryService;
    @Autowired
    private QueryOrderCallpriceService queryOrderCallpriceService;
    @Autowired
    private QueryOrderCallpriceMapper queryOrderCallpriceMapper;
    @Autowired
    private QueryOrderMapper queryOrderMapper;

    /**
     * 跳转到询单发布页面
     * @return
     */
    @RequestMapping("/enquiryPublishPage")
    public String view2enquiryPublish(){
        return "enquiry_publish";
    }

    /**
     * 发布询单
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/publishEnquiry")
    @ResponseBody
    public Object publishEnquiry(@RequestParam("previewImg")MultipartFile file, HttpServletRequest request){
        RestResult result = new RestResult();
        return result;
    }

    /**
     * 询单详情页
     * @return
     */
    @RequestMapping("/queryDetailPage")
    public String view2queryDetail(Integer queryOrderId, Model model){
        model.addAttribute("queryDetail", queryService.getQueryOrderDetail(queryOrderId));
        return "enquiry_detail";
    }

    /**
     * 询单报价成员页面
     * @param queryOrderId
     * @param model
     * @return
     */
    @RequestMapping("/queryCallpriceMembersPage")
    public String view2queryCallpriceMembers(Integer queryOrderId, Model model){
        model.addAttribute("queryDetail", queryService.getQueryOrderDetail(queryOrderId));
        return "query_callprice_intro";
    }
    /**
     * 询单报价成员
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/getQueryCallpriceMembers")
    @ResponseBody
    public Object getRealCallpriceDetail(@RequestParam("draw") int draw,
                                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                         @RequestParam(value = "orderType", required = false) String orderType,
                                         @RequestParam(value = "searchKey", required = false) String searchKey,
                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                         @RequestParam(value = "queryOrderId") Integer queryOrderId){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<QueryCallpriceMemberDTO> queryOrders = queryOrderCallpriceService.searchCallpriceQueryOrdersMembers(page, pageSize, orderColumn, orderType, searchKey, queryOrderId);
        return new PageResult<QueryCallpriceMemberDTO>(queryOrders, draw);
    }

    /**
     * 询单报价详情显示页面
     * @return
     */
    @RequestMapping("/queryCallpriceShowPage")
    public String view2queryCallpriceShow(Integer queryCallId, Integer queryOrderId, Model model){
        QueryCallpriceDetailDTO queryOrderCallprice = queryOrderCallpriceService.getQueryCallpriceDetail(queryCallId, queryOrderId);
        model.addAttribute("queryCallpriceDetail", queryOrderCallprice);
        return "query_callprice_show";
    }
    /**
     * 关闭我发布的实单
     * @param queryOrderId
     * @return
     */
    @RequestMapping("/closeMyQueryOrder")
    @ResponseBody
    public Object closeMyQueryOrder(Integer queryOrderId){
        RestResult result = new RestResult();
        int affectedRow = queryService.changeQueryOrderState(queryOrderId, GlobalConstant.QUERY_ORDER_CLOSE);
        return result;
    }
    /**
     * 报价详情显示页面
     * @return
     */
    @RequestMapping("/queryCallpriceUpdatePage")
    public String view2realCallpriceUpdate(Integer queryCallId, Integer queryOrderId, Model model){
        QueryCallpriceDetailDTO queryOrderCallprice = queryOrderCallpriceService.getQueryCallpriceDetail(queryCallId, queryOrderId);
        model.addAttribute("queryCallpriceDetail", queryOrderCallprice);
        return "query_callprice_update";
    }

    @RequestMapping("/updateQueryOrderCallprice")
    @ResponseBody
    public Object updateQueryOrderCallprice(QueryOrderCallprice queryOrderCallprice){
        RestResult result = new RestResult();
        queryOrderCallpriceMapper.updateByPrimaryKeySelective(queryOrderCallprice);
        return result;
    }

    /**
     * 取消我报价的询单
     * @param queryCallId
     * @return
     */
    @RequestMapping("/cancelMyQueryCallprice")
    @ResponseBody
    public Object cancelMyRealCallprice(Integer queryCallId){
        RestResult result = new RestResult();
        queryOrderCallpriceMapper.updateQueryOrderCallpriceStatusWithCancel(queryCallId);
        return result;
    }

    @RequestMapping("/updateQueryOrderState/{state}")
    @ResponseBody
    public Object updateQueryOrderState(Integer queryOrderId, @PathVariable String state){
        RestResult result = new RestResult();
        queryOrderMapper.changeQueryOrderState(queryOrderId, state);
        return result;
    }
}
