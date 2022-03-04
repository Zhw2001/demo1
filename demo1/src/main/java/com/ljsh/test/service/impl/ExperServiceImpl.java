package com.ljsh.test.service.impl;

import com.ljsh.test.domain.mapper.ExperimentMapper;
import com.ljsh.test.domain.model.Course_Data.ExperimentData;

import com.ljsh.test.service.ExperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExperServiceImpl implements ExperService {
    @Autowired
    private ExperimentMapper experimentMapper;

    public List<ExperimentData> get_All_E(){
        return experimentMapper.get_All_E();
    }

    public String addExperiment(ExperimentData experimentData){
        try {
            experimentMapper.addExperiment(experimentData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String delExperiment(Long id){
        try {
            experimentMapper.delExperiment(id);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

    public String updateExperiment(ExperimentData experimentData){
        try {
            experimentMapper.updateExperiment(experimentData);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
