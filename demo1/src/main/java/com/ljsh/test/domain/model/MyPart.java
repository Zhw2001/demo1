package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class MyPart {
    private Long part_id;
    private String name;
    private String ratio;
    private Integer index;
    private Long module_id;

    public MyPart() {
    }

    public MyPart(Long part_id, String name, String ratio, Integer index, Long module_id) {
        this.part_id = part_id;
        this.name = name;
        this.ratio = ratio;
        this.index = index;
        this.module_id = module_id;
    }
}
