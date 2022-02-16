package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.GdesignMapper;
import com.ljsh.test.mbg.model.Gdesign;
import com.ljsh.test.service.GdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GdesignServiceImpl implements GdesignService {
    @Autowired
    private GdesignMapper gdesignMapper;

    public List<Gdesign> get_All_Gd(){
        return gdesignMapper.get_All_Gd();
    }

    public String addGdesign(Gdesign gdesign){
        try {
            gdesignMapper.addGdesign(gdesign);
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

    public String updateGdesign(Gdesign gdesign){
        try {
            gdesignMapper.updateGdesign(gdesign);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
