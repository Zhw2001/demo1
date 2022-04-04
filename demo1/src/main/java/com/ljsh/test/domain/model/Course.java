package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.CourseData;
import lombok.Data;

import java.util.List;

@Data
public class Course extends CInfo {
    public Course() {}

    private List<CourseData> CourseData;
}
