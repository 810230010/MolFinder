package com.mol.common.util;

import com.mol.dto.RealCallpriceDetailDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by usher on 2017/10/30.
 */
public class CommonUtil {
    //获得形如xxx元/xxxg形式的数据
    public static void getRealCallpriceCompleted2(RealCallpriceDetailDTO dto){
        List<String> result = new ArrayList<>();
        String[] amountList = dto.getCallPriceAmount().split(",");
        String[] priceList = dto.getCallPriceMoney().split(",");
        for(int i=0; i<amountList.length; i++){
            result.add(amountList[i] + "/" + priceList[i]);
        }
        dto.setRealCallpriceCompleted(result);
    }
}
