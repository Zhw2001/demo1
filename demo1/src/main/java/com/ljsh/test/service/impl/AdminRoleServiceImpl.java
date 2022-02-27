package com.ljsh.test.service.impl;

import com.ljsh.test.dto.RoleAuthDTO;
import com.ljsh.test.domain.mapper.AdminRoleMapper;
import com.ljsh.test.domain.model.AdminRole;
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
    public String updateRoleAuth(RoleAuthDTO roleAuth){
        try {
            for(int i = 0; i < roleAuth.getDelete().length; i++ ){
                adminRoleMapper.del_Role_Auth(roleAuth.getRole_id(),roleAuth.getDelete()[i]);
            }
            for(int i = 0; i < roleAuth.getInsert().length; i++ ){
                adminRoleMapper.set_Role_Auth(roleAuth.getRole_id(),roleAuth.getInsert()[i]);
            }
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }
}
