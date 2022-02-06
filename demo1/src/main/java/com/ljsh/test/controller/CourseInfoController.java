package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.CourseInfo;
import com.ljsh.test.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/cinfo")
public class CourseInfoController {
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private ExperService experService;
    @Autowired
    private CdesignService cdesignService;
    @Autowired
    private GdesignService gdesignService;


    @GetMapping("/list_CD")
    public Result<?> getCourseInfoList(@RequestParam(value="cid",defaultValue = "XX110100") String cid,@RequestParam(value="dep",defaultValue = "计算机系") String department)
    {
        List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
        courseInfoList = courseInfoService.getCInfoByCidDep(cid,department);
        return Result.success(courseInfoList);
    }

}
