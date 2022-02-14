package com.ljsh.test.mbg.model;

import lombok.Data;

import java.util.List;

@Data
public class AdminUser {
    private Long uid;
    private String account;
    private String nickname;
    private String password;
    private Long phone;
    private String email;
    private String description;
    private List<AdminRole> adminRoleList;

}
