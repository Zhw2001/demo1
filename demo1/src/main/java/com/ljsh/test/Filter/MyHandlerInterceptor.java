package com.ljsh.test.Filter;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object loginuser =session.getAttribute("loginUser");
        if (loginuser == null) {
            //没有登录，设置错误信息并转发到登录页面
            request.setAttribute("msg", "没有权限请先登陆");
            request.getRequestDispatcher("/to/login").forward(request, response);
            return false;
        } else {
            //已登录，放行
            return true;
        }
    }
}