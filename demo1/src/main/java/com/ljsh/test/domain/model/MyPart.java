package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class MyPart {
    public MyPart(String part, String ratio, String cid, String module_name) {
        this.part = part;
        this.ratio = ratio;
        this.cid = cid;
        this.module_name = module_name;
    }

    public MyPart() {
    }

    private String part;
    private String ratio;
    private String cid;
    private String module_name;
}
