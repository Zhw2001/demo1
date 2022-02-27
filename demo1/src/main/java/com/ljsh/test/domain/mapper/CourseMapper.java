package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.CourseData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper {
    List<CourseData> get_All_C();
    void addCourse(CourseData courseData);
    void delCourse(Long id);
    void updateCourse(CourseData courseData);
}
