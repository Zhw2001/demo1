package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.CourseInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseInfoMapper {
    List<CourseInfo> get_Course_Cid(String[] cids);
    List<CourseInfo> get_Exper_Cid(String[] cids);
    List<CourseInfo> get_Cdesign_Cid(String[] cids);
    List<CourseInfo> get_Gdesign_Cid(String[] cids);
}
