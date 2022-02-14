package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.AdminRoleMapper;
import com.ljsh.test.mbg.model.AdminRole;
import com.ljsh.test.service.AdminRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminRoleServiceImpl implements AdminRoleService {
    @Autowired
    private AdminRoleMapper adminRoleMapper;

    public AdminRole getAuthListByRName(String name){
        return adminRoleMapper.get_AuthInfo_By_roleName(name);
    }
    public List<AdminRole> getRoleList() {
        return adminRoleMapper.getRoleList();
    }
}
