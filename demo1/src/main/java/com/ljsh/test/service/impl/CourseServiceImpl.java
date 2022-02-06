package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.CourseMapper;
import com.ljsh.test.mbg.model.Course;
import com.ljsh.test.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;

    public List<Course> getAll(){
        return courseMapper.get_All_C();
    }

    public Boolean addCourse(Course course){
        try {
            courseMapper.addCourse(course);
        }catch(Exception e){
            return false;
        }
        return true;
    }

    public Boolean delCourse(Long id){
        try {
            courseMapper.delCourse(id);
        }catch(Exception e){
            return false;
        }
        return true;
    }

    public Boolean upCourse(Course course){
        try {
            courseMapper.updateCourse(course);
        }catch(Exception e){
            return false;
        }
        return true;
    }

}
