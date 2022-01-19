package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.AdminUser;
import com.ljsh.test.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminUserService adminUserService;




    @RequestMapping(value="/login",method= RequestMethod.POST)
    public Result<?> login(@RequestBody AdminUser adminUser){
        AdminUser find = adminUserService.login(adminUser.getAccount(),adminUser.getPassword());
        if(find!=null){
            return Result.success(find);
        }else{
            return Result.error("1","登录失败");
        }
    }


    @PostMapping("/regist")
    public Result<?> regist(@RequestBody AdminUser user){
        if(user != null){
            if(adminUserService.regist(user)) return Result.success();
            else{
                return Result.error("2","数据库操作出错");
            }
        }
        return Result.error("1","输入出错");
    }

    @PostMapping("/delete")
    public Result<?> del(@RequestBody AdminUser user){
        if(user !=null){
            if(adminUserService.del_user(user.getAccount()))return Result.success();
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
        return Result.success(adminUserService.selectPage(pageNum, pageSize,search));
    }

    @GetMapping("/cal_list")
    public Result<?> cal_total(){
        return Result.success(adminUserService.getusers());
    }

}
