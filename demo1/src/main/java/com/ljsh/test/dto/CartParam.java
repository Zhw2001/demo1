package com.ljsh.test.dto;

import java.util.Map;

public class CartParam {
    private String sp1;
    private String sp2;
    private Double price;
    private Long sku_stock_id;


    public String getSp1() {
        return sp1;
    }

    public void setSp1(String sp1) {
        this.sp1 = sp1;
    }

    public String getSp2() {
        return sp2;
    }

    public void setSp2(String sp2) {
        this.sp2 = sp2;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Long getSku_stock_id() {
        return sku_stock_id;
    }

    public void setSku_stock_id(Long sku_stock_id) {
        this.sku_stock_id = sku_stock_id;
    }


}
