package com.mol.filter;

import com.mol.common.util.WebUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by usher on 2017/12/24.
 */
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String path = ((HttpServletRequest) servletRequest).getRequestURI();
        if(WebUtil.getCurrentUser(request) == null && ((path.contains("page") && !path.contains("admin")) || path.equals("/"))){
            response.sendRedirect("/");
        }else if(WebUtil.getCurrentAdmin(request) == null && path.contains("admin") && (path.contains("page") || path.contains("html") || path.contains("/page/login"))){
            response.sendRedirect("/admin/page/login");
        }else if(WebUtil.getCurrentAdmin(request) != null || WebUtil.getCurrentAdmin(request) != null)
            filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
