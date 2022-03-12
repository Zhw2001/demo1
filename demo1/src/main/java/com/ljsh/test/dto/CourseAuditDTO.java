package com.ljsh.test.dto;

import com.ljsh.test.domain.model.Goal_Detail;
import lombok.Data;

import java.util.List;

@Data
public class CourseAuditDTO {
    private BasicInfoDTO basicInfo;
    private List<CTargetDTO> ctargets;
    private List<ModDTO> mods;
    private List<PartDTO> parts;
    private List<ItemDTO> items;
    private List<String> fatherOfItem;
    private String[] question_standard;
    private CourseStandardDTO courseStandard;
    private EvaFormDTO evaForm;
    private List<GoalDetailDTO> goal_details;

    public CourseAuditDTO() {
    }

    public CourseAuditDTO(BasicInfoDTO basicInfo, List<CTargetDTO> ctargets, List<ModDTO> mods, List<PartDTO> parts, List<ItemDTO> items, List<String> fatherOfItem, String[] question_standard, CourseStandardDTO courseStandard, EvaFormDTO evaForm, List<GoalDetailDTO> goal_details) {
        this.basicInfo = basicInfo;
        this.ctargets = ctargets;
        this.mods = mods;
        this.parts = parts;
        this.items = items;
        this.fatherOfItem = fatherOfItem;
        this.question_standard = question_standard;
        this.courseStandard = courseStandard;
        this.evaForm = evaForm;
        this.goal_details = goal_details;
    }
}
