package com.ljsh.test.service;

import com.ljsh.test.domain.model.CdesignData;

import java.util.List;

public interface CdesignService {
    List<CdesignData> get_All_Cd();
    String addCdesign(CdesignData cdesignData);
    String delCdesign(Long id);
    String updateCdesign(CdesignData cdesignData);
}
