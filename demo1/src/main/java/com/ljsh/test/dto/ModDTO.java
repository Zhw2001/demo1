package com.ljsh.test.dto;

import lombok.Data;

@Data
public class ModDTO {
    public ModDTO(Long id, String name, String[] partNames, String[] partRatios, String[] emptyBlocks, Float total) {
        this.id = id;
        this.name = name;
        this.partNames = partNames;
        this.partRatios = partRatios;
        this.emptyBlocks = emptyBlocks;
        this.total = total;
    }

    public ModDTO(){}
    private Long id;
    private String name;
    private String[] partNames;
    private String[] partRatios;
    private String[] emptyBlocks;
    private Float total;

}
