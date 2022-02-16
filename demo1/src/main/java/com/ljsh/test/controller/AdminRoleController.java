package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.dto.RoleAuthDTO;
import com.ljsh.test.mbg.model.AdminRole;
import com.ljsh.test.service.AdminRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/role")
public class AdminRoleController {
    @Autowired
    private AdminRoleService adminRoleService;

    @GetMapping("/list")
    public Result<?> getRoleList(){
        List<AdminRole> adminRoleList = adminRoleService.getRoleList();
        return Result.success(adminRoleList);
    }

    @GetMapping("/authlist")
    public Result<?> getRoleAuth( @RequestParam(value = "rolename",defaultValue = "测试")String roleName ){
        AdminRole adminRole = adminRoleService.getAuthListByRName(roleName);
        return Result.success(adminRole);
    }

    @PostMapping("/update")
    public Result<?> updateRoleAuth(@RequestBody RoleAuthDTO roleAuth){
        if(roleAuth != null){
            String msg = adminRoleService.updateRoleAuth(roleAuth);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
