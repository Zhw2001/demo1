package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class GdesignData {
    public GdesignData() {}

    public GdesignData(Long id, String sTime, String cId, Integer cNum, String sId, String sName, Double a_1, Double a_2, Double a_3, Double a_4, Double a_5, Double a_6, Double b_1, Double b_2, Double b_3, Double b_4, Double c_1, Double c_2, Double c_3, Double overall) {
        this.id = id;
        this.sTime = sTime;
        this.cId = cId;
        this.cNum = cNum;
        this.sId = sId;
        this.sName = sName;
        this.a_1 = a_1;
        this.a_2 = a_2;
        this.a_3 = a_3;
        this.a_4 = a_4;
        this.a_5 = a_5;
        this.a_6 = a_6;
        this.b_1 = b_1;
        this.b_2 = b_2;
        this.b_3 = b_3;
        this.b_4 = b_4;
        this.c_1 = c_1;
        this.c_2 = c_2;
        this.c_3 = c_3;
        this.overall = overall;
    }
    private Long id;
    private String sTime;
    private String cId;
    private Integer cNum;
    private String sId;
    private String sName;
    private Double a_1;
    private Double a_2;
    private Double a_3;
    private Double a_4;
    private Double a_5;
    private Double a_6;
    private Double b_1;
    private Double b_2;
    private Double b_3;
    private Double b_4;
    private Double c_1;
    private Double c_2;
    private Double c_3;
    private Double overall;
}
