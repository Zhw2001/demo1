package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.CdesignMapper;
import com.ljsh.test.domain.model.CdesignData;
import com.ljsh.test.service.CdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CdesignServiceImpl implements CdesignService {
    @Autowired
    private CdesignMapper cdesignMapper;

    public List<CdesignData> get_All_Cd(){
        return cdesignMapper.get_All_Cd();
    }

    public String addCdesign(CdesignData cdesignData){
        try {
            cdesignMapper.addCdesign(cdesignData);
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

    public String updateCdesign(CdesignData cdesignData){
        try {
            cdesignMapper.updateCdesign(cdesignData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
