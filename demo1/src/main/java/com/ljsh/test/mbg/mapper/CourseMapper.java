package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Course;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper {
    List<Course> get_All_C();
    void addCourse(Course course);
    void delCourse(Long id);
    void updateCourse(Course course);
}
