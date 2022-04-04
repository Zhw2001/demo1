package com.ljsh.test.dto;

import lombok.Data;

@Data
public class BasicInfoDTO {
    // 课程基本信息
    private String course_name;
    private String course_number;
    // 工程认证基本信息
    private String semester;
    private String audit_date;
    private String eva_date;
    private String classes;
    private String exam_type;
    private String course_property;
    private String exam_date;
    private Float course_point;
    private Float week_hour;
    private Float course_hour;
    private Float lesson_hour;
    private Float practice_hour;
    private String text_book;
    private String audit_person;
    private String eva_person;
    private String set_paper_person;
    private String goals_degree_describe;
    private Float pass_ratio;

    public BasicInfoDTO(){}

    public BasicInfoDTO(String course_name, String course_number, String semester, String audit_date, String eva_date, String classes, String exam_type, String course_property, String exam_date, Float course_point, Float week_hour, Float course_hour, Float lesson_hour, Float practice_hour, String text_book, String audit_person, String eva_person, String set_paper_person, String goals_degree_describe, Float pass_ratio) {
        this.course_name = course_name;
        this.course_number = course_number;
        this.semester = semester;
        this.audit_date = audit_date;
        this.eva_date = eva_date;
        this.classes = classes;
        this.exam_type = exam_type;
        this.course_property = course_property;
        this.exam_date = exam_date;
        this.course_point = course_point;
        this.week_hour = week_hour;
        this.course_hour = course_hour;
        this.lesson_hour = lesson_hour;
        this.practice_hour = practice_hour;
        this.text_book = text_book;
        this.audit_person = audit_person;
        this.eva_person = eva_person;
        this.set_paper_person = set_paper_person;
        this.goals_degree_describe = goals_degree_describe;
        this.pass_ratio = pass_ratio;
    }
}
