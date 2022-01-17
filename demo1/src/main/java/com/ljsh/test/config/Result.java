package com.ljsh.test.config;



public class Result <U>{
    private String code;
    private String msg;
    private U data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public U getData() {
        return data;
    }

    public void setData(U data) {
        this.data = data;
    }

    public Result(U data){this.data=data;}

    public Result(){}

    public static Result success(){
        Result result = new Result();
        result.setCode("0");
        result.setMsg("成功");
        return result;
    }

    public static <U> Result<U> success(U data){
        Result<U> result = new Result<U>(data);
        result.setCode("0");
        result.setMsg("成功");
        return result;
    }

    public static Result error(String code, String msg){
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }



}
