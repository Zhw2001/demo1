package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.AdminAuth;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminAuthMapper {
    List<AdminAuth> getAuthList();
}
