package com.ljsh.test.service;

import com.ljsh.test.mbg.model.TheUser;

import java.util.List;

public interface UserService {
    Boolean regist(TheUser u);
    Boolean login(String username,String password);
    List<TheUser> getusers();
    List<TheUser> selectPage(int pageNum,int pageSize,String search);
    Boolean del_user(int id);
}
