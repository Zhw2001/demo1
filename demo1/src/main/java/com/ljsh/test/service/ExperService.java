package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Experiment;

import java.util.List;

public interface ExperService {
    List<Experiment> get_All_E();
    String addExperiment(Experiment experiment);
    String delExperiment(Long id);
    String updateExperiment(Experiment experiment);
}
