package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.ExperimentMapper;
import com.ljsh.test.mbg.model.Experiment;

import com.ljsh.test.service.ExperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExperServiceImpl implements ExperService {
    @Autowired
    private ExperimentMapper experimentMapper;

    public List<Experiment> get_All_E(){
        return experimentMapper.get_All_E();
    }

    public String addExperiment(Experiment experiment){
        try {
            experimentMapper.addExperiment(experiment);
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

    public String updateExperiment(Experiment experiment){
        try {
            experimentMapper.updateExperiment(experiment);
        }catch(Exception e){
            return e.toString();
        }
        return "";
    }

}
