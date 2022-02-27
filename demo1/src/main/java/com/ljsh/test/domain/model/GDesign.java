package com.ljsh.test.domain.model;

import lombok.Data;

import java.util.List;

@Data
public class GDesign extends cinfo{
    public GDesign(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.GdesignData> gdesignData) {
        super(myCid, myCName, my_course_type);
        GdesignData = gdesignData;
    }

    public GDesign() {
    }

    private List<GdesignData> GdesignData;
}
