package com.ljsh.test.controller;

import cn.hutool.core.util.StrUtil;
import com.ljsh.test.config.Result;
import com.ljsh.test.mbg.model.TheUser;
import com.ljsh.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

/*

    @RequestMapping("/user/list")
    public ModelAndView getUsers(){
        List<TheUser> userlist=userService.getusers();
        ModelAndView mav=new ModelAndView("BackPage/Member/User");
        mav.addObject("userlist",userlist);
        return mav;
    }

    @RequestMapping(value="/login",method= RequestMethod.POST)
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Map<String,Object> map, HttpSession session){
        if(userService.login(username,password)){
            //登录成功，session中加入登录用户名，用于在成功的首页中展示
            session.setAttribute("loginUser",username);
            System.out.println(username);
            if(username.equals("admin")){return "redirect:/admin/user/list";}
            else{return "redirect:/";}
        }else{
            //登录失败,设置失败信息并返回登录页面
            session.invalidate();
            map.put("msg","用户名密码错误");//map用来存放错误提示信息，在前端登录页面显示
            return "FrontPage/login/login";
        }
    }


*/


    @PostMapping("/regist")
    public Result<?> regist(@RequestBody TheUser user){
        if(user != null){
            if(userService.regist(user)) return Result.success();
            else{
                return Result.error("2","数据库操作出错");
            }
        }
        return Result.error("1","输入出错");
    }

    @PostMapping("/delete")
    public Result<?> del(@RequestBody TheUser user){
        if(user !=null){
            if(userService.del_user(Integer.parseInt(user.getId().toString())))return Result.success();
            else{
                return Result.error("2","数据库操作出错");
            }
        }
        return Result.error("1","输入错误");
    }

    @GetMapping("/list")
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search){
        return Result.success(userService.selectPage(pageNum, pageSize,search));
    }

    @GetMapping("/cal_list")
    public Result<?> cal_total(){
        return Result.success(userService.getusers());
    }

}
