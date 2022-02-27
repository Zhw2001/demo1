package com.ljsh.test.dto;

import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.domain.model.Course_Classes;
import lombok.Data;

import java.util.List;

@Data
public class AUserInfoDTO {
    public AUserInfoDTO(AdminUser adminUser, List<Course_Classes> cc_list) {
        this.adminUser = adminUser;
        this.cc_list = cc_list;
    }

    public AUserInfoDTO(){}

    AdminUser adminUser;
    List<Course_Classes> cc_list;
}
