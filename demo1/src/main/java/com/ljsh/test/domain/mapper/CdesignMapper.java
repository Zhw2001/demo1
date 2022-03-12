package com.ljsh.test.domain.mapper;

import com.ljsh.test.domain.model.Course_Data.CdesignData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CdesignMapper {
    List<CdesignData> get_All_Cd();
    void addCdesign(CdesignData cdesignData);
    void delCdesign(Long id);
    void updateCdesign(CdesignData cdesignData);
}
