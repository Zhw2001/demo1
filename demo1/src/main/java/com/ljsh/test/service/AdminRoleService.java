package com.ljsh.test.service;

import com.ljsh.test.mbg.model.AdminRole;

public interface AdminRoleService {
    AdminRole getAuthListByRName(String name);
}
