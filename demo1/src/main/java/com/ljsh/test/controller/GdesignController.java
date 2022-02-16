package com.ljsh.test.controller;

import com.ljsh.test.dto.Result;
import com.ljsh.test.mbg.model.Gdesign;
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
        List<Gdesign> gdesignList =gdesignService.get_All_Gd();
        return Result.success(gdesignList);
    }

    @PostMapping("/update")
    public Result<?> updateGdesign(@RequestBody Gdesign gdesign){
        if(gdesign != null){
            String msg = gdesignService.updateGdesign(gdesign);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/delete")
    public Result<?> delGdesign(@RequestBody Gdesign gdesign){
        if(gdesign != null){
            String msg = gdesignService.delGdesign(gdesign.getId());
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

    @PostMapping("/insert")
    public Result<?> addGdesign(@RequestBody Gdesign gdesign){
        if(gdesign != null){
            String msg = gdesignService.addGdesign(gdesign);
            if(msg == ""){return Result.success();}
            else{
                return Result.error("500",msg);
            }
        }
        return Result.error("204","输入为空");
    }

}
