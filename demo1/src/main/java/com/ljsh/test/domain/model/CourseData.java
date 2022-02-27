package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CourseData {
    public CourseData(Long id, String sTime, String cId, Integer cNum, String sId, String sName, String sClass, String sState, Double regular, Double written, Double overall) {
        this.id = id;
        this.sTime = sTime;
        this.cId = cId;
        this.cNum = cNum;
        this.sId = sId;
        this.sName = sName;
        this.sClass = sClass;
        this.sState = sState;
        this.regular = regular;
        this.written = written;
        this.overall = overall;
    }

    public CourseData() {}

    private Long id;
    private String sTime;
    private String cId;
    private Integer cNum;
    private String sId;
    private String sName;
    private String sClass;
    private String sState;
    private Double regular;
    private Double written;
    private Double overall;
}
