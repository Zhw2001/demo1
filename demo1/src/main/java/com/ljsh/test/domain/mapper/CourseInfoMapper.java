package com.ljsh.test.domain.mapper;
import com.ljsh.test.domain.model.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseInfoMapper {
    List<Course> get_Course_Cid(List<String> cids);
    List<Exper> get_Exper_Cid(List<String> cids);
    List<CDesign> get_Cdesign_Cid(List<String> cids);
    List<GDesign> get_Gdesign_Cid(List<String> cids);
    CourseInfo GET_CINFO_CID(String cid);
    List<CourseInfo> get_All_cNames_cids();
    List<cinfo> GET_BINFO_CID(List<String> cids);
    void replaceCourseInfo(CourseInfo courseInfo);
    void updateCourseInfo(CourseInfo courseInfo);
}
