package com.ljsh.test.service.impl;

import com.ljsh.test.dto.CinfoDTO;
import com.ljsh.test.mbg.mapper.CourseInfoMapper;
import com.ljsh.test.mbg.model.CourseInfo;
import com.ljsh.test.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseInfoServiceImpl implements CourseInfoService {
    @Autowired
    private CourseInfoMapper courseInfoMapper;



    public List<CourseInfo> getCInfoByCid(CinfoDTO cinfo){
        List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
        if(cinfo.getCcids().length != 0){courseInfoList.addAll(courseInfoMapper.get_Course_Cid(cinfo.getCcids()));}
        if(cinfo.getEcids().length != 0){courseInfoList.addAll( courseInfoMapper.get_Exper_Cid(cinfo.getEcids()));}
        if(cinfo.getCdcids().length != 0){courseInfoList.addAll( courseInfoMapper.get_Cdesign_Cid(cinfo.getCdcids()));}
        if(cinfo.getGdcids().length != 0){courseInfoList.addAll( courseInfoMapper.get_Gdesign_Cid(cinfo.getGdcids()));}
        return courseInfoList;
    }


}
