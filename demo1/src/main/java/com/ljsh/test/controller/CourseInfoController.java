package com.ljsh.test.controller;

import com.ljsh.test.domain.model.CourseInfo;
import com.ljsh.test.dto.CinfoResDTO;
import com.ljsh.test.dto.Result;
import com.ljsh.test.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cinfo")
public class CourseInfoController {
    @Autowired
    private CourseInfoService CourseInfoService;

    @GetMapping("/list_cid")
    public Result<?> getCinfoListByCid(@RequestParam List<String> cids)
    {
        if(cids.size() < 1){return Result.error("204","输入为空");}
        CinfoResDTO cinfoRes = CourseInfoService.getCInfoByCid(cids);
        return Result.success(cinfoRes);
    }

    @GetMapping("/all")
    public Result<?> getAllCNameCid()
    {
        List<CourseInfo> cinfos = CourseInfoService.get_All_cnames_cids();
        return Result.success(cinfos);
    }

}
