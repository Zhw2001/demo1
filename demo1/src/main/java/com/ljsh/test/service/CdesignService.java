package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Cdesign;

import java.util.List;

public interface CdesignService {
    List<Cdesign> get_All_Cd();
    String addCdesign(Cdesign cdesign);
    String delCdesign(Long id);
    String updateCdesign(Cdesign cdesign);
}
