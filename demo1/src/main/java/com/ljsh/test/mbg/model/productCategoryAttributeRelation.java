package com.ljsh.test.mbg.model;

public class productCategoryAttributeRelation {
    private Long id;
    private Long product_category_id;
    private Long product_attribute_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProduct_category_id() {
        return product_category_id;
    }

    public void setProduct_category_id(Long product_category_id) {
        this.product_category_id = product_category_id;
    }

    public Long getProduct_attribute_id() {
        return product_attribute_id;
    }

    public void setProduct_attribute_id(Long product_attribute_id) {
        this.product_attribute_id = product_attribute_id;
    }

}
