package com.ljsh.test.controller;

import com.ljsh.test.dto.CinfoDTO;
import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.CourseInfo;
import com.ljsh.test.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/list_dep")
    public Result<?> getCinfoListByDep(@RequestParam(value="dep",defaultValue = "计算机系") String department)
    {
        List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
        return Result.success(courseInfoList);
    }

    @PostMapping("/list_cid")
    public Result<?> getCinfoListByCid(@RequestBody CinfoDTO cinfo)
    {
        List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
        courseInfoList = courseInfoService.getCInfoByCid(cinfo);
        return Result.success(courseInfoList);
    }

}
