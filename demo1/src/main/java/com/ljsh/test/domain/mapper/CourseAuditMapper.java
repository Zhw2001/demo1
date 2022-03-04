package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseAuditMapper {
    List<String> get_SemesterList(String cid);
    List<MyMod> get_ModList(Long audit_id);
    List<MyPart> get_PartList(Long module_id);
    List<MyItem> get_ItemList(Long part_id);
    List<QStandard> get_Standard(Integer course_type);
    List<Course_Goal> get_CGList(Long audit_id);
    MyMod get_Mod(MyMod myMod);
    MyPart get_Part(MyPart myPart);
    MyItem get_Item(MyItem myItem);
    AuditInfo get_AuditInfo(@Param("semester")String semester, @Param("cid")String cid);
    void addAuditInfo(AuditInfo auditInfo);
    void updateAuditInfo(AuditInfo auditInfo);
    void updateAInfo_Sem_Etype(@Param("id") Long id,@Param("semester") String semester,@Param("exam_type")Integer exam_type);
    void replaceMod(MyMod myMod);
    void replacePart(MyPart part);
    void replaceItem(MyItem item);
    void addMod(MyMod myMod);
    void addPart(MyPart part);
    void addItem(MyItem item);
    void add_CG(Course_Goal course_goal);
    void replace_CG(Course_Goal course_goal);
    void delMod(MyMod myMod);
    void delPart(MyPart part);
    void delItem(MyItem item);
    void del_CG(Course_Goal course_goal);
    void refreshItem();
}
