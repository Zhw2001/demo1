package com.ljsh.test.service;

import com.ljsh.test.dto.RoleAuthDTO;
import com.ljsh.test.mbg.model.AdminRole;

import java.util.List;

public interface AdminRoleService {
    AdminRole getAuthListByRName (String name);
    List<AdminRole> getRoleList ();
    String updateRoleAuth(RoleAuthDTO roleAuth);
}
