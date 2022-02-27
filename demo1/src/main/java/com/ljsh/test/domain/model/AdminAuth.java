package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class AdminAuth {
    private Long authority_id;
    private String authority_name;
    private int authority_type;
    private Long authority_parent_id;
    private String authority_parent_name;
    private String authority_url;
    private int authority_sort;
    private String authority_description;
    private int authority_enable;

    public AdminAuth(){}

    public AdminAuth(Long authority_id, String authority_name, int authority_type, Long authority_parent_id, String authority_parent_name, String authority_url, int authority_sort, String authority_description, int authority_enable) {
        this.authority_id = authority_id;
        this.authority_name = authority_name;
        this.authority_type = authority_type;
        this.authority_parent_id = authority_parent_id;
        this.authority_parent_name = authority_parent_name;
        this.authority_url = authority_url;
        this.authority_sort = authority_sort;
        this.authority_description = authority_description;
        this.authority_enable = authority_enable;
    }

}
