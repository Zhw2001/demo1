package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.CourseDataMapper;
import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.dto.CourseDataDTO;
import com.ljsh.test.service.CourseDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseDataServiceImpl implements CourseDataService {
    @Autowired
    private CourseDataMapper courseDataMapper;
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    public CourseDataDTO getCDataByCid(List<String> cids){
        List<CInfo> cinfos = courseInfoMapper.get_CInfoList(cids);
        CourseDataDTO cinfoRes = new CourseDataDTO();
        List<String> ccids = new ArrayList<>();
        List<String> ecids = new ArrayList<>();
        List<String> cdcids = new ArrayList<>();
        List<String> gdcids = new ArrayList<>();
        for(CInfo i : cinfos){
            switch(i.getCourse_type()){
                case 0:
                    ccids.add(i.getCid());
                    break;
                case 1:
                    ecids.add(i.getCid());
                    break;
                case 2:
                    cdcids.add(i.getCid());
                    break;
                case 3:
                    gdcids.add(i.getCid());
                    break;
            }
        }
        if(ccids.size() > 0){
            cinfoRes.setCourse_list(courseDataMapper.get_CourseDataList(ccids));}
        if(ecids.size() > 0){
            cinfoRes.setExper_list( courseDataMapper.get_ExperDataList(ecids));}
        if(cdcids.size() > 0){
            cinfoRes.setCdesign_list( courseDataMapper.get_CdesignDataList(cdcids));}
        if(gdcids.size() > 0){
            cinfoRes.setGdesign_list( courseDataMapper.get_GdesignDataList(gdcids));
        }
        return cinfoRes;
    }
}
