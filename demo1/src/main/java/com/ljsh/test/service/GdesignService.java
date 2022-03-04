package com.ljsh.test.service;

import com.ljsh.test.domain.model.Course_Data.GdesignData;

import java.util.List;

public interface GdesignService {
    List<GdesignData> get_All_Gd();
    String addGdesign(GdesignData gdesignData);
    String delGdesign(Long id);
    String updateGdesign(GdesignData gdesignData);
}
