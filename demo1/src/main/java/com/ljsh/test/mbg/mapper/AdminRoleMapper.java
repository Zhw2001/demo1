package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.AdminRole;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface AdminRoleMapper {
    AdminRole get_AuthInfo_By_roleName(String roleName);
    List<AdminRole> getRoleList();
    void set_Role_Auth(Long role_id, Long authority_id);
    void del_Role_Auth(Long role_id, Long authority_id);
}
