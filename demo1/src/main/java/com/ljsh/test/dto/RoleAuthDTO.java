package com.ljsh.test.dto;

import lombok.Data;

@Data
public class RoleAuthDTO {
    private Long role_id;
    private Long[] insert;
    private Long[] delete;
}
