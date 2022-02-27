package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.domain.model.AdminAuth;
import com.ljsh.test.service.AdminRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/auth")
public class AdminRoleMenuController {
    @Autowired
    private AdminRoleMenuService adminRoleMenuService;


    @GetMapping("/list")
    public Result<?> getAuthList(){
        List<AdminAuth> adminUsers = adminRoleMenuService.getAuthMenu();
        return Result.success(adminUsers);
    }
}
