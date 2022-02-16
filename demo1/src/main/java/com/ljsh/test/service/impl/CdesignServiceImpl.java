package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.CdesignMapper;
import com.ljsh.test.mbg.model.Cdesign;
import com.ljsh.test.service.CdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CdesignServiceImpl implements CdesignService {
    @Autowired
    private CdesignMapper cdesignMapper;

    public List<Cdesign> get_All_Cd(){
        return cdesignMapper.get_All_Cd();
    }

    public String addCdesign(Cdesign cdesign){
        try {
            cdesignMapper.addCdesign(cdesign);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String delCdesign(Long id){
        try {
            cdesignMapper.delCdesign(id);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String updateCdesign(Cdesign cdesign){
        try {
            cdesignMapper.updateCdesign(cdesign);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
