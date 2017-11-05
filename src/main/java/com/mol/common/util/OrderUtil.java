package com.mol.common.util;

import java.util.UUID;

/**
 * Created by usher on 2017/10/30.
 */
public class OrderUtil {

    //生成订单id
    public synchronized static String generateOrderId(){
        int machineId = 1;//最大支持1-9个集群机器部署
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if(hashCodeV < 0) {//有可能是负数
            hashCodeV = - hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return machineId + String.format("%015d", hashCodeV);
    }
}
