package com.ljsh.test.dto;

import lombok.Data;

@Data
public class itemDTO {
    public itemDTO(String name, String score, Boolean checklock) {
        this.name = name;
        this.score = score;
        this.checklock = checklock;
    }
    public itemDTO(){}
    private String name;
    private String score;
    private Boolean checklock;
}
