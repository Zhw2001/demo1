package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.AdminUserMapper;
import com.ljsh.test.mbg.model.AdminUser;
import com.ljsh.test.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private AdminUserMapper adminUserMapper;


    public Boolean regist(AdminUser u){
        AdminUser existuser =  adminUserMapper.getUserByAccount(u.getAccount());
        if(existuser == null){
            try{
            adminUserMapper.newu(u);
            Integer uid = adminUserMapper.getUidByAccount(u.getAccount());
            }catch (Exception e){
                return false;
            }
            return true;
        }
        return false;
    }
    public AdminUser login(String account,String password){
        String user_realPassword= adminUserMapper.getPasswordByAccount(account);
        if(user_realPassword==null)return null;
        if(user_realPassword.equals(password)&&account!=null){
            AdminUser adminUser = adminUserMapper.getUserByAccount(account);
            return adminUser;
        }
        return null;
    }

    public List<AdminUser> getusers(){

        return adminUserMapper.getAll();
    }

    public List<AdminUser> selectPage(int pageNum, int pageSize, String search){
        pageNum=(pageNum-1)*pageSize;
        List<AdminUser> users= adminUserMapper.selectPage(pageNum,pageSize,search);
        return users;
    }

    public Boolean del_user(String account){
        try {
            Integer uid = adminUserMapper.getUidByAccount(account);
            adminUserMapper.del_user(account);
        }catch(Exception e){
            return false;
        }
        return true;
    }

    public AdminUser getRole(String account){
        AdminUser adminUser = adminUserMapper.get_Roleinfo_By_Account(account);
        return adminUser;
    }

}
