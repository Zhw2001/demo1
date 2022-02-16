package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.Cdesign;

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
        List<Cdesign> cdesignList =cdesignService.get_All_Cd();
        return Result.success(cdesignList);
    }

    @PostMapping("/update")
    public Result<?> updateCdesign(@RequestBody Cdesign cdesign){
        if(cdesign != null){
            String msg = cdesignService.updateCdesign(cdesign);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delCdesign(@RequestBody Cdesign cdesign){
        if(cdesign != null){
            String msg = cdesignService.delCdesign(cdesign.getId());
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addCdesign(@RequestBody Cdesign cdesign){
        if(cdesign != null){
            String msg = cdesignService.addCdesign(cdesign);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
