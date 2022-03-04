package com.ljsh.test.controller;

import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.dto.Result;
import com.ljsh.test.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cinfo")
public class CourseInfoController {
    @Autowired
    private CourseInfoService courseInfoService;

    @GetMapping("/all")
    public Result<?> getAllCourse()
    {
        List<CInfo> cInfoList = courseInfoService.getAllCourse();
        return Result.success(cInfoList);
    }

}
