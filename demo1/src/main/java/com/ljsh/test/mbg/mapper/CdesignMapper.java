package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Cdesign;
import com.ljsh.test.mbg.model.Gdesign;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CdesignMapper {
    List<Cdesign> get_All_Cd();
    void addCdesign(Cdesign cdesign);
    void delCdesign(Long id);
    void updateCdesign(Cdesign cdesign);
}
