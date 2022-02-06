package com.ljsh.test.service;

import com.ljsh.test.mbg.model.AdminUser;

import java.util.List;

public interface AdminUserService {
    Boolean regist(AdminUser u);
    AdminUser login(String account,String password);
    List<AdminUser> getusers();
    List<AdminUser> selectPage(int pageNum, int pageSize, String search);
    Boolean del_user(String account);
    AdminUser getRole(String account);
}
