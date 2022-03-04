package com.ljsh.test.service;

import com.ljsh.test.domain.model.Course_Data.ExperimentData;

import java.util.List;

public interface ExperService {
    List<ExperimentData> get_All_E();
    String addExperiment(ExperimentData experimentData);
    String delExperiment(Long id);
    String updateExperiment(ExperimentData experimentData);
}
