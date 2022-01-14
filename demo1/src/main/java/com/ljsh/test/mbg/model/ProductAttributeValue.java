package com.ljsh.test.mbg.model;

public class ProductAttributeValue {
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }

    public Long getProduct_attribute_id() {
        return product_attribute_id;
    }

    public void setProduct_attribute_id(Long product_attribute_id) {
        this.product_attribute_id = product_attribute_id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    private Long id;
    private Long product_id;
    private Long product_attribute_id;
    private String value;
}
