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

    private final String separator = ":]";

    private void updateCInfo(CourseInfo oldInfo,basicInfoDTO basic_info,Integer course_type,String ctar, String excellent,String good,String normal,String pass,String poor,Integer exam_type){
        if(TestEntity.objCheckHasNull(oldInfo)){
            CourseInfo currCInfo = new CourseInfo(oldInfo.getCId(),basic_info.getCourse_name(),course_type,basic_info.getSemester(),ctar, excellent, good, normal, pass, poor, exam_type);
            courseInfoMapper.replaceCourseInfo(currCInfo);
        } else
        {
            CourseInfo currCInfo = new CourseInfo();
            currCInfo.setCId(oldInfo.getCId());
            currCInfo.setCName(basic_info.getCourse_name());
            if (oldInfo.getCourse_type().equals(course_type)) {
                currCInfo.setCourse_type(null);
            } else {
                currCInfo.setCourse_type(course_type);
            }
            if (oldInfo.getSemester().equals(basic_info.getSemester())) {
                currCInfo.setSemester(null);
            } else {
                currCInfo.setSemester(basic_info.getSemester());
            }
            if (oldInfo.getCTarget().equals(ctar)) {
                currCInfo.setCTarget(null);
            } else {
                currCInfo.setCTarget(ctar);
            }
            if (oldInfo.getA().equals(excellent)) {
                currCInfo.setA(null);
            } else {
                currCInfo.setA(excellent);
            }
            if (oldInfo.getB().equals(good)) {
                currCInfo.setB(null);
            } else {
                currCInfo.setB(good);
            }
            if (oldInfo.getC().equals(normal)) {
                currCInfo.setC(null);
            } else {
                currCInfo.setC(normal);
            }
            if (oldInfo.getD().equals(pass)) {
                currCInfo.setD(null);
            } else {
                currCInfo.setD(pass);
            }
            if (oldInfo.getF().equals(poor)) {
                currCInfo.setF(null);
            } else {
                currCInfo.setF(poor);
            }
            if (oldInfo.getExam_type().equals(exam_type)) {
                currCInfo.setExam_type(null);
            } else {
                currCInfo.setExam_type(exam_type);
            }
            courseInfoMapper.updateCourseInfo(currCInfo);
        }
    }
    private<T> List<T> getRemoveList(List<T> oldlist, List<T> currList ){
        return oldlist.stream().filter(item -> !currList.contains(item)).collect(toList()); //在A不在B
    }
    private<T> List<T> getAddList(List<T> oldlist, List<T> currList ){
        return currList.stream().filter(item -> !oldlist.contains(item)).collect(toList()); //在B不在A
    }
    private String[] StrToArray(String str,String Separator){
        return str.split(Separator);
    }
    private String StrArrayToString(String[] arr, String Separator){
        StringBuilder res = new StringBuilder();
        for(String i:arr){
            res.append(i);
            res.append(Separator);
        }
        return res.toString();
    }
    private String generateConcatStr(String value, String Separator){return value + Separator;}
    private List<String[]> generateCStandard(String A,String B,String C,String D, String F){
        String[] As = A.split(":]");
        String[] Bs = B.split(":]");
        String[] Cs = C.split(":]");
        String[] Ds = D.split(":]");
        String[] Fs = F.split(":]");
        List<String[]> results = new ArrayList<>();
        for(int i =0; i< As.length; i++){
            String[] temp = new String[5];
            temp[0] = As[i];
            temp[1] = Bs[i];
            temp[2] = Cs[i];
            temp[3] = Ds[i];
            temp[4] = Fs[i];
            results.add(temp);
        }
        return results;
    }
    private course_goal_info generateCGInfo(Integer id,cTargetDTO ctarget,List<String> fatherOfItem, String cid){
        StringBuilder builder = new StringBuilder();
        String content = StrArrayToString(ctarget.getContent(),",");
        content = (content.length() < 1 ? "" : content.substring(0,content.length()-1));
        for(String part : ctarget.getParts()){
            if(fatherOfItem.contains(part)){
                builder.append(part);
                builder.append("：");
                builder.append("[");
                builder.append(content);
                builder.append("]");
                builder.append(",");
            }else{
                builder.append(part);
                builder.append(",");
            }
        }
        String build = builder.toString();
        return new course_goal_info(id, cid,ctarget.getSupport_graduation_require(),build.substring(0,build.length()-1),ctarget.getTotal());
    }
    private String getExamType(int type){
        String res = "";
        switch (type){
            case 0:
                res = "考试";
                break;
            case 1:
                res = "考查";
                break;
        }
        return res;
    }
    private int SetExamType(String type){
        int res = -1;
        switch (type){
            case "考试":
                res = 0;
                break;
            case "考查":
                res = 1;
                break;
        }
        return res;
    }
    private int SetCourseType(String cname){
        int e_i = cname.indexOf("实验");
        int c_i = cname.indexOf("课程设计");
        int g_i = cname.indexOf("毕业设计");
        if(e_i != -1) {
            return 1;
        }else if(c_i != -1){
            return 2;
        }else if(g_i != -1){
            return 3;
        }
        return 0;
    }

    public String update(courseAuditDTO cAudit){
        try {
            List<CourseAudit> courseAudits = new ArrayList<>();
            List<MyPart> myParts = new ArrayList<>();
            List<MyItem> myItems = new ArrayList<>();
            List<course_goal_info> course_goal_infos = new ArrayList<>();
            basicInfoDTO basic_info = cAudit.getBasicInfo();
            List<cTargetDTO> cTargets = cAudit.getCtargets();
            List<modDTO> mods = cAudit.getMods();
            List<String> fatherOfItem = cAudit.getFatherOfItem();
            List<itemDTO> items = cAudit.getItems();
            if(basic_info == null || cTargets.isEmpty() || mods.isEmpty() || fatherOfItem.isEmpty()|| items.isEmpty()){return "输入不完整";}
            String cid = basic_info.getCourse_number();//获取课程编号
            StringBuilder cTar = new StringBuilder();
            StringBuilder excellent = new StringBuilder();
            StringBuilder good = new StringBuilder();
            StringBuilder normal = new StringBuilder();
            StringBuilder pass = new StringBuilder();
            StringBuilder poor = new StringBuilder();
            int count = 0;
            for (cTargetDTO l : cTargets) {//有序遍历课程目标
                cTar.append(generateConcatStr(l.getValue(), separator));
                excellent.append(generateConcatStr(l.getStandards()[0], separator));
                good.append(generateConcatStr(l.getStandards()[1], separator));
                normal.append(generateConcatStr(l.getStandards()[2], separator));
                pass.append(generateConcatStr(l.getStandards()[3], separator));
                poor.append(generateConcatStr(l.getStandards()[4], separator));
                course_goal_infos.add(generateCGInfo(count++, l, cAudit.getFatherOfItem(), cid)); //遍历课程目标的时候顺便获取course_goal_info所需数据
            }
            int exam_type = SetExamType(cAudit.getBasicInfo().getExam_type()); //获取考试类型
            int course_type = SetCourseType(cAudit.getBasicInfo().getCourse_name()); //根据课程名设置课程种类
            for (modDTO i : mods) { //获取模块中包含的parts
                for (int j = 0; j < i.getPartNames().length; j++) {
                    myParts.add(new MyPart(i.getPartNames()[j], i.getPartRatios()[j], cid, i.getName()));
                }
                courseAudits.add(new CourseAudit(cid, i.getName()));//根据模块更新模块表
            }
            for (String x : fatherOfItem) { //根据item-part对应关系获取items
                for (itemDTO y : items) {
                    myItems.add(new MyItem(y.getName(), y.getScore(), cid, x));
                }
            }
            CourseInfo oldInfo = courseInfoMapper.GET_CINFO_CID(cid);    //如果没有该课程信息则新建
            if(oldInfo == null){
                courseInfoMapper.replaceCourseInfo(new CourseInfo(cid, basic_info.getCourse_name(), course_type, basic_info.getSemester(), cTar.toString(), excellent.toString(), good.toString(), normal.toString(), pass.toString(), poor.toString(), exam_type));//插入新课程信息
                for (CourseAudit t :courseAudits) {
                    courseAuditMapper.replaceMod(t);
                }
                for (MyPart part : myParts) {
                    courseAuditMapper.replacePart(part);
                }
                for (MyItem item : myItems) {
                    courseAuditMapper.replaceItem(item);
                }
                for (course_goal_info cg : course_goal_infos) {
                    courseAuditMapper.replace_CGInfo(cg);
                }
            }else {
                updateCInfo(oldInfo,basic_info,course_type,cTar.toString(),excellent.toString(), good.toString(), normal.toString(), pass.toString(), poor.toString(), exam_type);
                List<CourseAudit> oldCAList = courseAuditMapper.get_CA_By_CID(cid);
                List<MyPart> oldPList = courseAuditMapper.get_Part_By_CID(cid);
                List<MyItem> oldIList = courseAuditMapper.get_Item_By_CID(cid);
                List<course_goal_info> oldCG = courseAuditMapper.get_CG_By_Cid(cid);
                for (CourseAudit t : getAddList(oldCAList, courseAudits)) {
                    courseAuditMapper.replaceMod(t);
                }
                for (CourseAudit t : getRemoveList(oldCAList, courseAudits)) {
                    courseAuditMapper.delMod(t);
                }
                for (MyPart part : getAddList(oldPList, myParts)) {
                    courseAuditMapper.replacePart(part);
                }
                for (MyPart part : getRemoveList(oldPList, myParts)) {
                    courseAuditMapper.delPart(part);
                }
                for (MyItem item : getAddList(oldIList, myItems)) {
                    courseAuditMapper.replaceItem(item);
                }
                for (MyItem item : getRemoveList(oldIList, myItems)) {
                    courseAuditMapper.delItem(item);
                }
                for (course_goal_info cg : getAddList(oldCG, course_goal_infos)) {
                    courseAuditMapper.replace_CGInfo(cg);
                }
                for (course_goal_info cg : getRemoveList(oldCG, course_goal_infos)) {
                    courseAuditMapper.del_CGInfo(cg);
                }
            }
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public courseAuditDTO getInfo(String cid, String classes){
        String[] empty = new String[0];
        CourseInfo courseInfo = courseInfoMapper.GET_CINFO_CID(cid);
        List<QStandard> QStandardList = courseAuditMapper.get_S_By_CourseType(courseInfo.getCourse_type());
        String[] question_standard = new String[QStandardList.size()];
        for(int x = 0; x< QStandardList.size(); x++){
            question_standard[x] = QStandardList.get(x).getStandard();
        }
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");
        basicInfoDTO basicInfo = new basicInfoDTO(courseInfo.getSemester(),ft.format(dNow),courseInfo.getCName(),courseInfo.getCId(),classes,getExamType(courseInfo.getExam_type()));
        if(courseInfo.getCTarget() == null){return new courseAuditDTO(basicInfo,null,null,null,null,null,question_standard);} //如果数据库中课程信息不全，只返回课程基本信息和流程规范评价标准（需要课程类型）

        List<CourseAudit> courseAuditList = courseAuditMapper.get_CA_By_CID(cid);
        List<MyPart> partList = courseAuditMapper.get_Part_By_CID(cid);
        List<MyItem> itemList = courseAuditMapper.get_Item_By_CID(cid);
        List<course_goal_info> GR = courseAuditMapper.get_CG_By_Cid(cid);
        List<cTargetDTO> ctargets = new ArrayList<>();
        List<modDTO> mods = new ArrayList<>();
        List<partDTO> parts = new ArrayList<>();
        List<itemDTO> items = new ArrayList<>();
        List<String> fatherOfItem = new ArrayList<>();
        List<String[]> CStandards = generateCStandard(courseInfo.getA(),courseInfo.getB(),courseInfo.getC(),courseInfo.getD(),courseInfo.getF());
        String[] ctargetValue = StrToArray(courseInfo.getCTarget(),separator);
        for(int j = 0; j<ctargetValue.length; j++){
            cTargetDTO cTarget = new cTargetDTO(ctargetValue[j],empty,GR.get(j).getG_R(),empty,0f,CStandards.get(j));
            ctargets.add(cTarget);
        }
        for(CourseAudit i:courseAuditList){
            modDTO mod = new modDTO(
                    i.getModule_name(),
                    empty,
                    empty,
                    empty,
                    0f
                    );
            mods.add(mod);//在最后面进行插入，不需要进行位移
        }
        for(MyPart j:partList){
            partDTO part = new partDTO(
                    j.getPart(),
                    j.getRatio(),
                    true
            );
            parts.add(part);
        }
        for(int k=0; k<itemList.size();k++){
            String father = itemList.get(k).getPart();
            if(k == 0){
                fatherOfItem.add(father);
            }else if(!fatherOfItem.contains(father)){
                fatherOfItem.add(father);
            }
            itemDTO item = new itemDTO(itemList.get(k).getItem_name(),itemList.get(k).getItem_value(),true);
            items.add(item);
        }
        return new courseAuditDTO(basicInfo,ctargets,mods,parts,items,fatherOfItem,question_standard);
    }

}
