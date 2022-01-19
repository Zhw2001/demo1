package com.ljsh.test.utils;

import lombok.Data;

import java.util.UUID;

@Data
public class UUIDGenerator {
    private String myuuid;

    public UUIDGenerator() {
        this.getUUID();
    }

    private String getUUID() {
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        this.myuuid = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
        return myuuid;
    }

    public String getPart(int i){
        return myuuid.substring(0,i);
    }

}
