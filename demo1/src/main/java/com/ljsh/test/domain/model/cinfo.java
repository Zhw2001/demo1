package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public abstract class cinfo {
    private String cId;
    private String cName;
    private Integer course_type;
    public cinfo(){}
    public cinfo(String myCid, String myCName, Integer my_course_type){
        cId = myCid;
        cName = myCName;
        course_type = my_course_type;
    }
}
