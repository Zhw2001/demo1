package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class MyMod {
    private Long module_id;
    private String name;
    private Long audit_id;
    private Integer index;
    public MyMod() {}

    public MyMod(Long module_id, String name, Long audit_id, Integer index) {
        this.module_id = module_id;
        this.name = name;
        this.audit_id = audit_id;
        this.index = index;
    }
}
