package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Course;

import java.util.List;

public interface CourseService {
    List<Course> getAll();
    String addCourse(Course course);
    String delCourse(Long id);
    String upCourse(Course course);
}
