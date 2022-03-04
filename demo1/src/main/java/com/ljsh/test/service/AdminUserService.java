package com.ljsh.test.service;

import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.dto.AUserInfoDTO;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.dto.RelationUpdateDTO;

import java.util.List;

public interface AdminUserService {
    String regist(AdminUser u);
    AdminUser login(String account,String password);
    List<AdminUser> getusers();
    List<AdminUser> selectPage(int pageNum, int pageSize, String search);
    String del_user(String account);
    AUserInfoDTO get_Info(String account);
    String updateCourseOfUser(RelationUpdateDTO relationUpdate);
    String delCourseOfUser(RelationUpdateDTO relationUpdate);
    List<CInfo> getCourseList(Long uid);
}
