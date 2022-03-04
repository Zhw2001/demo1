package com.ljsh.test.domain.mapper;
import com.ljsh.test.domain.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseInfoMapper {
    List<CInfo> get_CInfoList(List<String> cids);
    CInfo get_CInfo(String cid);
    List<CInfo> get_All();
    void updateCourseInfo(CInfo cInfo);
    void replaceCInfo(CInfo cInfo);
}
