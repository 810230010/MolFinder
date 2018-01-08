package com.mol.common;

/**
 * Created by usher on 2018/1/8.
 */
public enum  RealQueryStateEnum {
    BIDDING("BIDDING"),SENDED("SENDED"), SUCCESS("SUCCESS"), CLOSE("CLOSE");
    private String state;
    private RealQueryStateEnum(String state){
        this.state = state;
    }

    public String getState() {
        return state;
    }
}
