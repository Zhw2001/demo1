package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.AdminRole;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminRoleMapper {
    AdminRole get_AuthInfo_By_roleName(String roleName);
}
