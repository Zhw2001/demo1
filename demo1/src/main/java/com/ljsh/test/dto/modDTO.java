package com.ljsh.test.dto;

import lombok.Data;

@Data
public class modDTO {

    public modDTO(String name, String[] partNames, String[] partRatios, String[] emptyBlocks, Float total) {
        this.name = name;
        this.partNames = partNames;
        this.partRatios = partRatios;
        this.emptyBlocks = emptyBlocks;
        this.total = total;
    }

    public modDTO(){}

    private String name;
    private String[] partNames;
    private String[] partRatios;
    private String[] emptyBlocks;
    private Float total;

}
