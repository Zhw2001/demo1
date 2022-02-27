package com.ljsh.test.service.impl;

import com.ljsh.test.dto.AUserInfoDTO;
import com.ljsh.test.domain.mapper.AdminUserMapper;
import com.ljsh.test.domain.mapper.CourseClassMapper;
import com.ljsh.test.domain.model.AdminRole;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.domain.model.Course_Classes;
import com.ljsh.test.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private AdminUserMapper adminUserMapper;
    @Autowired
    private CourseClassMapper courseClassMapper;



    public String regist(AdminUser u){
        AdminUser existuser =  adminUserMapper.getUserByAccount(u.getAccount());
        if(existuser == null){
            try{
            adminUserMapper.newu(u);
            }catch (Exception e){
                return e.toString();
            }
            return "";
        }
        return "用户已存在";
    }
    public AdminUser login(String account,String password){
        String user_realPassword= adminUserMapper.getPasswordByAccount(account);
        if(user_realPassword==null)return null;
        if(user_realPassword.equals(password)&&account!=null){
            return adminUserMapper.getUserByAccount(account);
        }
        return null;
    }

    public List<AdminUser> getusers(){

        return adminUserMapper.getAll();
    }

    public List<AdminUser> selectPage(int pageNum, int pageSize, String search){
        pageNum=(pageNum-1)*pageSize;
        return adminUserMapper.selectPage(pageNum,pageSize,search);
    }

    public String del_user(String account){
        try {
            adminUserMapper.del_user(account);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public AUserInfoDTO get_Info_By_Account(String account){
        AdminUser adminUser = adminUserMapper.get_Info_By_Account(account);
        List<AdminRole> roleList = adminUser.getAdminRoleList();
        List<Course_Classes> ccList = new ArrayList<>();
        for(AdminRole i : roleList){
            ccList.addAll( courseClassMapper.getCCListByAR(account,i.getRole_id()));
        }
        return new AUserInfoDTO(adminUser,ccList);
    }

    public String setCC(List<Course_Classes> cc_list){
        try {
            for (Course_Classes cc : cc_list) {
                if(cc.getCid() == null || cc.getCid().equals("") ){return "输入为空";}
                courseClassMapper.setCCList(cc);
            }
        }catch (Exception e) {
            return e.toString();
        }
        return "";
    }

}
