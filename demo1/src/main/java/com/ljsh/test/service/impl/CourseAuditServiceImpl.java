package com.ljsh.test.service.impl;

import com.ljsh.test.dto.*;
import com.ljsh.test.domain.mapper.CourseAuditMapper;
import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.domain.model.*;
import com.ljsh.test.service.CourseAuditService;
import com.ljsh.test.utils.TestEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.util.stream.Collectors.toList;


@Service
public class CourseAuditServiceImpl implements CourseAuditService {
    @Autowired
    private CourseAuditMapper courseAuditMapper;
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    private <T> List<T> getRemoveList(List<T> oldlist, List<T> currList) {
        return oldlist.stream().filter(item -> !currList.contains(item)).collect(toList()); //在A不在B,保留未被修改的数据
    }
    private <T> List<T> getAddList(List<T> oldlist, List<T> currList) {
        return currList.stream().filter(item -> !oldlist.contains(item)).collect(toList()); //在B不在A
    }

    private String StrArrayToString(String[] arr, String Separator) {
        StringBuilder res = new StringBuilder();
        for (String i : arr) {
            res.append(i);
            res.append(Separator);
        }
        return res.toString();
    }
    private Course_Goal generateCGInfo(Integer id, CTargetDTO ctarget, List<String> fatherOfItem, Long audit_id) {
        StringBuilder builder = new StringBuilder();
        String content = StrArrayToString(ctarget.getContent(), ",");
        content = (content.length() < 1 ? "" : content.substring(0, content.length() - 1));
        for (String part : ctarget.getParts()) {
            if (fatherOfItem.contains(part)) {
                builder.append(part);
                builder.append("：");
                builder.append("[");
                builder.append(content);
                builder.append("]");
                builder.append(",");
            } else {
                builder.append(part);
                builder.append(",");
            }
        }
        String build = builder.toString();
        return new Course_Goal(id, audit_id, ctarget.getValue(), ctarget.getStandards()[0], ctarget.getStandards()[1], ctarget.getStandards()[2], ctarget.getStandards()[3], ctarget.getStandards()[4], ctarget.getSupport_graduation_require(), build.substring(0, build.length() - 1), ctarget.getTotal(), null, null, null, null, null);
    }
    private String getExamType(int type) {
        String res = "";
        switch (type) {
            case 0:
                res = "考试";
                break;
            case 1:
                res = "考查";
                break;
        }
        return res;
    }
    private int SetExamType(String type) {
        int res = -1;
        switch (type) {
            case "考试":
                res = 0;
                break;
            case "考查":
                res = 1;
                break;
        }
        return res;
    }
    private int SetCourseType(String cname) {
        int e_i = cname.indexOf("实验");
        int c_i = cname.indexOf("课程设计");
        int g_i = cname.indexOf("毕业设计");
        if (e_i != -1) {
            return 1;
        } else if (c_i != -1) {
            return 2;
        } else if (g_i != -1) {
            return 3;
        }
        return 0;
    }
    private <T> T findTByName(String name, List<T> tList){
        for ( T i : tList){
            if(TestEntity.objCheckHasName(i,name)){
                return i;
            }
        }
        return null;
    }
    private MyPart FindMyPart(Long id, List<MyPart> myParts){
        for ( MyPart p : myParts){
            if(p.getPart_id() == id){
                return p;
            }
        }
        return null;
    }

    public List<String> getSemester(String cid){
        return courseAuditMapper.get_SemesterList(cid);
    }

    public String update(CourseAuditDTO cAudit) {
        try {
            List<MyMod> currMods = new ArrayList<>();
            List<MyPart> currParts = new ArrayList<>();
            List<MyItem> currItems = new ArrayList<>();
            List<Course_Goal> course_goals = new ArrayList<>();
            //获取数据
            BasicInfoDTO basic_info = cAudit.getBasicInfo();
            List<CTargetDTO> cTargets = cAudit.getCtargets();
            List<ModDTO> mods = cAudit.getMods();
            List<PartDTO> parts = cAudit.getParts();
            List<String> fatherOfItem = cAudit.getFatherOfItem();
            List<ItemDTO> items = cAudit.getItems();
            //如果获取数据不完整则返回错误信息
            if (basic_info == null || cTargets.isEmpty() || mods.isEmpty() || fatherOfItem.isEmpty() || items.isEmpty() || basic_info.getSemester() == null || basic_info.getCourse_number() == null) {
                return "输入不完整";
            }
            if (TestEntity.objCheckHasNull(basic_info)) {
                return "输入不完整";
            }
            String cid = basic_info.getCourse_number();//获取课程编号
            String semester = basic_info.getSemester();//获取审核学期
            AuditInfo auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);    //找到已有的审核记录
            if (auditInfo == null) {  //如果没有审核记录就新建一条
                courseAuditMapper.addAuditInfo(new AuditInfo(null, semester, cid,basic_info.getClasses(), null, null, null, null, null, null, null, SetExamType(cAudit.getBasicInfo().getExam_type()), null, null));
                auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);
            } else {
                courseAuditMapper.updateAInfo_Sem_Etype(auditInfo.getId(),semester,SetExamType(cAudit.getBasicInfo().getExam_type()));
            }
            Long audit_id = auditInfo.getId();  //获取审核ID
            List<Course_Goal> old_CGList = courseAuditMapper.get_CGList(audit_id);  //获取历史信息
            List<MyMod> oldMods = courseAuditMapper.get_ModList(audit_id);
            //存储课程目标信息
            int count = 0;
            for (CTargetDTO l : cTargets) {//有序遍历课程目标
                course_goals.add(generateCGInfo(count++, l, cAudit.getFatherOfItem(), audit_id));
            }
            for(Course_Goal cg : getRemoveList(old_CGList,course_goals)){
                courseAuditMapper.del_CG(cg);
            }
            for(Course_Goal cg : getAddList(old_CGList,course_goals)) {
                courseAuditMapper.add_CG(cg);
            }
            //存储MOD信息
            for(int i = 0; i < mods.size(); i++){   //遍历modDTOList中的mod，获取mod数据
                ModDTO modDTO = mods.get(i);
                //此处的module_id可能为空
                currMods.add(new MyMod(modDTO.getId(),modDTO.getName(),audit_id,i));
            }
            for(MyMod m : getRemoveList(oldMods,currMods)){ //删除mod脏数据的同时,由于数据库中外键约束，级联删除part和item中的脏数据
                courseAuditMapper.delMod(m);
            }
            for(MyMod m : getAddList(oldMods,currMods)){
                courseAuditMapper.addMod(m);
            }
            currMods = courseAuditMapper.get_ModList(audit_id); //改变当前cuurMods的指向,从指向由前台数据构建的mods变更为指向数据库中存储的mods
            //存储part信息
            for(ModDTO m : mods){   //遍历modDTOList中的mod，获取mod名字和index
                for( int j = 0; j < m.getPartNames().length; j++){ //获取MyPart并录入
                    String partName = m.getPartNames()[j];
                    PartDTO part_dto = findTByName(partName,parts);
                    //此处的part_id可能为空
                    currParts.add(new MyPart(part_dto.getId(),partName,part_dto.getRatio(),j,findTByName(m.getName(),currMods).getModule_id()));
                }
            }
            for(MyPart p : currParts){
                courseAuditMapper.addPart(p);
            }
            currParts = new ArrayList<>();  //更新currParts为数据库中的part
            for(MyMod m : currMods){
                currParts.addAll(courseAuditMapper.get_PartList(m.getModule_id()));
            }
            //存储item信息
            for (String x : fatherOfItem) { //存储当前课程所有part的item信息
                MyPart part = findTByName(x,currParts);
                for(int i = 0; i < items.size(); i++){
                    ItemDTO itemDTO = items.get(i);
                    currItems.add(new MyItem(itemDTO.getId(),itemDTO.getName(),itemDTO.getScore(),i,part.getPart_id()));
                }
            }
            for(MyItem i : currItems){
                courseAuditMapper.addItem(i);
            }
            courseAuditMapper.refreshItem();
        } catch (Exception e) {
            return e.toString();
        }
        return "";
    }

    public CourseAuditDTO getInfo(String semester, String cid) {
        String[] empty = new String[0];
        AuditInfo auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);
        CInfo cInfo = courseInfoMapper.get_CInfo(cid);
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
        BasicInfoDTO basicInfo = new BasicInfoDTO(semester, ft.format(dNow), cInfo.getCname(), cInfo.getCid(), null, null);
        List<QStandard> QStandardList = courseAuditMapper.get_Standard(cInfo.getCourse_type());
        String[] question_standard = new String[QStandardList.size()];
        for (int x = 0; x < QStandardList.size(); x++) {
            question_standard[x] = QStandardList.get(x).getStandard();
        }
        if (auditInfo == null) {  //如果没有找到审核相关信息返回NULL
            return new CourseAuditDTO(basicInfo, null, null, null, null, null, question_standard);
        }
        Long audit_id = auditInfo.getId();
        basicInfo.setClasses(auditInfo.getClasses());
        basicInfo.setExam_type(getExamType(auditInfo.getExam_type()));
        List<MyMod> myModList = courseAuditMapper.get_ModList(audit_id);
        List<MyPart> partList = new ArrayList<>();
        List<MyItem> itemList = new ArrayList<>();
        for(MyMod m : myModList){
            partList.addAll(courseAuditMapper.get_PartList(m.getModule_id()));
        }
        for(MyPart p : partList){
            itemList.addAll(courseAuditMapper.get_ItemList(p.getPart_id()));
        }
        List<Course_Goal> CG = courseAuditMapper.get_CGList(audit_id);
        List<CTargetDTO> ctargets = new ArrayList<>();
        List<ModDTO> mods = new ArrayList<>();
        List<PartDTO> parts = new ArrayList<>();
        List<ItemDTO> items = new ArrayList<>();
        List<String> fatherOfItem = new ArrayList<>();
        for (Course_Goal i : CG) {
            String[] CStandards = new String[5];
            CStandards[0] = i.getExcellent();
            CStandards[1] = i.getGood();
            CStandards[2] = i.getNormal();
            CStandards[3] = i.getPass();
            CStandards[4] = i.getPoor();
            CTargetDTO cTarget = new CTargetDTO(i.getCourse_goal_text(), empty, i.getGraduate_require(), empty, 0f, CStandards);
            ctargets.add(cTarget);
        }
        for (MyMod i : myModList) {
            ModDTO mod = new ModDTO(
                    i.getModule_id(),
                    i.getName(),
                    empty,
                    empty,
                    empty,
                    0f
            );
            mods.add(mod);//在最后面进行插入，不需要进行位移
        }
        for (MyPart j : partList) {
            PartDTO part = new PartDTO(
                    j.getPart_id(),
                    j.getName(),
                    j.getRatio(),
                    true
            );
            parts.add(part);
        }
        for (int k = 0; k < itemList.size(); k++) {
            String father = FindMyPart(itemList.get(k).getPart_id(),partList).getName();
            if (k == 0) {
                fatherOfItem.add(father);
            } else if (!fatherOfItem.contains(father)) {
                fatherOfItem.add(father);
            }
            ItemDTO item = new ItemDTO(itemList.get(k).getItem_id(),itemList.get(k).getName(), itemList.get(k).getScore(), true);
            items.add(item);
        }
        return new CourseAuditDTO(basicInfo, ctargets, mods, parts, items, fatherOfItem, question_standard);
    }

}
