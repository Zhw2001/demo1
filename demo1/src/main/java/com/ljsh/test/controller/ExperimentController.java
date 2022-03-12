package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;

import com.ljsh.test.domain.model.Course_Data.ExperimentData;

import com.ljsh.test.service.ExperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/exper")
public class ExperimentController {
    @Autowired
    private ExperService experService;


    @GetMapping("/list")
    public Result<?> getExperList()
    {
        List<ExperimentData> experimentDataList =experService.get_All_E();
        return Result.success(experimentDataList);
    }

    @PostMapping("/update")
    public Result<?> updateExperiment(@RequestBody ExperimentData experimentData){
        if(experimentData.getId()!=null && !experimentData.getId().equals("")){
            String msg = experService.updateExperiment(experimentData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delExperiment(@RequestBody ExperimentData experimentData){
        if(experimentData.getId()!=null && !experimentData.getId().equals("")){
            String msg = experService.delExperiment(experimentData.getId());
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addExperiment(@RequestBody ExperimentData experimentData){
        if(experimentData.getId()!=null && !experimentData.getId().equals("")){
            String msg = experService.addExperiment(experimentData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
