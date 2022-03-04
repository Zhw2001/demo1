package com.ljsh.test.dto;

import lombok.Data;

@Data
public class PartDTO {
    public PartDTO(Long id, String name, String ratio, Boolean checklock) {
        this.id = id;
        this.name = name;
        this.ratio = ratio;
        this.checklock = checklock;
    }

    public PartDTO(){}
    private Long id;
    private String name;
    private String ratio;
    private Boolean checklock;

}
