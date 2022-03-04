package com.ljsh.test.dto;

import lombok.Data;

import java.util.List;

@Data
public class CourseAuditDTO {
    public CourseAuditDTO(){}

    public CourseAuditDTO(BasicInfoDTO basicInfo, List<CTargetDTO> ctargets, List<ModDTO> mods, List<PartDTO> parts, List<ItemDTO> items, List<String> fatherOfItem, String[] question_standard) {
        this.basicInfo = basicInfo;
        this.ctargets = ctargets;
        this.mods = mods;
        this.parts = parts;
        this.items = items;
        this.fatherOfItem = fatherOfItem;
        this.question_standard = question_standard;
    }

    private BasicInfoDTO basicInfo;
    private List<CTargetDTO> ctargets;
    private List<ModDTO> mods;
    private List<PartDTO> parts;
    private List<ItemDTO> items;
    private List<String> fatherOfItem;
    private String[] question_standard;


}
