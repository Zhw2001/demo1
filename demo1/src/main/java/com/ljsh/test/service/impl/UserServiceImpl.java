package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.UserMapper;
import com.ljsh.test.mbg.model.TheUser;
import com.ljsh.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ThemeResolver;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public Boolean regist(TheUser u){
        TheUser existuser =  userMapper.getUserByUsername(u.getUsername());
        if(existuser == null){
            userMapper.newu(u);
            return true;
        }
        return false;
    }
    public Boolean login(String username,String password){
        String username_data=userMapper.getPasswordbyUsername(username);
        if(username_data==null)return false;
        if(username_data.equals(password)&&username!=null){
            return true;
        }
        return false;
    }

    public List<TheUser> getusers(){
        return userMapper.getAll();
    }

}
