package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.AdminAuth;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminAuthMapper {
    List<AdminAuth> getAuthList();
}
