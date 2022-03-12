package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.GdesignData;
import lombok.Data;

import java.util.List;

@Data
public class GDesign extends CInfo {
    public GDesign(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.Course_Data.GdesignData> gdesignData) {
        super(myCid, myCName, my_course_type);
        GdesignData = gdesignData;
    }

    public GDesign() {
    }

    private List<GdesignData> GdesignData;
}
