package com.ljsh.test.dto;

import lombok.Data;

import java.util.List;

@Data
public class courseAuditDTO {
    public courseAuditDTO(){}

    public courseAuditDTO(basicInfoDTO basicInfo, List<cTargetDTO> ctargets, List<modDTO> mods, List<partDTO> parts, List<itemDTO> items, List<String> fatherOfItem, String[] question_standard) {
        this.basicInfo = basicInfo;
        this.ctargets = ctargets;
        this.mods = mods;
        this.parts = parts;
        this.items = items;
        this.fatherOfItem = fatherOfItem;
        this.question_standard = question_standard;
    }

    private basicInfoDTO basicInfo;
    private List<cTargetDTO> ctargets;
    private List<modDTO> mods;
    private List<partDTO> parts;
    private List<itemDTO> items;
    private List<String> fatherOfItem;
    private String[] question_standard;


}
