package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.UserAuthMapper;
import com.ljsh.test.mbg.model.UserAuth;
import com.ljsh.test.service.UserRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleMenuServiceImpl implements UserRoleMenuService {
    @Autowired
    private UserAuthMapper userAuthMapper;

    public List<UserAuth> getAuthMenu(){
        List<UserAuth> userAuths = userAuthMapper.getAuthList();
        return userAuths;
    }
}
