package com.mol.common.Exception.MyException;

/**
 * Created by 江建平 on 2017/7/9.
 */
public class UnknownAccountException extends RuntimeException {
    private String message;
    private int code;
    public UnknownAccountException(String message){
        super(message);
    }
    public UnknownAccountException(int code, String message){
        this.code = code;
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
