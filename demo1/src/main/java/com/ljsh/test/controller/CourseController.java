package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.Course;
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
        List<Course> course =courseService.getAll();
        return Result.success(course);
    }

    @PostMapping("/update")
    public Result<?> updateCourse(@RequestBody Course course){
        if(course != null){
            String msg = courseService.upCourse(course);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delCourse(@RequestBody Course course){
        if(course != null){
            String msg = courseService.delCourse(course.getId());
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addCourse(@RequestBody Course course){
        if(course != null){
            String msg = courseService.addCourse(course);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
