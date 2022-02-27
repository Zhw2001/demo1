package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class ExperimentData {

    public ExperimentData() {}

    public ExperimentData(Long id, String sTime, String cId, Integer cNum, String sId, String sName, String sClass, String sState, Double p1, Double r1, Double p2, Double r2, Double p3, Double r3, Double p4, Double r4, Double p5, Double r5, Double p6, Double r6, Double p7, Double r7, Double p8, Double r8, Double regular, Double written, Double overall) {
        this.id = id;
        this.sTime = sTime;
        this.cId = cId;
        this.cNum = cNum;
        this.sId = sId;
        this.sName = sName;
        this.sClass = sClass;
        this.sState = sState;
        this.p1 = p1;
        this.r1 = r1;
        this.p2 = p2;
        this.r2 = r2;
        this.p3 = p3;
        this.r3 = r3;
        this.p4 = p4;
        this.r4 = r4;
        this.p5 = p5;
        this.r5 = r5;
        this.p6 = p6;
        this.r6 = r6;
        this.p7 = p7;
        this.r7 = r7;
        this.p8 = p8;
        this.r8 = r8;
        this.regular = regular;
        this.written = written;
        this.overall = overall;
    }
    private Long id;
    private String sTime;
    private String cId;
    private Integer cNum;
    private String sId;
    private String sName;
    private String sClass;
    private String sState;
    private Double p1;
    private Double r1;
    private Double p2;
    private Double r2;
    private Double p3;
    private Double r3;
    private Double p4;
    private Double r4;
    private Double p5;
    private Double r5;
    private Double p6;
    private Double r6;
    private Double p7;
    private Double r7;
    private Double p8;
    private Double r8;
    private Double regular;
    private Double written;
    private Double overall;
}
