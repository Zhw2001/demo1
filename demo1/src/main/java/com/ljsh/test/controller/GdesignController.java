package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.domain.model.GdesignData;
import com.ljsh.test.service.GdesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/gdesign")
public class GdesignController {
    @Autowired
    private GdesignService gdesignService;


    @GetMapping("/list")
    public Result<?> getExperList()
    {
        List<GdesignData> gdesignDataList =gdesignService.get_All_Gd();
        return Result.success(gdesignDataList);
    }

    @PostMapping("/update")
    public Result<?> updateGdesign(@RequestBody GdesignData gdesignData){
        if(gdesignData.getId()!=null){
            String msg = gdesignService.updateGdesign(gdesignData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delGdesign(@RequestBody GdesignData gdesignData){
        if(gdesignData.getId()!=null){
            String msg = gdesignService.delGdesign(gdesignData.getId());
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addGdesign(@RequestBody GdesignData gdesignData){
        if(gdesignData.getCId()!=null){
            String msg = gdesignService.addGdesign(gdesignData);
            if(msg.equals("")){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
