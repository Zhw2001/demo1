package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseAuditMapper {
    List<CourseAudit> get_CA_By_CID(String cid);
    List<MyPart> get_Part_By_CID(String cid);
    List<MyItem> get_Item_By_CID(String cid);
    List<QStandard> get_S_By_CourseType(Integer course_type);
    List<course_goal_info> get_CG_By_Cid(String cid);
    void replaceMod(CourseAudit courseAudit);
    void replacePart(MyPart part);
    void replaceItem(MyItem item);
    void replace_CGInfo(course_goal_info course_goal);
    void delMod(CourseAudit courseAudit);
    void delPart(MyPart part);
    void delItem(MyItem item);
    void del_CGInfo(course_goal_info course_goal);

}
