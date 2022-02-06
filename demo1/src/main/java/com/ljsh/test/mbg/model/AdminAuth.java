package com.ljsh.test.mbg.model;

import lombok.Data;

@Data
public class AdminAuth {
    private Long authority_id;
    private String authority_name;
    private String authority_type;
    private String authority_parent_id;
    private String authority_parent_name;
    private String authority_url;
    private int authority_sort;
    private String authority_description;
    private int authority_enable;
}
