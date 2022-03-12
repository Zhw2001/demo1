package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.dto.CourseAuditDTO;
import com.ljsh.test.service.CourseAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/exam_audit")
public class CourseAuditController {
    @Autowired
    private CourseAuditService courseAuditService;

    @GetMapping("/semester_list")
    public Result<?> getSemester(@RequestParam(value = "cid", required = true) String cid){
        if(!cid.equals("")){
            return Result.success(courseAuditService.getSemester(cid));
        }
        return Result.error("204","输入为空");
    }

    @GetMapping("/load_info")
    public Result<?> getInfo(@RequestParam(value = "semester",required = true) String semester, @RequestParam(value = "cid",required = true) String cid ){
        if(cid != null && !cid.equals("") && !cid.equals( "undefined")){
            return Result.success(courseAuditService.getInfo(semester, cid));
        }
        return Result.error("204","输入为空");
    }
    @PostMapping("/update_audit")
    public Result<?> updateAudit(@RequestBody CourseAuditDTO courseAudit)
    {
        String msg = courseAuditService.updateAudit(courseAudit);
        if(msg.equals("")){return Result.success();}
        else {
            return Result.error("500", msg);
        }
    }

    @PostMapping("/update_eva")
    public Result<?> updateEva(@RequestBody CourseAuditDTO courseAudit)
    {
        String msg = courseAuditService.UpdateEvaDescription(courseAudit);
        if(msg.equals("")){return Result.success();}
        else {
            return Result.error("500", msg);
        }
    }

}
