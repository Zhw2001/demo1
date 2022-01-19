package com.ljsh.test.mbg.model;

import lombok.Data;

@Data
public class AdminUser {
    private String uid;
    private String avatar;
    private String account;
    private String nickname;
    private String password;
    private Long phone;
    private String email;
    private Long last_sign_time;
    private String reg_ip;
    private Integer enable;
    private String description;
    private String admin_role_ids;
    private String create_date;
    private Long create_timestamp;



}
