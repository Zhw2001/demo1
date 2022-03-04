package com.ljsh.test.domain.mapper;


import com.ljsh.test.domain.model.Course_Data.ExperimentData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExperimentMapper {
    List<ExperimentData> get_All_E();
    void addExperiment(ExperimentData experimentData);
    void delExperiment(Long id);
    void updateExperiment(ExperimentData experimentData);
}
