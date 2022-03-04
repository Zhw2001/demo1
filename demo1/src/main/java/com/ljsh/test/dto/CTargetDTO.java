package com.ljsh.test.dto;

import lombok.Data;

@Data
public class CTargetDTO {
    private String value;
    private String[] content;
    private String support_graduation_require;
    private String[] parts;
    private Float total;
    private String[] standards;

    public CTargetDTO() {}
    public CTargetDTO(String value, String[] content, String support_graduation_require, String[] parts, Float total, String[] standards) {
        this.value = value;
        this.content = content;
        this.support_graduation_require = support_graduation_require;
        this.parts = parts;
        this.total = total;
        this.standards = standards;
    }

}
