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
        if(gdesignService.updateGdesign(gdesign)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/delete")
    public Result<?> delGdesign(@RequestBody Gdesign gdesign){
        if(gdesignService.delGdesign(gdesign.getId())){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

    @PostMapping("/insert")
    public Result<?> addGdesign(@RequestBody Gdesign gdesign){
        if(gdesignService.addGdesign(gdesign)){
            return Result.success();
        }
        return Result.error("111","sqlError");
    }

}
