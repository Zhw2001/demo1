package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CourseAudit {
    public CourseAudit(String courseID, String module_name) {
        this.courseID = courseID;
        this.module_name = module_name;
    }
    public CourseAudit() {}

    private String courseID;
    private String module_name;
}
