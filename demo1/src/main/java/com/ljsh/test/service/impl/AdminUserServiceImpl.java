package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.dto.AUserInfoDTO;
import com.ljsh.test.domain.mapper.AdminUserMapper;
import com.ljsh.test.domain.model.AdminUser;
import com.ljsh.test.dto.RelationUpdateDTO;
import com.ljsh.test.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

    public AUserInfoDTO get_Info(String account){
        AdminUser adminUser = adminUserMapper.get_Info_By_Account(account);
        Long uid = adminUser.getUid();
        List<String> cids = adminUserMapper.getCidsOfUser(uid);
        List<CInfo> cinfoList = courseInfoMapper.get_CInfoList(cids);
        return new AUserInfoDTO(adminUser,cinfoList);
    }

    public String updateCourseOfUser(RelationUpdateDTO relationUpdate){   //更新教师教授的课程
        try {
            Long uid = Long.parseLong(relationUpdate.getSubject_id().toString());
            for( Object i : relationUpdate.getInsert()){
                adminUserMapper.replaceCidOfUser(uid,i.toString());
            }
        }catch (Exception e) {
            return e.toString();
        }
        return "";
    }

    public String delCourseOfUser(RelationUpdateDTO relationUpdate){   //删除教师教授的课程
        try {
            Long uid = Long.parseLong(relationUpdate.getSubject_id().toString());
            for( Object i : relationUpdate.getDelete()){
                adminUserMapper.delCidOfUser(uid,i.toString());
            }
        }catch (Exception e) {
            return e.toString();
        }
        return "";
    }

    public List<CInfo> getCourseList(Long uid){
        List<String> cids = adminUserMapper.getCidsOfUser(uid);
        return courseInfoMapper.get_CInfoList(cids);
    }

}
