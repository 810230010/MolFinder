package com.mol.controller;

import com.mol.common.controller.PageResult;
import com.mol.common.controller.RestResult;
import com.mol.common.qiniu.QiniuUtil;
import com.mol.common.util.StringUtils;
import com.mol.common.util.WebUtil;
import com.mol.dto.QueryOrderCallpriceDTO;
import com.mol.dto.RealOrderCallpriceDTO;
import com.mol.entity.Certification;
import com.mol.entity.QueryOrder;
import com.mol.entity.RealOrder;
import com.mol.entity.User;
import com.mol.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private QueryService queryService;
    @Autowired
    private RealOrderCallpriceService realOrderCallpriceService;
    @Autowired
    private QueryOrderCallpriceService queryOrderCallpriceService;
    @Autowired
    private CertificationService certificationService;
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
    @RequestMapping("/mypublish/myRealSendPage")
    public String view2myRealSend(){
        return "profile/my_real_send";
    }

    /**
     * 我发布的询单页面
     * @return
     */
    @RequestMapping("/mypublish/myEnquirySendPage")
    public String view2myEnquirySend(){
        return "profile/my_enquiry_send";
    }

    /**
     * 实单报价详情页面
     * @return
     */
    @RequestMapping("/mypublish/realCallPriceDetailPage")
    public String view2realCallPriceDetail(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_callprice_intro";
    }

    /**
     * 根据状态查询我发布的实单列表
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @param status
     * @return
     */
    @RequestMapping("/mypublish/realOrders/{status}")
    @ResponseBody
    public Object searchRealOrderOnsale(@RequestParam("draw") int draw,
                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                         @RequestParam(value = "orderType", required = false) String orderType,
                         @RequestParam(value = "searchKey", required = false) String searchKey,
                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                         @PathVariable("status") String status,
                         HttpServletRequest request) {
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<RealOrder> realOrders = realService.searchMyRealOrdersWithStatus(page, pageSize, orderColumn, orderType, searchKey, userId, status);
        return new PageResult<RealOrder>(realOrders, draw);
    }

    /**
     * 查询我发布的询价中的询单列表
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @param status ONSALE:询价中 SENDED:已派单 STOPPED:停止询价
     * @return
     */
    @RequestMapping("/mypublish/queryOrders/{status}")
    @ResponseBody
    public Object searchEnquiryOrders(@RequestParam("draw") int draw,
                                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                         @RequestParam(value = "orderType", required = false) String orderType,
                                         @RequestParam(value = "searchKey", required = false) String searchKey,
                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                         @PathVariable("status")String status,
                                         HttpServletRequest request) {
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<QueryOrder> queryOrders = queryService.searchMyQueryOrdersWithStatus(page, pageSize, orderColumn, orderType, searchKey, userId, status);
        return new PageResult<QueryOrder>(queryOrders, draw);
    }

    /**
     * 已删除的发布的实单和询单页面
     * @return
     */
    @RequestMapping("/mypublish/deletedOrdersPage")
    public String view2publishedRealOrdersDeletedPage(){
        return "profile/my_published_orders_deleted";
    }

    /**
     * 当前用户已报价实单页面
     * @return
     */
    @RequestMapping("/callprice/realOrdersCallpricePage")
    public String view2callpriceRealOrdersPage(){
        return "profile/my_callprice_real";
    }

    /**
     * 根据状态查询已报价的实单
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @param status BIDDING:抢单中 SENDED:已派单 STOPPED:停止 SENDING:派单中
     * @return
     */
    @RequestMapping("/myaccept/realOrders/{status}")
    @ResponseBody
    public Object searchMyCallpriceRealOrders(@RequestParam("draw") int draw,
                                      @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                      @RequestParam(value = "orderType", required = false) String orderType,
                                      @RequestParam(value = "searchKey", required = false) String searchKey,
                                      @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                      @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                      @PathVariable("status")String status,
                                      HttpServletRequest request) {
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<RealOrderCallpriceDTO> realOrders = realOrderCallpriceService.searchCallpriceRealOrdersWithStatus(page, pageSize, orderColumn, orderType, searchKey, userId, status);
        return new PageResult<RealOrderCallpriceDTO>(realOrders, draw);
    }
    /**
     * 当前用户已报价询单页面
     * @return
     */
    @RequestMapping("/callprice/queryOrdersCallpricePage")
    public String view2callpriceQueryOrdersPage(){
        return "profile/my_callprice_query";
    }
    /**
     * 当前用户已报价删除询单页面
     * @return
     */
    @RequestMapping("/callprice/deletedOrdersPage")
    public String view2callpriceDeletedOrdersPage(){
        return "profile/my_callprice_deleted";
    }
    /**
     * 根据状态查询已报价的询单
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param page
     * @param pageSize
     * @param status BIDDING:抢单中 SENDED:已派单 STOPPED:停止 SENDING:派单中
     * @return
     */
    @RequestMapping("/myaccept/queryOrders/{status}")
    @ResponseBody
    public Object searchMyCallpriceQueryOrders(@RequestParam("draw") int draw,
                                              @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                              @RequestParam(value = "orderType", required = false) String orderType,
                                              @RequestParam(value = "searchKey", required = false) String searchKey,
                                              @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                              @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                              @PathVariable("status")String status,
                                              HttpServletRequest request) {
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        Integer userId = WebUtil.getCurrentUser(request).getUserId();
        List<QueryOrderCallpriceDTO> queryOrders = queryOrderCallpriceService.searchCallpriceQueryOrdersWithStatus(page, pageSize, orderColumn, orderType, searchKey, userId, status);
        return new PageResult<QueryOrderCallpriceDTO>(queryOrders, draw);
    }

    /**
     * 实名认证页面
     * @return
     */
    @RequestMapping("/certificationPage")
    public String view2certification(Model model, HttpServletRequest request){
        String token = QiniuUtil.getUploadToken();
        model.addAttribute("uploadToken", token);
        model.addAttribute("domain", QiniuUtil.getBaseUrl());
        Certification certificate = certificationService.getCurrentUserCertificateState(request);
        model.addAttribute("certification", certificate);
        return "profile/certification";
    }

    /**
     * 实名认证
     * @param certification
     * @return
     */
    @RequestMapping("/certificate")
    @ResponseBody
    public Object certificate(Certification certification){
        RestResult result = new RestResult();
        int affectedRow = certificationService.addCertificateUser(certification);
        return result;
    }

    /**
     * 我购买的订单
     * @return
     */
    @RequestMapping("/orders/purchasePage")
    public String view2purchaseOrder(){
        return "order_purchase";
    }
    /**
     * 我生产的订单
     * @return
     */
    @RequestMapping("/orders/sellPage")
    public String view2sellOrder(){
        return "order_send";
    }

    /**
     * 重新认证
     * @return
     */
    @RequestMapping("/recertificate")
    @ResponseBody
    public Object recertificate(Integer certificateId){
        RestResult result = new RestResult();
        result = certificationService.deleteCertification(certificateId);
        return result;
    }
}
