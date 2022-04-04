package com.ljsh.test.service.impl;

import com.ljsh.test.dto.*;
import com.ljsh.test.domain.mapper.CourseAuditMapper;
import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.domain.model.*;
import com.ljsh.test.service.CourseAuditService;
import com.ljsh.test.utils.ContentMap;
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
        return new Course_Goal(null,id, audit_id, ctarget.getValue(), ctarget.getStandards()[0], ctarget.getStandards()[1], ctarget.getStandards()[2], ctarget.getStandards()[3], ctarget.getStandards()[4], ctarget.getSupport_graduation_require(), build.substring(0, build.length() - 1), ctarget.getTotal(), (float) (ctarget.getTotal()*0.6), null, null, null, null);
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
    private Boolean StringInArray(String str, String[] array){
        for (String s : array){
            if( s.equals(str)){
                return true;
            }
        }
        return false;
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
            if(p.getPart_id().equals(id)){
                return p;
            }
        }
        return null;
    }

    public List<String> getSemester(String cid){
        return courseAuditMapper.get_SemesterList(cid);
    }

    public String updateAudit(CourseAuditDTO cAudit) {
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
            String cid = basic_info.getCourse_number();//获取课程编号
            String semester = basic_info.getSemester();//获取审核学期
            AuditInfo auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);    //找到已有的审核记录
            if (auditInfo == null) {  //如果没有审核记录就新建一条
                courseAuditMapper.addAuditInfo(new AuditInfo(null, semester, cid,basic_info.getClasses(), basic_info.getAudit_date(), null, null, null, null, null, null, null, null, SetExamType(cAudit.getBasicInfo().getExam_type()), null, null, basic_info.getAudit_person(), null, basic_info.getSet_paper_person(), basic_info.getPass_ratio()));
                auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);
            } else {
                auditInfo.setClasses(basic_info.getClasses());
                auditInfo.setSemester(semester);
                auditInfo.setAudit_date(basic_info.getAudit_date());
                auditInfo.setAudit_person(basic_info.getAudit_person());
                auditInfo.setSet_paper_person(basic_info.getSet_paper_person());
                auditInfo.setExam_type(SetExamType(cAudit.getBasicInfo().getExam_type()));
                auditInfo.setPass_ratio(basic_info.getPass_ratio());
                courseAuditMapper.updateAuditInfo(auditInfo);
            }
            Long audit_id = auditInfo.getId();  //获取审核ID
            List<Course_Goal> old_CGList = courseAuditMapper.get_CGList(audit_id);  //获取历史信息
            List<MyMod> oldMods = courseAuditMapper.get_ModList(audit_id);
            //获取课程目标信息
            int count = 0;
            List<ContentMap> contentMaps = new ArrayList<>();
            for (CTargetDTO l : cTargets) {//有序遍历课程目标
                contentMaps.add(new ContentMap(audit_id, count, l.getContent(),l.getParts()));
                course_goals.add(generateCGInfo(count++, l, cAudit.getFatherOfItem(), audit_id));
            }
            //存储课程目标信息
            List<Course_Goal> insCGList = new ArrayList<>();
            List<Course_Goal> updCGList = new ArrayList<>();
            List<Course_Goal> delCGList = new ArrayList<>();
            for( int goal_index = 0; goal_index < Math.max(old_CGList.size(),course_goals.size()); goal_index++){
                if( goal_index >= old_CGList.size()){   //如果课程目标号超出旧的课程目标列表，则接下来都是新增
                    insCGList.add(course_goals.get(goal_index));
                    continue;
                }
                if( goal_index >= course_goals.size()){ //如果课程目标号超出新的课程目标列表，则接下来都是脏数据
                    delCGList.add(old_CGList.get(goal_index));
                    continue;
                }
                course_goals.get(goal_index).setGoal_id(old_CGList.get(goal_index).getGoal_id());
                updCGList.add(course_goals.get(goal_index));
            }
            if(delCGList.size() > 0) {
                courseAuditMapper.del_CG(delCGList);
            }
            if(insCGList.size() > 0) {
                courseAuditMapper.add_CG(insCGList);
            }
            if(updCGList.size() > 0){
                courseAuditMapper.update_CG(updCGList);
            }
            List<Course_Goal> currCGList = courseAuditMapper.get_CGList(audit_id);
            //存储MOD信息
            for(int i = 0; i < mods.size(); i++){   //遍历modDTOList中的mod，获取mod数据
                ModDTO modDTO = mods.get(i);
                //此处的module_id可能为空,新增的时候主键会自增
                currMods.add(new MyMod(modDTO.getId(),modDTO.getName(),audit_id,i));
            }
            for(MyMod m : oldMods){ //删除原有的mod数据的同时,由于数据库中外键约束，级联删除part和item
                courseAuditMapper.delMod(m);
            }
            for(MyMod m : currMods){
                courseAuditMapper.addMod(m);
            }
            currMods = courseAuditMapper.get_ModList(audit_id); //改变当前currMods的指向,从指向由前台数据构建的mods变更为指向数据库中存储的mods
            //存储part信息
            for(ModDTO m : mods){   //遍历modDTOList中的mod，获取mod名字和index
                for( int j = 0; j < m.getPartNames().length; j++){ //获取MyPart并录入
                    String partName = m.getPartNames()[j];
                    PartDTO part_dto = findTByName(partName,parts);
                    MyMod currMod = findTByName(m.getName(),currMods);
                    if(part_dto == null){return "error found in part of mod";}
                    if(currMod == null){return "error found in modDTO";}
                    //此处的part_id可能为空
                    currParts.add(new MyPart(part_dto.getId(),partName,part_dto.getRatio(),j,currMod.getModule_id()));
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
            outter:for(Course_Goal course_goal : currCGList){
                for(ContentMap contentMap : contentMaps){
                    if( contentMap.getCourse_goal_id().equals(course_goal.getCourse_goal_id()) && contentMap.getAudit_id().equals(course_goal.getAudit_id())){
                        for (String x : fatherOfItem) { //存储当前课程所有part的item信息
                            MyPart part = findTByName(x,currParts);
                            if(part == null){return "error found in fatherOfItem";}
                            for(int i = 0; i < items.size(); i++){
                                ItemDTO itemDTO = items.get(i);
                                if(StringInArray(itemDTO.getName(),contentMap.getContent())) {
                                    currItems.add(new MyItem(itemDTO.getId(), itemDTO.getName(), itemDTO.getScore(), i, part.getPart_id(), course_goal.getGoal_id()));
                                }
                            }
                        }
                        // 需要把没有item的part也存到item表
                        outterCycle:for(String p : contentMap.getParts()){
                            for (String x : fatherOfItem) {
                                if(p.equals(x)){   //如果item属于这个part,跳过此part
                                    continue outterCycle;
                                }
                            }
                            MyPart part = findTByName(p, currParts);
                            if(part == null){return "error found in contentMap";}
                            currItems.add(new MyItem(null, p, "100", -1, part.getPart_id(), course_goal.getGoal_id()));
                        }
                        continue outter; //下一个课程目标
                    }
                }
            }
            for(MyItem i : currItems){
                courseAuditMapper.addItem(i);
            }
        } catch (Exception e) {
            return e.toString();
        }
        return "";
    }

    public CourseAuditDTO getInfo(String semester, String cid, String page) {
        String[] empty = new String[0];
        // 获取审核信息和课程信息
        AuditInfo auditInfo = courseAuditMapper.get_AuditInfo(semester, cid);
        CInfo cInfo = courseInfoMapper.get_CInfo(cid);
        // 审核时间默认显示当前系统时间
        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd");
        // 构建一部分基础信息，即使没有审核信息也能展示的部分
        BasicInfoDTO basicInfo = new BasicInfoDTO(cInfo.getCname(), cInfo.getCid(), semester, ft.format(dNow), ft.format(dNow), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
        // 流程标准只和课程类型有关，四种课程对应四种固定的流程标准
        List<QStandard> QStandardList = courseAuditMapper.get_Standard(cInfo.getCourse_type());
        String[] question_standard = new String[QStandardList.size()];
        for (int x = 0; x < QStandardList.size(); x++) {
            question_standard[x] = QStandardList.get(x).getStandard();
        }
        // 如果没有找到审核相关信息返回空，让用户自己新建
        switch(page){
            case "audit":
                if (auditInfo == null) {
                    return new CourseAuditDTO(basicInfo, null, null, null, null, null, question_standard, null, null, null);
                }
            case "eva":
                if(TestEntity.objCheckHasNull(auditInfo)){
                    return null;
                }
        }
        Long audit_id = auditInfo.getId();
        // DTO构建素材准备
        basicInfo.setClasses(auditInfo.getClasses());
        basicInfo.setExam_type(getExamType(auditInfo.getExam_type()));
        basicInfo.setCourse_property(auditInfo.getCourse_property());
        basicInfo.setExam_date(auditInfo.getExam_date());
        basicInfo.setCourse_point(auditInfo.getCourse_point());
        basicInfo.setWeek_hour(auditInfo.getWeek_hour());
        basicInfo.setCourse_hour(auditInfo.getCourse_hour());
        basicInfo.setLesson_hour(auditInfo.getLesson_hour());
        basicInfo.setPractice_hour(auditInfo.getPractice_hour());
        basicInfo.setText_book(auditInfo.getTextbook());
        basicInfo.setAudit_person(auditInfo.getAudit_person());
        basicInfo.setEva_person(auditInfo.getEva_person());
        basicInfo.setSet_paper_person(auditInfo.getSet_paper_person());
        basicInfo.setGoals_degree_describe(auditInfo.getGoals_degree_describe());
        basicInfo.setPass_ratio(auditInfo.getPass_ratio());

        List<MyMod> myModList = courseAuditMapper.get_ModList(audit_id);
        List<MyPart> partList = new ArrayList<>();
        List<MyItem> itemList = new ArrayList<>();
        for(MyMod m : myModList){
            partList.addAll(courseAuditMapper.get_PartList(m.getModule_id()));
        }
        for(MyPart p : partList){
            itemList.addAll(courseAuditMapper.get_ItemList(p.getPart_id()));
        }
        // DTO构建准备,先建好空列表
        List<Course_Goal> CG = courseAuditMapper.get_CGList(audit_id);
        List<CTargetDTO> ctargets = new ArrayList<>();
        List<ModDTO> mods = new ArrayList<>();
        List<PartDTO> parts = new ArrayList<>();
        List<ItemDTO> items = new ArrayList<>();
        List<String> fatherOfItem = new ArrayList<>();
        List<Long> goal_id_list = new ArrayList<>();
        // MOD,PART,ITEM
        for (int k = 0; k < itemList.size(); k++) {
            if(itemList.get(k).getIndex().equals(-1)){continue;}    // 如果是没有item的part,跳过
            MyPart currPart = FindMyPart(itemList.get(k).getPart_id(),partList);
            if(currPart == null){return null;}
            String father = currPart.getName();
            if (k == 0) {
                fatherOfItem.add(father);
            } else if (!fatherOfItem.contains(father)) {
                fatherOfItem.add(father);
            }
            ItemDTO item = new ItemDTO(itemList.get(k).getItem_id(),itemList.get(k).getName(), itemList.get(k).getScore(), true);
            items.add(item);
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
        for (MyMod i : myModList) {
            List<MyPart> temp = new ArrayList<>();
            for(MyPart j : partList){
                if(j.getModule_id().equals(i.getModule_id())){
                    temp.add(j);
                }
            }
            String[] partNames = new String[temp.size()];
            String[] partRatios = new String[temp.size()];
            for(int k =0; k < temp.size(); k++){
                partNames[k] = temp.get(k).getName();
                partRatios[k] = temp.get(k).getRatio();
            }
            ModDTO mod = new ModDTO(
                    i.getModule_id(),
                    i.getName(),
                    partNames,
                    partRatios,
                    empty,
                    0f
            );
            mods.add(mod);//在最后面进行插入，不需要进行位移
        }
        List<GoalDetailDTO> goalDetailDTOS = new ArrayList<>();
        EvaFormDTO evaForm = null;
        if(page.equals("eva")) {
            //获取学生成绩
            List<Float> expectationList = new ArrayList<>();
            for (Course_Goal i : CG) {
                goal_id_list.add(i.getGoal_id());
                expectationList.add(i.getExpectation());
            }
            List<Goal_Detail> goal_details = courseAuditMapper.get_goalDetail(goal_id_list);
            for (Long gid : goal_id_list) {
                List<Float> value = new ArrayList<>();
                for (Goal_Detail gd : goal_details) {
                    if (gid.equals(gd.getGoal_id())) {
                        value.add(gd.getValue());
                    }
                }
                GoalDetailDTO temp = new GoalDetailDTO(gid, value);
                goalDetailDTOS.add(temp);
            }
            //统计学生成绩情况
            int need_exam = goalDetailDTOS.get(0).getValue().size();    //  这门课有多少学生
            int miss_exam = 0;
            int poor_num = 0;
            int pass_num = 0;
            int normal_num = 0;
            int good_num = 0;
            int excellent_num = 0;
            float pass_ratio;
            float excellent_ratio;
            for (int i = 0; i < goalDetailDTOS.get(0).getValue().size(); i++) {
                float total = 0f;
                for (int j = 0; j < goal_id_list.size(); j++) {
                    total += goalDetailDTOS.get(j).getValue().get(i);
                }
                if (total >= 90) {
                    excellent_num++;
                } else if (total >= 80) {
                    good_num++;
                } else if (total >= 70) {
                    normal_num++;
                } else if (total >= 60) {
                    pass_num++;
                } else if (total == 0f) {
                    miss_exam++;
                } else {
                    poor_num++;
                }
            }
            pass_ratio = ((float) (need_exam - poor_num - miss_exam) / need_exam) * 100;
            excellent_ratio = ((float) excellent_num / need_exam) * 100;
            java.text.DecimalFormat dec_f = new java.text.DecimalFormat("#.00");
            pass_ratio = Float.parseFloat(dec_f.format(pass_ratio));
            excellent_ratio = Float.parseFloat(dec_f.format(excellent_ratio));
            evaForm = new EvaFormDTO(need_exam, miss_exam, poor_num, pass_num, normal_num, good_num, excellent_num, pass_ratio, excellent_ratio);
            //统计课程目标达成度情况
            List<Integer> notReachList = new ArrayList<>();
            List<Float> achieve = new ArrayList<>();
            for (int i = 0; i < goalDetailDTOS.size(); i++) {
                int not_reach = 0;
                for (Float v : goalDetailDTOS.get(i).getValue()) {
                    if (v < expectationList.get(i)) {
                        not_reach++;
                    }
                }
                notReachList.add(not_reach);
                achieve.add((float) (need_exam - not_reach) / need_exam);
            }
            //CourseGoal课程目标统计信息的插入
            List<Course_Goal> CGUpdateList = new ArrayList<>();
            for (int i = 0; i < CG.size(); i++) {
                Course_Goal temp = new Course_Goal(CG.get(i).getGoal_id(), CG.get(i).getCourse_goal_id(), CG.get(i).getAudit_id(), null, null, null, null, null, null, null, null, null, null, notReachList.get(i), achieve.get(i), null, null);
                CGUpdateList.add(temp);
            }
            courseAuditMapper.update_CG(CGUpdateList);
        }
        // courseTargetDTO,CourseStandardDTO
        StringBuilder excel = new StringBuilder();
        StringBuilder good = new StringBuilder();
        StringBuilder nor = new StringBuilder();
        StringBuilder pass = new StringBuilder();
        StringBuilder poor = new StringBuilder();
        for (Course_Goal i : CG) {
            List<MyItem> temp_myItems = new ArrayList<>();
            List<MyItem> temp_myParts = new ArrayList<>();
            for( MyItem item : itemList){
                if( item.getGoal_id().equals(i.getGoal_id())){
                    if(item.getIndex().equals(-1)){
                        temp_myParts.add(item);
                    } else{
                        temp_myItems.add(item);
                    }
                }
            }
            if(temp_myItems.size() > 0){
                for(String str : fatherOfItem){
                    temp_myParts.add(new MyItem(null, str, null, null, null, null));
                }
            }
            String[] temp_content = new String[temp_myItems.size()];
            String[] temp_parts = new String[temp_myParts.size()];
            for(int x = 0; x < temp_myItems.size(); x++){
                temp_content[x] = temp_myItems.get(x).getName();
            }
            for(int y = 0; y < temp_myParts.size(); y++){
                temp_parts[y] = temp_myParts.get(y).getName();
            }
            String[] CStandards = new String[5];
            CStandards[0] = i.getExcellent();
            CStandards[1] = i.getGood();
            CStandards[2] = i.getNormal();
            CStandards[3] = i.getPass();
            CStandards[4] = i.getPoor();
            CTargetDTO cTarget = new CTargetDTO(i.getCourse_goal_text(), temp_content, i.getGraduate_require(), temp_parts, i.getTotal_score(), CStandards, i.getEva_point(), i.getExpectation(), i.getNot_reach(), i.getAchieve_degree(), i.getScore_description(), i.getScore_analysis());
            ctargets.add(cTarget);
            // 把每个课程目标的对应评分标准拼接
            excel.append(i.getExcellent());
            good.append(i.getGood());
            nor.append(i.getNormal());
            pass.append(i.getPass());
            poor.append(i.getPoor());
        }
        CourseStandardDTO courseStandard = new CourseStandardDTO(excel.toString(), good.toString(), nor.toString(), pass.toString(), poor.toString());

        return new CourseAuditDTO(basicInfo, ctargets, mods, parts, items, fatherOfItem, question_standard, courseStandard, evaForm, goalDetailDTOS);
    }

    public String UpdateEvaDescription(CourseAuditDTO courseAudit){
        AuditInfo auditInfo = courseAuditMapper.get_AuditInfo(courseAudit.getBasicInfo().getSemester(), courseAudit.getBasicInfo().getCourse_number());
        if(auditInfo == null) { return "没有此审核信息，请新建";}
        auditInfo.setEva_person(courseAudit.getBasicInfo().getEva_person());
        List<Course_Goal> updateList = new ArrayList<>();
        List<Course_Goal> oldCGs = courseAuditMapper.get_CGList(auditInfo.getId());
        for( int i = 0; i < courseAudit.getCtargets().size(); i++) {
            CTargetDTO cTargetDTO = courseAudit.getCtargets().get(i);
            Course_Goal oldCG = oldCGs.get(i);
            if(cTargetDTO.getValue().equals(oldCG.getCourse_goal_text())) {
                updateList.add(new Course_Goal(oldCG.getGoal_id(), oldCG.getCourse_goal_id(), oldCG.getAudit_id(), null, null, null, null, null, null, null, null, null, null, null, null, cTargetDTO.getScore_description(), cTargetDTO.getScore_analysis()));
            }
        }
        try {
            courseAuditMapper.update_CG(updateList);
            courseAuditMapper.updateAuditInfo(auditInfo);
        } catch (Exception e) {
            return e.toString();
        }
        return "";
    }

}
