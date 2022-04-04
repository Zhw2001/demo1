package com.ljsh.test.controller;

import com.ljsh.test.domain.model.CInfo;
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
    public Result<?> get_Info(@RequestParam(value = "account", required = true) String account){
        return Result.success(adminUserService.get_Info(account));
    }

    //获取所有审核人(课程组长)信息
    @GetMapping("get_audit_person")
    public Result<?> getAuditPInfo(){
        return Result.success(adminUserService.get_AuditPs());
    }

    //分配课程相关
    @GetMapping("get_ur_id")
    public Result<?> getURIDByUserRole(@RequestParam(value = "uid", required = true) Long uid, @RequestParam(value = "role_id", required = true) Long role_id){
        return Result.success(adminUserService.getURIDByUserRole(uid, role_id));
    }

    @GetMapping("/get_course_list")
    public Result<?> getCList(@RequestParam(value = "ur_id", required = true) Long ur_id){
        List<CInfo> cInfos = adminUserService.getCourseList(ur_id);
        if(cInfos == null){ return Result.error("204","NULL");}
        return Result.success(adminUserService.getCourseList(ur_id));
    }

    @PostMapping("/set_course")
    public Result<?> setCourse(@RequestBody RelationUpdateDTO relationUpdate){
        if(relationUpdate.getSubject_id() != null && !relationUpdate.getSubject_id().equals("")){
            String msg = adminUserService.updateCourseOfUser(relationUpdate);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    //分配角色相关
    @PostMapping("/set_role")
    public Result<?> setRole(@RequestBody RelationUpdateDTO relationUpdate){
        if(relationUpdate.getSubject_id() != null && !relationUpdate.getSubject_id().equals("")){
            String msg = adminUserService.updateRole(relationUpdate);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }
}
