package com.ljsh.test.service.impl;

import com.ljsh.test.dto.RelationUpdateDTO;
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

    public String updateRoleAuth(RelationUpdateDTO relationUpdate){
        try {
            for(Object i : relationUpdate.getDelete()){
                adminRoleMapper.del_Role_Auth(Long.parseLong(relationUpdate.getSubject_id().toString()),Long.parseLong(i.toString()));
            }
            for(Object i : relationUpdate.getInsert()){
                adminRoleMapper.set_Role_Auth(Long.parseLong(relationUpdate.getSubject_id().toString()),Long.parseLong(i.toString()));
            }
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }
}
