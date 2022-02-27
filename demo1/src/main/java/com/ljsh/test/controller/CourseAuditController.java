package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.dto.courseAuditDTO;
import com.ljsh.test.service.CourseAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/exam_audit")
public class CourseAuditController {
    @Autowired
    private CourseAuditService courseAuditService;

    @GetMapping("/load_info")
    public Result<?> getInfo(@RequestParam String cid, @RequestParam String classes){
        if(cid != null && !cid.equals("") && !cid.equals( "undefined")){
            return Result.success(courseAuditService.getInfo(cid, classes));
        }
        return Result.error("204","输入为空");
    }
    @PostMapping("/update")
    public Result<?> updateAudit(@RequestBody courseAuditDTO courseAudit)
    {
        if(courseAudit != null){
            String msg = courseAuditService.update(courseAudit);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
