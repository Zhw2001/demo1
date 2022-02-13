package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.CourseInfoMapper;
import com.ljsh.test.mbg.model.CourseInfo;
import com.ljsh.test.service.CourseInfoService;
import org.apache.commons.collections.list.AbstractLinkedList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseInfoServiceImpl implements CourseInfoService {
    @Autowired
    private CourseInfoMapper courseInfoMapper;



    public List<CourseInfo> getCInfoByCidDep(String cids,String dep){
        List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
        String[] cidList = cids.split(",");
        if (cidList.length == 1){
           int type = courseInfoMapper.get_Type_By_Cid(cidList[0]);
            switch(type){
                case 0://0-理论课，1-实验课，2-课程设计，3-毕业设计
                    courseInfoList.add(courseInfoMapper.get_Course_By_cid_Dep(cidList[0],dep));
                case 1:
                    courseInfoList.add( courseInfoMapper.get_Exp_By_cid_Dep(cidList[0],dep));
                case 2:
                    courseInfoList.add( courseInfoMapper.get_Cdesign_By_cid_Dep(cidList[0],dep));
                case 3:
                    courseInfoList.add( courseInfoMapper.get_Gdesign_By_cid_Dep(cidList[0],dep));
            }
            return courseInfoList;
        }
        int[] typeList = new int[cidList.length];
        for(int i=0;i<typeList.length;i++){
            typeList[i] = courseInfoMapper.get_Type_By_Cid(cidList[i]);
        }
        for(int i=0;i<cidList.length;i++){
            switch(typeList[i]){
                case 0://0-理论课，1-实验课，2-课程设计，3-毕业设计
                    courseInfoList.add(courseInfoMapper.get_Course_By_cid_Dep(cidList[i],dep));
                case 1:
                    courseInfoList.add( courseInfoMapper.get_Exp_By_cid_Dep(cidList[i],dep));
                case 2:
                    courseInfoList.add( courseInfoMapper.get_Cdesign_By_cid_Dep(cidList[i],dep));
                case 3:
                    courseInfoList.add( courseInfoMapper.get_Gdesign_By_cid_Dep(cidList[i],dep));
            }
        }
        return courseInfoList;
    }


}
