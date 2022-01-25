package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.AdminUser;
import com.ljsh.test.service.AdminUserService;
import com.ljsh.test.utils.JwtUtil;
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
            String token = JwtUtil.sign(find.getAccount());
            if(token != null){
                return Result.success_token(find,token);
            }
            return Result.error("401","认证失败");
        }

        return Result.error("401","登录失败");
    }


    @GetMapping ("/get_Auth")
    public Result<?> getadminAuth(@RequestParam String account) {
        if(account != null){
            AdminUser adminUser = adminUserService.getAuth(account);
            if(adminUser != null) return Result.success(adminUser);
            else{
                return Result.error("404","找不到用户数据");
            }
        }
        else{
            return Result.error("1","输入为空");
        }
    }


    @PostMapping("/regist")
    public Result<?> regist(@RequestBody AdminUser user){
        if(user != null){
            if(adminUserService.regist(user)) return Result.success();
            else{
                return Result.error("2","sql_error");
            }
        }
        return Result.error("1","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> del(@RequestBody AdminUser user){
        if(user !=null){
            if(adminUserService.del_user(user.getAccount()))return Result.success();
            else{
                return Result.error("2","sql_error");
            }
        }
        return Result.error("1","输入为空");
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
