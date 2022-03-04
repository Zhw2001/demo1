package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class CourseAudit extends CInfo {
    public CourseAudit() {}

    public CourseAudit(String myCid, String myCName, Integer my_course_type, List<AuditInfo> auditInfoList) {
        super(myCid, myCName, my_course_type);
        this.auditInfoList = auditInfoList;
    }

    private List<AuditInfo> auditInfoList;

}
