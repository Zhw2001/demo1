package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class Course_Classes {
    public Course_Classes(String account, Long role_id, String cid, String cname, String classes) {
        this.account = account;
        this.role_id = role_id;
        this.cid = cid;
        this.cname = cname;
        this.classes = classes;
    }
    public Course_Classes(){}
    private String account;
    private Long role_id;
    private String cid;
    private String cname;
    private String classes;

}
