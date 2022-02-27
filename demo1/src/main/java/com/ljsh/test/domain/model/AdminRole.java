package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class AdminRole {
    public AdminRole(){}
    public AdminRole(Long role_id, String role_name, String role_description, List<AdminAuth> adminAuthList) {
        this.role_id = role_id;
        this.role_name = role_name;
        this.role_description = role_description;
        this.adminAuthList = adminAuthList;
    }
    private Long role_id;
    private String role_name;
    private String role_description;
    private List<AdminAuth> adminAuthList;

}
