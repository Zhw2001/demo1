package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.AdminAuthMapper;
import com.ljsh.test.mbg.model.AdminAuth;
import com.ljsh.test.service.AdminRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminRoleMenuServiceImpl implements AdminRoleMenuService {
    @Autowired
    private AdminAuthMapper adminAuthMapper;

    public List<AdminAuth> getAuthMenu(){
        List<AdminAuth> adminAuths = adminAuthMapper.getAuthList();
        return adminAuths;
    }
}
