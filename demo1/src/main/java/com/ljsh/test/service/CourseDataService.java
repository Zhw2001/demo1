package com.ljsh.test.service;

import com.ljsh.test.dto.CourseDataDTO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CourseDataService {
    CourseDataDTO getCDataByCid(List<String> cids);
}
