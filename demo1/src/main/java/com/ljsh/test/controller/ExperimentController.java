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
        if(experService.updateExperiment(experiment)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/delete")
    public Result<?> delExperiment(@RequestBody Experiment experiment){
        if(experService.delExperiment(experiment.getId())){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/insert")
    public Result<?> addExperiment(@RequestBody Experiment experiment){
        if(experService.addExperiment(experiment)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

}
