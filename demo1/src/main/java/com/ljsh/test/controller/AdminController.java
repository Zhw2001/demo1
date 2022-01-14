package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.TheUser;
import com.ljsh.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;


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




    @PostMapping("/regist")
    public String regist(HttpServletRequest request){
        TheUser user = new TheUser();
        String role_id=request.getParameter("role_id");
       user.setUsername(request.getParameter("username"));
       user.setPassword(request.getParameter("password"));
        user.setPhone(request.getParameter("phone"));
        user.setEmail(request.getParameter("email"));
        user.setSex(request.getParameter("sex"));
        user.setAddress(request.getParameter("address"));
        if(request.getParameter("state")=="1"){
            user.setState(1);
        }
        else{
            user.setState(0);
        }
        user.setDescription(request.getParameter("description"));
        if(role_id=="2"){
            user.setRole_id(2);
        }
        else if(role_id=="1"){
            user.setRole_id(1);
        }
        else{
            user.setRole_id(0);
        }
        user.setFile(request.getParameter("file"));
        if(userService.regist(user)){
            return "FrontPage/login/login";
        }
        else{
            return "FrontPage/login/regist";
        }
    }
}
