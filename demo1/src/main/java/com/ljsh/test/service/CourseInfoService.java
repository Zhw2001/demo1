package com.ljsh.test.service;

import com.ljsh.test.domain.model.CourseInfo;
import com.ljsh.test.dto.CinfoResDTO;

import java.util.List;

public interface CourseInfoService {
    CinfoResDTO getCInfoByCid(List<String> cids);
    List<CourseInfo> get_All_cnames_cids();
}
