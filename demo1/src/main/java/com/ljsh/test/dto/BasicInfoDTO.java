package com.ljsh.test.dto;

import lombok.Data;

@Data
public class BasicInfoDTO {
    private String semester;
    private String date;
    private String course_name;
    private String course_number;
    private String classes;
    private String exam_type;
    public BasicInfoDTO(){}
    public BasicInfoDTO(String my_semester, String my_date, String my_course_name, String my_course_number, String my_classes, String my_exam_type){
        this.semester = my_semester;
        this.date = my_date;
        this.course_name = my_course_name;
        this.course_number = my_course_number;
        this.classes = my_classes;
        this.exam_type = my_exam_type;
    }

}
