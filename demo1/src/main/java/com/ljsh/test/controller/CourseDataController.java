package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.dto.CourseDataDTO;
import com.ljsh.test.service.CourseDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/course_data")
public class CourseDataController {
    @Autowired
    private CourseDataService courseDataService;

    @GetMapping("/list")
    public Result<?> getDataListByCid(@RequestParam List<String> cids)
    {
        if(cids.size() < 1){return Result.error("204","输入为空");}
        CourseDataDTO dataDTO = courseDataService.getCDataByCid(cids);
        return Result.success(dataDTO);
    }
}
