package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class AuditInfo {
    private Long id;
    private String semester;
    private String cid;
    private String classes;
    private String audit_date;
    private String eva_date;
    private String course_property;
    private String exam_date;
    private Float course_point;
    private Float week_hour;
    private Float course_hour;
    private Float lesson_hour;
    private Float practice_hour;
    private Integer exam_type;
    private String textbook;
    private String goals_degree_describe;
    private String audit_person;
    private String eva_person;
    private String set_paper_person;

    public AuditInfo() {
    }

    public AuditInfo(Long id, String semester, String cid, String classes, String audit_date, String eva_date, String course_property, String exam_date, Float course_point, Float week_hour, Float course_hour, Float lesson_hour, Float practice_hour, Integer exam_type, String textbook, String goals_degree_describe, String audit_person, String eva_person, String set_paper_person) {
        this.id = id;
        this.semester = semester;
        this.cid = cid;
        this.classes = classes;
        this.audit_date = audit_date;
        this.eva_date = eva_date;
        this.course_property = course_property;
        this.exam_date = exam_date;
        this.course_point = course_point;
        this.week_hour = week_hour;
        this.course_hour = course_hour;
        this.lesson_hour = lesson_hour;
        this.practice_hour = practice_hour;
        this.exam_type = exam_type;
        this.textbook = textbook;
        this.goals_degree_describe = goals_degree_describe;
        this.audit_person = audit_person;
        this.eva_person = eva_person;
        this.set_paper_person = set_paper_person;
    }
}
