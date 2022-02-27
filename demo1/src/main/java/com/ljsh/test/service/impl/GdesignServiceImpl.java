package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.GdesignMapper;
import com.ljsh.test.domain.model.GdesignData;
import com.ljsh.test.service.GdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GdesignServiceImpl implements GdesignService {
    @Autowired
    private GdesignMapper gdesignMapper;

    public List<GdesignData> get_All_Gd(){
        return gdesignMapper.get_All_Gd();
    }

    public String addGdesign(GdesignData gdesignData){
        try {
            gdesignMapper.addGdesign(gdesignData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String delGdesign(Long id){
        try {
            gdesignMapper.delGdesign(id);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String updateGdesign(GdesignData gdesignData){
        try {
            gdesignMapper.updateGdesign(gdesignData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
