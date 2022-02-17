package com.ljsh.test.mbg.model;

import lombok.Data;

import java.util.List;

@Data
public class CourseInfo {
    private Integer cNum;
    private String cId;
    private String department;
    private String cName;
    private String cTarget;
    private Double A;
    private Double B;
    private Double C;
    private Double D;
    private Double F;
    private int course_type;
    private List<Course> Course;
    private List<Experiment> Experiment;
    private List<Cdesign> Cdesign;
    private List<Gdesign> Gdesign;
}
