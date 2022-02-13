package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.AdminRole;
import com.ljsh.test.service.AdminRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role")
public class AdminRoleController {
    @Autowired
    private AdminRoleService adminRoleService;

    @GetMapping("/authlist")
    public Result<?> getRoleAuth(@RequestParam(value="rolename",defaultValue = "测试")String roleName){
        AdminRole adminRole = adminRoleService.getAuthListByRName(roleName);
        return Result.success(adminRole);
    }
}
