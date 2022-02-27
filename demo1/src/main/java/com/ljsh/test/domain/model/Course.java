package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class Course extends cinfo{
    public Course() {}
    public Course(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.CourseData> courseData) {
        super(myCid, myCName, my_course_type);
        CourseData = courseData;
    }
    private List<CourseData> CourseData;
}
