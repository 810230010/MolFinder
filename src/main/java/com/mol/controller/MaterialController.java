package com.mol.controller;

import com.mol.common.controller.RestResult;
import com.mol.entity.MaterialBuy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by usher on 2017/8/17.
 */
@Controller
@RequestMapping("/material")
public class MaterialController {
    /**
     * 原料供应页面
     * @return
     */
    @RequestMapping("/materialSupplyPage")
    public String view2materialSupplyPage(){
        return "/material_supply";
    }

    /**
     * 原料求购页面
     * @return
     */
    @RequestMapping("/materialBuyPage")
    public String view2materialBuyPage(){
        return "/material_buy";
    }

    /**
     * 发布原料求购
     * @return
     */
    @RequestMapping("/publishMaterialBuy")
    @ResponseBody
    public Object publishMaterialBuy(MaterialBuy material){
        RestResult result = new RestResult();
        return result;
    }
}
