package com.ljsh.test.mbg.model;

import lombok.Data;

@Data
public class Course {
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
