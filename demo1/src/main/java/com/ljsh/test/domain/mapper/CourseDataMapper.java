package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.CDesign;
import com.ljsh.test.domain.model.Course;
import com.ljsh.test.domain.model.Exper;
import com.ljsh.test.domain.model.GDesign;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseDataMapper {
    List<Course> get_CourseDataList(List<String> cids);
    List<Exper> get_ExperDataList(List<String> cids);
    List<CDesign> get_CdesignDataList(List<String> cids);
    List<GDesign> get_GdesignDataList(List<String> cids);
}
