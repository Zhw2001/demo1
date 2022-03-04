package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class Course_Goal {
    public Course_Goal(Integer course_goal_id, Long audit_id, String course_goal_text, String excellent, String good, String normal, String pass, String poor, String graduate_require, String eva_point, Float total_score, Float expectation, Integer not_reach, Float achieve_degree, String score_description, String score_analysis) {
        this.course_goal_id = course_goal_id;
        this.audit_id = audit_id;
        this.course_goal_text = course_goal_text;
        this.excellent = excellent;
        this.good = good;
        this.normal = normal;
        this.pass = pass;
        this.poor = poor;
        this.graduate_require = graduate_require;
        this.eva_point = eva_point;
        this.total_score = total_score;
        this.expectation = expectation;
        this.not_reach = not_reach;
        this.achieve_degree = achieve_degree;
        this.score_description = score_description;
        this.score_analysis = score_analysis;
    }

    public Course_Goal() {}

    private Integer course_goal_id;
    private Long audit_id;
    private String course_goal_text;
    private String excellent;
    private String good;
    private String normal;
    private String pass;
    private String poor;
    private String graduate_require;
    private String eva_point;
    private Float total_score;
    private Float expectation;
    private Integer not_reach;
    private Float achieve_degree;
    private String score_description;
    private String score_analysis;

}
