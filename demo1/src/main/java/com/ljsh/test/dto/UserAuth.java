package com.ljsh.test.dto;

import lombok.Data;

@Data
public class UserAuth {
    private String account;
    private String role_name;
    private String authority_name;
}
