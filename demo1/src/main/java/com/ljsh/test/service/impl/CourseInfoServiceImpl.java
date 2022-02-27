package com.ljsh.test.service.impl;

import com.ljsh.test.domain.model.CourseInfo;
import com.ljsh.test.domain.model.cinfo;
import com.ljsh.test.dto.CinfoResDTO;
import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class CourseInfoServiceImpl implements CourseInfoService {
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    public CinfoResDTO getCInfoByCid(List<String> cids){
        List<cinfo> cinfos = courseInfoMapper.GET_BINFO_CID(cids);
        CinfoResDTO cinfoRes = new CinfoResDTO();
        List<String> ccids = new ArrayList<>();
        List<String> ecids = new ArrayList<>();
        List<String> cdcids = new ArrayList<>();
        List<String> gdcids = new ArrayList<>();
        for(cinfo i : cinfos){
            switch(i.getCourse_type()){
                case 0:
                    ccids.add(i.getCId());
                    break;
                case 1:
                    ecids.add(i.getCId());
                    break;
                case 2:
                    cdcids.add(i.getCId());
                    break;
                case 3:
                    gdcids.add(i.getCId());
                    break;
            }
        }
        if(ccids.size() > 0){
            cinfoRes.setCourse_list(courseInfoMapper.get_Course_Cid(ccids));}
        if(ecids.size() > 0){
            cinfoRes.setExper_list( courseInfoMapper.get_Exper_Cid(ecids));}
        if(cdcids.size() > 0){
            cinfoRes.setCdesign_list( courseInfoMapper.get_Cdesign_Cid(cdcids));}
        if(gdcids.size() > 0){
            cinfoRes.setGdesign_list( courseInfoMapper.get_Gdesign_Cid(gdcids));
        }
        return cinfoRes;
    }

    public List<CourseInfo> get_All_cnames_cids(){
        return courseInfoMapper.get_All_cNames_cids();
    }

}
