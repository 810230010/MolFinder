package com.mol.common.util;


import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * Created by usher on 2017/8/16.
 */
public class RequestUtil {
    /**
     * 将request对象转换成T对象
     * @param request
     * @param clazz
     * @return
     */
    public static <T> T request2Bean(HttpServletRequest request, Class<T> clazz){
        try{
            T bean = clazz.newInstance();
            Enumeration<String> e = request.getParameterNames();
            while(e.hasMoreElements()){
                String name = (String) e.nextElement();
                if(name.equals("image")){
                    continue;
                }
                String value = (String)request.getParameter(name);
                BeanUtils.setProperty(bean, name, value);
            }
            return bean;
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
