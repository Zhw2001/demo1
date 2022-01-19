package com.ljsh.test.dto;


import com.ljsh.test.utils.UUIDGenerator;
import lombok.Data;

@Data
public class Result <U>{
    private String code;
    private String msg;
    private U data;
    private String token;

    public Result(U data){this.data=data;}

    public Result(){}

    public static Result success(){
        Result result = new Result();
        result.setCode("0");
        result.setMsg("成功");
        result.setToken("undefined");
        return result;
    }

    public static <U> Result<U> success(U data){
        Result<U> result = new Result<U>(data);
        result.setCode("0");
        result.setMsg("成功");
        result.setToken("undefined");
        return result;
    }

    public static <U> Result<U> success_token(U data){
        Result<U> result = new Result<U>(data);
        result.setCode("0");
        result.setMsg("成功");
        UUIDGenerator uuidGenerator = new UUIDGenerator();
        result.setToken(uuidGenerator.getPart(4));
        return result;
    }

    public static Result error(String code, String msg){
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        result.setToken("undefined");
        return result;
    }



}
