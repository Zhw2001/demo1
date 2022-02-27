package com.ljsh.test.dto;

import lombok.Data;

@Data
public class RoleAuthDTO {
    public RoleAuthDTO(Long role_id, Long[] insert, Long[] delete) {
        this.role_id = role_id;
        this.insert = insert;
        this.delete = delete;
    }
    public RoleAuthDTO(){}
    private Long role_id;
    private Long[] insert;
    private Long[] delete;

}
