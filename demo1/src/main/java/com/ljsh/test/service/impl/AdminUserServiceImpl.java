package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.domain.model.Admin_User_Course;
import com.ljsh.test.domain.model.Admin_User_Role;
import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.domain.mapper.AdminUserMapper;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.dto.RelationUpdateDTO;
import com.ljsh.test.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private AdminUserMapper adminUserMapper;
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    private <T> List<T> getRemoveList(List<T> oldlist, List<T> currList) {
        return oldlist.stream().filter(item -> !currList.contains(item)).collect(toList()); //在A不在B
    }
    private <T> List<T> getAddList(List<T> oldlist, List<T> currList) {
        return currList.stream().filter(item -> !oldlist.contains(item)).collect(toList()); //在B不在A
    }

    public String regist(AdminUser u){
        AdminUser existuser =  adminUserMapper.getUserByAccount(u.getAccount());
        if(existuser == null){
            try{
            adminUserMapper.newu(u);
            }catch (Exception e){
                return e.toString();
            }
            return "";
        }
        return "用户已存在";
    }
    public AdminUser login(String account,String password){
        String user_realPassword= adminUserMapper.getPasswordByAccount(account);
        if(user_realPassword==null)return null;
        if(user_realPassword.equals(password)&&account!=null){
            return adminUserMapper.getUserByAccount(account);
        }
        return null;
    }

    public List<AdminUser> getusers(){
        return adminUserMapper.getAll();
    }

    public List<AdminUser> selectPage(int pageNum, int pageSize, String search){
        pageNum=(pageNum-1)*pageSize;
        return adminUserMapper.selectPage(pageNum,pageSize,search);
    }

    public String del_user(String account){
        try {
            adminUserMapper.del_user(account);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public AdminUser get_Info(String account){
        return adminUserMapper.get_Info_By_Account(account);
    }

    //为用户分配角色
    public String updateRole(RelationUpdateDTO relationUpdate){
        try {
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
            Long uid = Long.parseLong(relationUpdate.getSubject_id().toString());
            String UR_ID_Head =ft.format(dNow);
            List<Admin_User_Role> admin_user_roles = new ArrayList<>();
            if(relationUpdate.getInsert() != null && relationUpdate.getInsert().size() > 0) {
                for (int i = 0; i < relationUpdate.getInsert().size(); i++) {
                    Admin_User_Role temp = new Admin_User_Role(Long.parseLong(UR_ID_Head + i), uid, Long.parseLong(relationUpdate.getInsert().get(i).toString()));
                    admin_user_roles.add(temp);
                }
                adminUserMapper.insertUserRole(admin_user_roles);
            }
            admin_user_roles = new ArrayList<>();
            if(relationUpdate.getDelete()!=null && relationUpdate.getDelete().size() > 0) {
                for (Object role_id : relationUpdate.getDelete()) {
                    Admin_User_Role temp = new Admin_User_Role(null, uid, Long.parseLong(role_id.toString()));
                    admin_user_roles.add(temp);
                }
                adminUserMapper.delRoleOfUser(admin_user_roles);
            }
        }catch (Exception e) {
            return e.toString();
        }
        return "";
    }

    //分配课程
    public String updateCourseOfUser(RelationUpdateDTO relationUpdate){   //更新教师教授的课程
        try {
            Long UR_ID = Long.parseLong(relationUpdate.getSubject_id().toString());
            List<Admin_User_Course> admin_user_courses = new ArrayList<>();
            if(relationUpdate.getInsert() != null && relationUpdate.getInsert().size() > 0) {
                for (Object i : relationUpdate.getInsert()) {
                    Admin_User_Course admin_user_course = new Admin_User_Course(UR_ID, i.toString());
                    admin_user_courses.add(admin_user_course);
                }
                adminUserMapper.insCourseOfUser(admin_user_courses);
            }
            admin_user_courses = new ArrayList<>();
            if(relationUpdate.getDelete()!=null && relationUpdate.getDelete().size() > 0) {
                for (Object i : relationUpdate.getDelete()) {
                    Admin_User_Course admin_user_course = new Admin_User_Course(UR_ID, i.toString());
                    admin_user_courses.add(admin_user_course);
                }
                adminUserMapper.delCourseOfUser(admin_user_courses);
            }
        }catch (Exception e) {
            return e.toString();
        }
        return "";
    }


    public List<CInfo> getCourseList(Long ur_id){
        List<String> cids = adminUserMapper.getCidsOfUser(ur_id);
        if(cids.size() < 1){return null;}
        return courseInfoMapper.get_CInfoList(cids);
    }

    public Long getURIDByUserRole(Long uid, Long role_id){
        return adminUserMapper.getURIDByUserRole(uid, role_id);
    }

    public List<AdminUser> get_AuditPs(){
        return adminUserMapper.getAuditPs();
    }

}
