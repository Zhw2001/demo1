package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.ExperimentData;
import lombok.Data;

import java.util.List;

@Data
public class Exper extends CInfo {

    public Exper() {}

    private List<ExperimentData> ExperimentData;
}
