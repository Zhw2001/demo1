package com.ljsh.test.service;

import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.dto.RelationUpdateDTO;

import java.util.List;

public interface AdminUserService {
    String regist(AdminUser u);
    AdminUser login(String account,String password);
    List<AdminUser> getusers();
    List<AdminUser> selectPage(int pageNum, int pageSize, String search);
    String del_user(String account);
    AdminUser get_Info(String account);
    //用户分配课程
    String updateCourseOfUser(RelationUpdateDTO relationUpdate);
    List<CInfo> getCourseList(Long ur_id);
    Long getURIDByUserRole(Long uid, Long role_id);
    //用户分配角色
    String updateRole(RelationUpdateDTO relationUpdate);
}
