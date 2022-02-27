package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.Course_Classes;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseClassMapper {
    List<Course_Classes> getCCListByAR(@Param("account")String account,@Param("role_id") Long role_id);
    void setCCList(Course_Classes course_classes);
}
