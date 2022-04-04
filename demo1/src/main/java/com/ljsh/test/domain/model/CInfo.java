package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CInfo {
    private String cid;
    private String cname;
    private Integer course_type;
    private String course_type_name;
    private String course_category;
    private String faculty;
    private String teacher;
    public CInfo(){}

    public CInfo(String cid, String cname, Integer course_type, String course_type_name, String course_category, String faculty, String teacher) {
        this.cid = cid;
        this.cname = cname;
        this.course_type = course_type;
        this.course_type_name = course_type_name;
        this.course_category = course_category;
        this.faculty = faculty;
        this.teacher = teacher;
    }
}
