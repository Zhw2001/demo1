package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class QStandard {
    public QStandard(Integer course_type, String standard) {
        this.course_type = course_type;
        this.standard = standard;
    }

    public QStandard() {
    }

    Integer course_type;
    String standard;
}
