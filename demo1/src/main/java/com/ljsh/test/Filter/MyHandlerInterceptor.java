package com.ljsh.test.Filter;

import com.ljsh.test.utils.MyResponse;
import com.ljsh.test.utils.Result;
import com.ljsh.test.utils.JwtUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class MyHandlerInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getMethod().equals("OPTIONS")){
            response.setStatus(HttpServletResponse.SC_OK);
            return true;
        }
        response.setCharacterEncoding("utf-8");
        String token = request.getHeader("token");
        if(token != null){
            boolean result = JwtUtil.verify(token);
            if(result){
                System.out.println("通过拦截器");
                return true;
            }
            else{
                MyResponse.writeResult(response, Result.error("401","权限认证失败"));
                System.out.println("认证失败");
                return false;
            }
        }
        MyResponse.writeResult(response,Result.error("401","没有权限"));
        System.out.println("拦截");
        return false;
    }
}