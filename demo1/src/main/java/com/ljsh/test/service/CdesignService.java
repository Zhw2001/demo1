package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Cdesign;

import java.util.List;

public interface CdesignService {
    List<Cdesign> get_All_Cd();
    Boolean addCdesign(Cdesign cdesign);
    Boolean delCdesign(Long id);
    Boolean updateCdesign(Cdesign cdesign);
}
