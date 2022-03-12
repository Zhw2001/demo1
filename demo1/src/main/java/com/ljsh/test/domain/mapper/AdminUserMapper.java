package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.domain.model.Admin_User_Course;
import com.ljsh.test.domain.model.Admin_User_Role;
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
    AdminUser get_Info_By_Account(String account);
    //用户分配角色
    void insertUserRole(List<Admin_User_Role> admin_user_roles);
    void delRoleOfUser(List<Admin_User_Role> admin_user_roles);
    //用户分配课程
    Long getURIDByUserRole(@Param("UR_uid") Long uid, @Param("UR_role_id") Long role_id);
    List<String> getCidsOfUser(Long UR_ID);
    void insCourseOfUser(List<Admin_User_Course> admin_user_courses);
    void delCourseOfUser(List<Admin_User_Course> admin_user_courses);
}
