package com.ljsh.test.dto;

import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.domain.model.CInfo;
import lombok.Data;

import java.util.List;

@Data
public class AUserInfoDTO { //返回用户完整信息到前端
    public AUserInfoDTO(AdminUser adminUser, List<CInfo> courseList) {
        this.adminUser = adminUser;
        this.courseList = courseList;
    }

    public AUserInfoDTO(){}

    AdminUser adminUser;
    List<CInfo> courseList;
}
