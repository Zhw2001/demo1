package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Gdesign;

import java.util.List;

public interface GdesignService {
    List<Gdesign> get_All_Gd();
    String addGdesign(Gdesign gdesign);
    String delGdesign(Long id);
    String updateGdesign(Gdesign gdesign);
}
