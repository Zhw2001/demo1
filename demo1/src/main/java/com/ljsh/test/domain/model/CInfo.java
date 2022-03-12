package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CInfo {
    private String cid;
    private String cname;
    private Integer course_type;
    public CInfo(){}

    public CInfo(String cid, String cname, Integer course_type) {
        this.cid = cid;
        this.cname = cname;
        this.course_type = course_type;
    }
}
