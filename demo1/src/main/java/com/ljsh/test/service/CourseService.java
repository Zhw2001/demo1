package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Course;

import java.util.List;

public interface CourseService {
    List<Course> getAll();
    Boolean addCourse(Course course);
    Boolean delCourse(Long id);
    Boolean upCourse(Course course);
}
