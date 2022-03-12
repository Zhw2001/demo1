package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseAuditMapper {
    List<String> get_SemesterList(String cid);

    List<QStandard> get_Standard(Integer course_type);

    AuditInfo get_AuditInfo(@Param("semester")String semester, @Param("cid")String cid);
    void addAuditInfo(AuditInfo auditInfo);
    void updateAuditInfo(AuditInfo auditInfo);

    List<Course_Goal> get_CGList(Long audit_id);
    void add_CG(List<Course_Goal> course_goals);
    void update_CG(List<Course_Goal> course_goals);
    void del_CG(List<Course_Goal> course_goal);

    List<MyMod> get_ModList(Long audit_id);
    List<MyPart> get_PartList(Long module_id);
    List<MyItem> get_ItemList(Long part_id);
    MyMod get_Mod(MyMod myMod);
    MyPart get_Part(MyPart myPart);
    MyItem get_Item(MyItem myItem);
    void addMod(MyMod myMod);
    void addPart(MyPart part);
    void addItem(MyItem item);
    void delMod(MyMod myMod);
    void delPart(MyPart part);
    void delItem(MyItem item);
    List<Goal_Detail> get_goalDetail(List<Long> goal_id_list);
    void refreshItem();
}
