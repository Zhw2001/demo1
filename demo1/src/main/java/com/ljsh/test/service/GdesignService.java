package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Gdesign;

import java.util.List;

public interface GdesignService {
    List<Gdesign> get_All_Gd();
    Boolean addGdesign(Gdesign gdesign);
    Boolean delGdesign(Long id);
    Boolean updateGdesign(Gdesign gdesign);
}
