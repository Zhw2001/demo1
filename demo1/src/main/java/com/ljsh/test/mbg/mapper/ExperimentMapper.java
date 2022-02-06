package com.ljsh.test.mbg.mapper;


import com.ljsh.test.mbg.model.Experiment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExperimentMapper {
    List<Experiment> get_All_E();
    void addExperiment(Experiment experiment);
    void delExperiment(Long id);
    void updateExperiment(Experiment experiment);
}
