package com.ljsh.test.service;

import com.ljsh.test.domain.model.Course_Classes;
import com.ljsh.test.dto.AUserInfoDTO;
import com.ljsh.test.domain.model.AdminUser;

import java.util.List;

public interface AdminUserService {
    String regist(AdminUser u);
    AdminUser login(String account,String password);
    List<AdminUser> getusers();
    List<AdminUser> selectPage(int pageNum, int pageSize, String search);
    String del_user(String account);
    AUserInfoDTO get_Info_By_Account(String account);
    String setCC(List<Course_Classes> cc_list);
}
