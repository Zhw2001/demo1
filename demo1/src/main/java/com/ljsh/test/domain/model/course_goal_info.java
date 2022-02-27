package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class course_goal_info {
    private Integer id;
    private String cid;
    private String G_R;
    private String eva_point;
    private Float total_score;

    public course_goal_info() {}

    public course_goal_info(Integer id, String cid, String g_R, String eva_point, Float total_score) {
        this.id = id;
        this.cid = cid;
        this.G_R = g_R;
        this.eva_point = eva_point;
        this.total_score = total_score;
    }
}
