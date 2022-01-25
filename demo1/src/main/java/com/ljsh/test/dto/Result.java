package com.ljsh.test.dto;


import lombok.Data;

@Data
public class Result <T>{
    private String code;
    private String msg;
    private T data;
    private String token;

    public Result(T data){this.data=data;}

    public Result(){}


    public static Result success(){
        Result result = new Result();
        result.setCode("0");
        result.setMsg("成功");
        return result;
    }

    public static <T> Result<T> success(T data){
        Result<T> result = new Result<T>(data);
        result.setCode("0");
        result.setMsg("成功");
        return result;
    }

    public static <T> Result<T> success_token(T data,String token){
        Result<T> result = new Result<T>(data);
        result.setCode("0");
        result.setMsg("认证成功");
        result.setToken(token);
        return result;
    }

    public static Result error(String code, String msg){
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }



}
