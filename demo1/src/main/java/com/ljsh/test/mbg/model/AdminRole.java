package com.ljsh.test.mbg.model;

import lombok.Data;

import java.util.List;

@Data
public class AdminRole {
    private Long role_id;
    private String role_name;
    private String role_description;
    private String cidList;
    private List<AdminAuth> adminAuthList;
}
