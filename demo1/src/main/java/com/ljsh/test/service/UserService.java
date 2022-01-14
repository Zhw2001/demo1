package com.ljsh.test.service;

import com.ljsh.test.mbg.model.TheUser;

import java.util.List;

public interface UserService {
    Boolean regist(TheUser u);
    Boolean login(String username,String password);
    List<TheUser> getusers();
}
