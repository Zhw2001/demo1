package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class Admin_User_Role
{
    private Long UR_ID;
    private Long uid;
    private Long role_id;

    public Admin_User_Role() {
    }

    public Admin_User_Role(Long UR_ID, Long uid, Long role_id) {
        this.UR_ID = UR_ID;
        this.uid = uid;
        this.role_id = role_id;
    }
}
