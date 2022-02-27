package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class AdminUser {
    public AdminUser(){}
    public AdminUser(Long uid, String account, String nickname, String password, Long phone, String email, String description, List<AdminRole> adminRoleList) {
        this.uid = uid;
        this.account = account;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.description = description;
        this.adminRoleList = adminRoleList;
    }

    private Long uid;
    private String account;
    private String nickname;
    private String password;
    private Long phone;
    private String email;
    private String description;
    private List<AdminRole> adminRoleList;

}
