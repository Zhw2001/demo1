package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class Admin_User_Course {
    private Long UR_ID;
    private String cid;

    public Admin_User_Course() {
    }

    public Admin_User_Course(Long UR_ID, String cid) {
        this.UR_ID = UR_ID;
        this.cid = cid;
    }
}
