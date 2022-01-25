package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.AdminUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminUserMapper {
    void newu(AdminUser u);
    AdminUser getUserByAccount(String account);
    String getPasswordByAccount(String account);
    Integer getUidByAccount(String account);
    List<AdminUser> getAll();
    List<AdminUser> selectPage(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize, @Param("search")String search);
    void del_user(String account);
    AdminUser get_Auth_info(String account);
    void set_user_auth(int admin_uid);
    void del_user_auth(int admin_uid);
}
