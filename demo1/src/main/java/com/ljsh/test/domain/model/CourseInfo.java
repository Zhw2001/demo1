package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CourseInfo extends cinfo{
    public CourseInfo() {}

    public CourseInfo(String myCid, String myCName, Integer my_course_type, String semester, String cTarget, String a, String b, String c, String d, String f, int exam_type) {
        super(myCid, myCName, my_course_type);
        this.semester = semester;
        this.cTarget = cTarget;
        A = a;
        B = b;
        C = c;
        D = d;
        F = f;
        this.exam_type = exam_type;
    }

    private String semester;
    private String cTarget;
    private String A;
    private String B;
    private String C;
    private String D;
    private String F;
    private Integer exam_type;
}
