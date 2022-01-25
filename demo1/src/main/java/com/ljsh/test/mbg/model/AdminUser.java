package com.ljsh.test.mbg.model;

import lombok.Data;

@Data
public class AdminUser {
    protected Integer uid;
    protected String avatar;
    protected String account;
    protected String nickname;
    protected String password;
    protected Long phone;
    protected String email;
    protected Long last_sign_time;
    protected String reg_ip;
    protected Integer enable;
    protected String description;
    protected String admin_create_date;

    protected Integer authority_id;
    protected String authority_name;
    protected String authority_type;
    protected String authority_parent_id;
    protected String authority_parent_name;
    protected String authority_url;
    protected int authority_sort;
    protected String authority_description;
    protected int authority_enable;

    protected Integer role_id;
    protected String role_name;
    protected String role_description;


}
