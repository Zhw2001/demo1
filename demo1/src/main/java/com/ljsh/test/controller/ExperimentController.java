package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;

import com.ljsh.test.mbg.model.Experiment;

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
        List<Experiment> experimentList =experService.get_All_E();
        return Result.success(experimentList);
    }

    @PostMapping("/update")
    public Result<?> updateExperiment(@RequestBody Experiment experiment){
        if(experiment != null){
            String msg = experService.updateExperiment(experiment);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delExperiment(@RequestBody Experiment experiment){
        if(experiment != null){
            String msg = experService.delExperiment(experiment.getId());
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addExperiment(@RequestBody Experiment experiment){
        if(experiment != null){
            String msg = experService.addExperiment(experiment);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
