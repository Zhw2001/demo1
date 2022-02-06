package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Experiment;

import java.util.List;

public interface ExperService {
    List<Experiment> get_All_E();
    Boolean addExperiment(Experiment experiment);
    Boolean delExperiment(Long id);
    Boolean updateExperiment(Experiment experiment);
}
