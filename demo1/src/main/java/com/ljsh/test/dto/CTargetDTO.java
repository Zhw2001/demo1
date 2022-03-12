package com.ljsh.test.dto;

import lombok.Data;

@Data
public class CTargetDTO {
    private String value;
    private String[] content;
    private String support_graduation_require;
    private String[] parts;
    private Float total;
    private String[] standards;
    private String eva_point;
    private Float expectation;
    private Integer not_reach;
    private Float achieve_degree;
    private String score_description;
    private String score_analysis;

    public CTargetDTO() {}

    public CTargetDTO(String value, String[] content, String support_graduation_require, String[] parts, Float total, String[] standards, String eva_point, Float expectation, Integer not_reach, Float achieve_degree, String score_description, String score_analysis) {
        this.value = value;
        this.content = content;
        this.support_graduation_require = support_graduation_require;
        this.parts = parts;
        this.total = total;
        this.standards = standards;
        this.eva_point = eva_point;
        this.expectation = expectation;
        this.not_reach = not_reach;
        this.achieve_degree = achieve_degree;
        this.score_description = score_description;
        this.score_analysis = score_analysis;
    }
}
