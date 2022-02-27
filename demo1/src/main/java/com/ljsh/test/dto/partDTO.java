package com.ljsh.test.dto;

import lombok.Data;

@Data
public class partDTO {
    public partDTO(String name, String ratio, Boolean checklock) {
        this.name = name;
        this.ratio = ratio;
        this.checklock = checklock;
    }
    public partDTO(){}
    private String name;
    private String ratio;
    private Boolean checklock;

}
