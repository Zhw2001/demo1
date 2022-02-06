package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Experiment;
import com.ljsh.test.mbg.model.Gdesign;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GdesignMapper {
    List<Gdesign> get_All_Gd();
    void addGdesign(Gdesign gdesign);
    void delGdesign(Long id);
    void updateGdesign(Gdesign gdesign);
}
