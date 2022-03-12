package com.ljsh.test.dto;

import lombok.Data;

@Data
public class CourseStandardDTO {
    private String excellent;
    private String good;
    private String normal;
    private String pass;
    private String poor;

    public CourseStandardDTO() {}

    public CourseStandardDTO(String excellent, String good, String normal, String pass, String poor) {
        this.excellent = excellent;
        this.good = good;
        this.normal = normal;
        this.pass = pass;
        this.poor = poor;
    }

}
