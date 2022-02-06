package com.ljsh.test.service;

import com.ljsh.test.mbg.model.CourseInfo;

import java.util.List;

public interface CourseInfoService {
    List<CourseInfo> getCInfoByCidDep(String cid,String dep);
}
