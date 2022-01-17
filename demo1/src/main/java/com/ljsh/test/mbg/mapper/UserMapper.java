package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.TheUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    void newu( TheUser u);
    TheUser getUserById(long id);
    TheUser getUserByUsername(String username);
    String getPasswordbyUsername(String username);
    List<TheUser> getAll();
    List<TheUser> selectPage(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize,@Param("search")String search);
    void del_user(int id);
    int count_total();
}
