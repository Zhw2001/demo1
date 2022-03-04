package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.domain.model.Course_Data.CdesignData;

import com.ljsh.test.service.CdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cdesign")
public class CdesignController {
    @Autowired
    private CdesignService cdesignService;


    @GetMapping("/list")
    public Result<?> getCdesignList()
    {
        List<CdesignData> cdesignDataList =cdesignService.get_All_Cd();
        return Result.success(cdesignDataList);
    }

    @PostMapping("/update")
    public Result<?> updateCdesign(@RequestBody CdesignData cdesignData){
        if(cdesignData.getId() != null && !cdesignData.getId().equals("")){
            String msg = cdesignService.updateCdesign(cdesignData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delCdesign(@RequestBody CdesignData cdesignData){
        if(cdesignData.getId() != null && !cdesignData.getId().equals("")){
            String msg = cdesignService.delCdesign(cdesignData.getId());
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addCdesign(@RequestBody CdesignData cdesignData){
        if(cdesignData.getId() != null && !cdesignData.getId().equals("")){
            String msg = cdesignService.addCdesign(cdesignData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
