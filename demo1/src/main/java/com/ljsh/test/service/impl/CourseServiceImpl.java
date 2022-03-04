package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.CourseMapper;
import com.ljsh.test.domain.model.Course_Data.CourseData;
import com.ljsh.test.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;

    public List<CourseData> getAll(){
        return courseMapper.get_All_C();
    }

    public String addCourse(CourseData courseData){
        try {
            courseMapper.addCourse(courseData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String delCourse(Long id){
        try {
            courseMapper.delCourse(id);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String upCourse(CourseData courseData){
        try {
            courseMapper.updateCourse(courseData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
