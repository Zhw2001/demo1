package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.domain.model.CourseData;
import com.ljsh.test.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;



    @GetMapping("/list")
    public Result<?> getCourseList()
    {
        List<CourseData> courseData =courseService.getAll();
        return Result.success(courseData);
    }

    @PostMapping("/update")
    public Result<?> updateCourse(@RequestBody CourseData courseData){
        if(courseData.getId()!=null){
            String msg = courseService.upCourse(courseData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delCourse(@RequestBody CourseData courseData){
        if(courseData.getId()!=null){
            String msg = courseService.delCourse(courseData.getId());
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addCourse(@RequestBody CourseData courseData){
        if(courseData.getCId()!=null){
            String msg = courseService.addCourse(courseData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
