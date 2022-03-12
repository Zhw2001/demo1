package com.ljsh.test.dto;

import lombok.Data;

import java.util.List;

@Data
public class GoalDetailDTO {
    private Long goal_id;
    private List<Float> value;

    public GoalDetailDTO(Long goal_id, List<Float> value) {
        this.goal_id = goal_id;
        this.value = value;
    }
}
