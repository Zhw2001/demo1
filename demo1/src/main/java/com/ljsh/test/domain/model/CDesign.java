package com.ljsh.test.domain.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class CDesign extends cinfo{
    public CDesign(){}

    public CDesign(String myCid, String myCName, int my_course_type, List<com.ljsh.test.domain.model.CdesignData> cdesignData) {
        super(myCid, myCName, my_course_type);
        this.cdesignData = cdesignData;
    }

    private List<CdesignData> cdesignData;

}
