package com.mol.common.Exception;

import com.mol.common.Exception.MyException.UnknownAccountException;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 江建平 on 2017/7/9.
 */
@ControllerAdvice(basePackages = {"com.mol.controller"})
public class ExceptionHandlerGlobal {
    private static Logger log = Logger.getLogger(ExceptionHandlerGlobal.class);
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Object exceptionResult(HttpServletRequest request, UnknownAccountException e){
        Map result = new HashMap();
        result.put(e.getCode(), e.getMessage());
        return result;
    }
}
