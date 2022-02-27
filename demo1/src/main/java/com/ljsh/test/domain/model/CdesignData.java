package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class CdesignData {
    public CdesignData(){}
    public CdesignData(Long id, String sTime, String cId, Integer cNum, String sId, String sName, String sClass, String sState, Double select, Double begin, Double medium, Double program, Double answer, Double report, Double overall) {
        this.id = id;
        this.sTime = sTime;
        this.cId = cId;
        this.cNum = cNum;
        this.sId = sId;
        this.sName = sName;
        this.sClass = sClass;
        this.sState = sState;
        this.select = select;
        this.begin = begin;
        this.medium = medium;
        this.program = program;
        this.answer = answer;
        this.report = report;
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
    private Double select;
    private Double begin;
    private Double medium;
    private Double program;
    private Double answer;
    private Double report;
    private Double overall;

}
