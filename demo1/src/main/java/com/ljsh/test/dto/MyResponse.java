package com.ljsh.test.dto;

import javax.servlet.http.HttpServletResponse;

public class MyResponse {
    public static void writeResult(HttpServletResponse response, Result<?> serverResponse) {
        try {
            response.reset();
            response.setContentType("application/json;charset=UTF-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(serverResponse.getCode());
        } catch (Exception e) {
            System.out.println("http response write exception:" + serverResponse.toString());
        }
    }
}
