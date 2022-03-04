package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.ExperimentData;
import lombok.Data;

import java.util.List;

@Data
public class Exper extends CInfo {
    public Exper(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.Course_Data.ExperimentData> experimentData) {
        super(myCid, myCName, my_course_type);
        ExperimentData = experimentData;
    }

    public Exper() {}

    private List<ExperimentData> ExperimentData;
}
