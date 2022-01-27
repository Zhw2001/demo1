package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.UserAuth;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserAuthMapper {
    List<UserAuth> getAuthList();
}
