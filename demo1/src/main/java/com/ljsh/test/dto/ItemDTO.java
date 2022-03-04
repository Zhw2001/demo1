package com.ljsh.test.dto;

import lombok.Data;

@Data
public class ItemDTO {
    public ItemDTO(Long id, String name, String score, Boolean checklock) {
        this.id = id;
        this.name = name;
        this.score = score;
        this.checklock = checklock;
    }

    public ItemDTO(){}
    private Long id;
    private String name;
    private String score;
    private Boolean checklock;
}
