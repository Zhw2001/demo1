package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class MyItem {
    private Long item_id;
    private String name;
    private String score;
    private Integer index;
    private Long part_id;
    private Long goal_id;
    public MyItem() {
    }

    public MyItem(Long item_id, String name, String score, Integer index, Long part_id, Long goal_id) {
        this.item_id = item_id;
        this.name = name;
        this.score = score;
        this.index = index;
        this.part_id = part_id;
        this.goal_id = goal_id;
    }
}
