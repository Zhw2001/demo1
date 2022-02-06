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
        if(courseService.upCourse(course)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/delete")
    public Result<?> delCourse(@RequestBody Course course){
        if(courseService.delCourse(course.getId())){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/insert")
    public Result<?> addCourse(@RequestBody Course course){
        if(courseService.addCourse(course)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

}
