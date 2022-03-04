package com.ljsh.test.controller;

import com.ljsh.test.dto.RelationUpdateDTO;
import com.ljsh.test.dto.Result;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.service.AdminUserService;
import com.ljsh.test.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminUserService adminUserService;

    @RequestMapping(value="/login",method= RequestMethod.POST)
    public Result<?> login(@RequestBody AdminUser adminUser){
        if(adminUser.getAccount() == null || adminUser.getPassword() == null){
            return Result.error("204","输入为空");
        }
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



    @PostMapping("/regist")
    public Result<?> regist(@RequestBody AdminUser user){
        if(user.getAccount() != null && user.getPassword()!= null && !user.getAccount().equals("") && !user.getPassword().equals("")){
            String msg = adminUserService.regist(user);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> del(@RequestBody AdminUser user){
        if(!user.getAccount().equals("") || user.getAccount() != null){
            String msg = adminUserService.del_user(user.getAccount());
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @GetMapping("/list")
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search){
        return Result.success(adminUserService.selectPage(pageNum, pageSize,search));
    }

    @GetMapping("/all")
    public Result<?> getAll(){
        return Result.success(adminUserService.getusers());
    }

    @GetMapping("/info")
    public Result<?> get_Info(@RequestParam String account){
        return Result.success(adminUserService.get_Info(account));
    }

    @GetMapping("/get_course_list")
    public Result<?> getCList(@RequestParam(value = "uid", required = true) Long uid){
        return Result.success(adminUserService.getCourseList(uid));
    }

    @PostMapping("/set_course")
    public Result<?> setCourse(@RequestBody RelationUpdateDTO relationUpdate){
        if(relationUpdate.getSubject_id() != null){
            String msg = adminUserService.updateCourseOfUser(relationUpdate);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/del_course")
    public Result<?> delCourse(@RequestBody RelationUpdateDTO relationUpdate){
        if(relationUpdate.getSubject_id() != null){
            String msg = adminUserService.delCourseOfUser(relationUpdate);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
