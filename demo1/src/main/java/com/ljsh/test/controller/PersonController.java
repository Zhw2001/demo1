package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.Person;
import com.ljsh.test.service.impl.PersonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

//测试学习用

@Controller
public class PersonController {

    @Autowired
    private PersonServiceImpl personService;

    // 设置访问路由值为路径
    public ModelAndView index(){
        // 顾名思义 实体和数据 同时返回页面模板和数据
        ModelAndView mav = new ModelAndView("");
        List<Person> list = personService.getAll();
        mav.addObject("list",list);
        return mav;
    }
}