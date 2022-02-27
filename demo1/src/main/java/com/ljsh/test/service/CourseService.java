package com.ljsh.test.service;

import com.ljsh.test.domain.model.CourseData;

import java.util.List;

public interface CourseService {
    List<CourseData> getAll();
    String addCourse(CourseData courseData);
    String delCourse(Long id);
    String upCourse(CourseData courseData);
}
