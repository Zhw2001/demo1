package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class Exper extends cinfo{
    public Exper(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.ExperimentData> experimentData) {
        super(myCid, myCName, my_course_type);
        ExperimentData = experimentData;
    }

    public Exper() {}

    private List<ExperimentData> ExperimentData;
}
