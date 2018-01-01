package com.mol.controller;

import com.mol.common.GlobalConstant;
import com.mol.common.controller.PageResult;
import com.mol.common.controller.RestResult;
import com.mol.common.qiniu.QiniuUtil;
import com.mol.common.util.PropertyReader;
import com.mol.common.util.RequestUtil;
import com.mol.common.util.StringUtils;
import com.mol.dao.RealOrderCallpriceMapper;
import com.mol.dao.RealOrderMapper;
import com.mol.dto.RealCallpriceDetailDTO;
import com.mol.dto.RealCallpriceMemberDTO;
import com.mol.entity.RealOrder;
import com.mol.entity.RealOrderCallprice;
import com.mol.service.RealOrderCallpriceService;
import com.mol.service.RealService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by 江建平 on 2017/8/9.
 */
@Controller
@RequestMapping("/real")
public class RealController {
    @Autowired
    private RealService realService;
    @Autowired
    private RealOrderCallpriceService realOrderCallpriceService;
    @Autowired
    private RealOrderCallpriceMapper realOrderCallpriceMapper;
    @Autowired
    private RealOrderMapper realOrderMapper;
    /**
     * 跳转到实单发布页面
     * @return
     */
    @RequestMapping("/realPublishPage")
    public String view2enquiryPublish(Model model){
        model.addAttribute("uploadToken", QiniuUtil.getUploadToken());
        model.addAttribute("baseUrl", QiniuUtil.getBaseUrl());
        return "real_publish";
    }

    /**
     * 实单详情页面
     * @return
     */
    @RequestMapping("/realDetailPage")
    public String view2realDetail(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_detail";
    }

    /**
     * 实单报价介绍页面
     * @return
     */
    @RequestMapping("/realCallpriceMembersPage")
    public String view2realCallpriceMember(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_callprice_intro";
    }
    /**
     * 发布实单
     * @param
     * @return
     */
    @RequestMapping("/publishReal")
    @ResponseBody
    public Object publishReal(@RequestParam("previewImg")MultipartFile file,HttpServletRequest request) throws IOException{
        RestResult result = new RestResult();
        RealOrder realOrder = RequestUtil.request2Bean(request, RealOrder.class);
        String docPath = PropertyReader.getProperty("docPath");
        String originalFilename = file.getOriginalFilename();
        String fileSuffix = originalFilename.substring(
                originalFilename.lastIndexOf(".")).toLowerCase();
        String newFile = UUID.randomUUID().toString().replace("-", "") + fileSuffix;
        realOrder.setImage(newFile);
        int affectedRows = realService.publishReal(realOrder);
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(docPath, newFile));
        return result;
    }

    /**
     * 实单报价简介
     * @param draw
     * @param orderColumn
     * @param orderType
     * @param searchKey
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/getRealCallpriceMembers")
    @ResponseBody
    public Object getRealCallpriceDetail(@RequestParam("draw") int draw,
                                         @RequestParam(value = "orderColumn", required = false) String orderColumn,
                                         @RequestParam(value = "orderType", required = false) String orderType,
                                         @RequestParam(value = "searchKey", required = false) String searchKey,
                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                         @RequestParam(value = "realOrderId") Integer realOrderId){
        orderColumn = StringUtils.camelToUnderline(orderColumn);
        List<RealCallpriceMemberDTO> realOrders = realOrderCallpriceService.searchCallpriceRealOrdersMembers(page, pageSize, orderColumn, orderType, searchKey, realOrderId);
        getRealCallpriceCompleted(realOrders);
        return new PageResult<RealCallpriceMemberDTO>(realOrders, draw);
    }

    /**
     * 报价详情显示页面
     * @return
     */
    @RequestMapping("/realCallpriceShowPage")
    public String view2realCallpriceShow(Integer realCallId, Integer realOrderId, Model model){
        RealCallpriceDetailDTO realOrderCallprice = realOrderCallpriceService.getRealCallpriceDetail(realCallId, realOrderId);
        getRealCallpriceCompleted2(realOrderCallprice);
        model.addAttribute("realCallpriceDetail", realOrderCallprice);
        return "real_callprice_show";
    }

    /**
     * 实单报价页面
     * @return
     */
    @RequestMapping("/realCallpricePage")
    public String view2realCallprice(Integer realOrderId, Model model){
        model.addAttribute("realDetail", realService.getRealDetail(realOrderId));
        return "real_callprice";
    }

    /**
     * 关闭我发布的实单
     * @param realOrderId
     * @return
     */
    @RequestMapping("/closeMyRealOrder")
    @ResponseBody
    public Object closeMyRealOrder(Integer realOrderId){
        RestResult result = new RestResult();
        int affectedRow = realService.changeRealOrderState(realOrderId, GlobalConstant.REAL_ORDER_CLOSE);
        return result;
    }


    /**
     * 报价详情显示页面
     * @return
     */
    @RequestMapping("/realCallpriceUpdatePage")
    public String view2realCallpriceUpdate(Integer realCallId, Integer realOrderId, Model model){
        RealCallpriceDetailDTO realOrderCallprice = realOrderCallpriceService.getRealCallpriceDetail(realCallId, realOrderId);
        getRealCallpriceCompleted2(realOrderCallprice);
        model.addAttribute("realCallpriceDetail", realOrderCallprice);
        return "real_callprice_update";
    }

    @RequestMapping("/updateRealOrderCallprice")
    @ResponseBody
    public Object updateRealOrderCallprice(RealOrderCallprice realOrderCallprice){
        RestResult result = new RestResult();
        realOrderCallpriceMapper.updateByPrimaryKeySelective(realOrderCallprice);
        return result;
    }

    @RequestMapping("/updateRealOrderState/{state}")
    @ResponseBody
    public Object changeRealOrderState(Integer realOrderId, @PathVariable String state){
        RestResult result = new RestResult();
        realOrderMapper.changeRealOrderState(realOrderId, state);
        return result;
    }
    /**
     * 取消我报价的实单
     * @param realCallId
     * @return
     */
    @RequestMapping("/cancelMyRealCallprice")
    @ResponseBody
    public Object cancelMyRealCallprice(Integer realCallId){
        RestResult result = new RestResult();
        realOrderCallpriceMapper.updateRealOrderCallpriceStatusWithCancel(realCallId);
        return result;
    }

    /**
     * 发布实单报价
     * @param
     * @return
     */
    @RequestMapping(value = "/publishRealCallprice")
    @ResponseBody
    public Object publishRealCallprice(HttpServletRequest request, HttpServletResponse response){
        RestResult result = new RestResult();
        RealOrderCallprice callprice = new RealOrderCallprice();
        RequestUtil.populate(callprice, request);
        realOrderCallpriceService.addRealOrderCallprice(callprice);
        return result;
    }
    //获得形如xxx元/xxxg形式的数据
    private static void getRealCallpriceCompleted(List<RealCallpriceMemberDTO> dto){
        dto.forEach(item->{
            List<String> result = new ArrayList<>();
            String[] amountList = item.getCallPriceAmount().split(",");
            String[] priceList = item.getCallPriceMoney().split(",");
            for(int i=0; i<amountList.length; i++){
                result.add(amountList[i] + "/" + priceList[i]);
            }
            item.setCallPriceCompleted(result);
        });
    }
    //获得形如xxx元/xxxg形式的数据
    private static void getRealCallpriceCompleted2(RealCallpriceDetailDTO dto){
            List<String> result = new ArrayList<>();
            String[] amountList = dto.getCallPriceAmount().split(",");
            String[] priceList = dto.getCallPriceMoney().split(",");
            for(int i=0; i<amountList.length; i++){
                result.add(amountList[i] + "/" + priceList[i]);
            }
            dto.setRealCallpriceCompleted(result);
    }


}
