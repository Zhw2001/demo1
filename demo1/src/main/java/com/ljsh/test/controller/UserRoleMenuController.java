package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.UserAuth;
import com.ljsh.test.service.UserRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/auth")
public class UserRoleMenuController {
    @Autowired
    private UserRoleMenuService userRoleMenuService;


    @GetMapping("/list")
    public Result<?> getAuthList(){
        List<UserAuth> adminUsers = userRoleMenuService.getAuthMenu();
        return Result.success(adminUsers);
    }
}
