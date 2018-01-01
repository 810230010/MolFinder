package com.mol.common.util;


import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.*;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
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

    /**自动匹配参数赋值到实体bean中
     * @author LiuDing
     * 2014-2-16 下午10:23:37
     * @param bean
     * @param request
     */
    public static void populate(Object bean, HttpServletRequest request){
        Class<? extends Object> clazz = bean.getClass();
        Method ms[] = clazz.getDeclaredMethods();
        String mname;
        String field;
        String fieldType;
        String value;
        for(Method m : ms){
            mname = m.getName();
            if(!mname.startsWith("set")
                    || ArrayUtils.isEmpty(m.getParameterTypes())){
                continue;
            }
            try{
                field = mname.toLowerCase().charAt(3) + mname.substring(4, mname.length());
                value = request.getParameter(field);
                if(org.apache.commons.lang3.StringUtils.isEmpty(value)){
                    continue;
                }
                fieldType = m.getParameterTypes()[0].getName();
                //以下可以确认value为String类型
                if(String.class.getName().equals(fieldType)){
                    m.invoke(bean, (String)value);
                }else if(Integer.class.getName().equals(fieldType) && NumberUtils.isDigits((String)value)){
                    m.invoke(bean, Integer.valueOf((String)value));
                }else if(Short.class.getName().equals(fieldType) && NumberUtils.isDigits((String)value)){
                    m.invoke(bean, Short.valueOf((String)value));
                }else if(Float.class.getName().equals(fieldType) && NumberUtils.isNumber((String)value)){
                    m.invoke(bean, Float.valueOf((String)value));
                }else if(Double.class.getName().equals(fieldType) && NumberUtils.isNumber((String)value)){
                    m.invoke(bean, Double.valueOf((String)value));
                }else if(Date.class.getName().equals(fieldType)){
                    m.invoke(bean, DateUtils.parseDate((String)value, "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss"));
                }else{
                    m.invoke(bean, value);
                }
            }catch(Exception e){
                e.printStackTrace();
                continue;
            }
        }
    }
}
