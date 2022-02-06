package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.CourseInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseInfoMapper {
    CourseInfo get_Course_By_cid_Dep(@Param("cid") String cid,@Param("dep")String dep);
    CourseInfo get_Cdesign_By_cid_Dep(@Param("cid") String cid,@Param("dep")String dep);
    CourseInfo get_Gdesign_By_cid_Dep(@Param("cid") String cid,@Param("dep")String dep);
    CourseInfo get_Exp_By_cid_Dep(@Param("cid") String cid,@Param("dep")String dep);
    int get_Type_By_Cid(String cid);
}
