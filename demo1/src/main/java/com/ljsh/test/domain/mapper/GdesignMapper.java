package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.Course_Data.GdesignData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GdesignMapper {
    List<GdesignData> get_All_Gd();
    void addGdesign(GdesignData gdesignData);
    void delGdesign(Long id);
    void updateGdesign(GdesignData gdesignData);
}
