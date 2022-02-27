package com.ljsh.test.domain.model;

import lombok.Data;

@Data
public class MyItem {
    public MyItem(String item_name, String item_value, String cid, String part) {
        this.item_name = item_name;
        this.item_value = item_value;
        this.cid = cid;
        this.part = part;
    }

    public MyItem() {
    }

    private String item_name;
    private String item_value;
    private String cid;
    private String part;
}
