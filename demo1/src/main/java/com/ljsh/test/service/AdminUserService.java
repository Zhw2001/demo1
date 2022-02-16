package com.ljsh.test.service;

import com.ljsh.test.mbg.model.AdminUser;

import java.util.List;

public interface AdminUserService {
    String regist(AdminUser u);
    AdminUser login(String account,String password);
    List<AdminUser> getusers();
    List<AdminUser> selectPage(int pageNum, int pageSize, String search);
    String del_user(String account);
    AdminUser getRole(String account);
    AdminUser get_Info_By_Account(String account);
}
