package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.GdesignData;
import lombok.Data;

import java.util.List;

@Data
public class GDesign extends CInfo {

    public GDesign() {
    }

    private List<GdesignData> GdesignData;
}
