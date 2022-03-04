package com.ljsh.test.service.impl;

import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.domain.mapper.CourseInfoMapper;
import com.ljsh.test.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CourseInfoServiceImpl implements CourseInfoService {
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    public List<CInfo> getAllCourse(){
        return courseInfoMapper.get_All();
    }

}
