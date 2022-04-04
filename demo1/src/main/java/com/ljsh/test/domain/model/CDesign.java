package com.ljsh.test.domain.model;

import com.ljsh.test.domain.model.Course_Data.CdesignData;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class CDesign extends CInfo {
    public CDesign(){}


    private List<CdesignData> cdesignData;

}
