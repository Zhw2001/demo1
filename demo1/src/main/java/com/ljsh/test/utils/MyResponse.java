package com.ljsh.test.utils;

import com.ljsh.test.dto.Result;

import javax.servlet.http.HttpServletResponse;

public class MyResponse {
    public static void writeResult(HttpServletResponse response, Result<?> serverResponse) {
        try {
            response.reset();
            response.setContentType("application/json;charset=UTF-8");//响应内容类型为json对象
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(serverResponse.getCode());
        } catch (Exception e) {
            System.out.println("http response write exception:" + serverResponse.toString());
        }
    }
}
