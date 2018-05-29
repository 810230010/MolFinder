package com.mol.common;

/**
 * Created by 江建平 on 2017/8/9.
 */
public class GlobalConstant {
    public static final int SUCCESS_CODE = 200;
    public static final int SERVER_ERROR = 500;
    public static final int REGISTER_ERROR = 501;
    public static final int WRONG_USER_CODE = 502;
    public static final int WRONG_CHECK_CODE = 503;
    public static final int UPDATE_ERROR_CODE = 504;
    public static int FORBID_USER_CODE = 505;
    public static final String SUCCESS_MESSAGE = "success";
    public static final String RMB_UNIT = "元";
    //实单状态
    public static final String REAL_ORDER_ONSALE = "BIDDING";
    public static final String REAL_ORDER_CLOSE = "CLOSE";
    public static final String REAL_ORDER_SEND = "SEND";
    public static final String REAL_ORDER_SUCCESS = "SUCCESS";
    //实单报价状态
    public static final String REAL_CALLPRICE_COMPETE = "BIDDING";
    //报价到这里
    public static final String REAL_CALLPRICE_HERE = "HERE";
    public static final String REAL_CALLPRICE_OTHER = "OTHER";
    //询单
    public static final String QUERY_ORDER_CLOSE = "CLOSE";
    public static final String QUERY_ORDER_SEND = "SEND";

    //订单
    //下单
    public static final String ORDER_INITIAL = "ORDER";
    //卖家已发货
    public static final String ORDER_SEND = "SEND";
    //买家确认收货
    public static final String ORDER_SUCCESS = "SUCCESS";
}
