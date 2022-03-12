package com.ljsh.test.utils;

import lombok.Data;

@Data
public class ContentMap {
    private Long audit_id;
    private Integer course_goal_id;
    private String[] content;
    private String[] parts;

    public ContentMap() {
    }

    public ContentMap(Long audit_id, Integer course_goal_id, String[] content, String[] parts) {
        this.audit_id = audit_id;
        this.course_goal_id = course_goal_id;
        this.content = content;
        this.parts = parts;
    }
}
