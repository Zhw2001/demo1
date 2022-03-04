package com.ljsh.test.service;

import com.ljsh.test.domain.model.CInfo;
import com.ljsh.test.dto.CourseAuditDTO;

import java.util.List;

public interface CourseAuditService {
    String update(CourseAuditDTO examAudit);
    CourseAuditDTO getInfo(String semester, String cid);
    List<String> getSemester(String cid);
}
