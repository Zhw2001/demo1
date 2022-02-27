package com.ljsh.test.service;

import com.ljsh.test.dto.courseAuditDTO;

public interface CourseAuditService {
    String update(courseAuditDTO examAudit);
    courseAuditDTO getInfo(String cid, String classes);
}
