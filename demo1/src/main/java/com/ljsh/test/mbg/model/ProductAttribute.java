package com.ljsh.test.mbg.model;

public class ProductAttribute {
    private Long id;
    private Long product_attribute_category_id;
    private String name;
    private int select_type;
    private int input_type;
    private String input_list;
    private int sort;
    private int filter_type;
    private int search_type;
    private int related_status;
    private int hand_add_status;
    private int type;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProduct_attribute_category_id() {
        return product_attribute_category_id;
    }

    public void setProduct_attribute_category_id(Long product_attribute_category_id) {
        this.product_attribute_category_id = product_attribute_category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSelect_type() {
        return select_type;
    }

    public void setSelect_type(int select_type) {
        this.select_type = select_type;
    }

    public int getInput_type() {
        return input_type;
    }

    public void setInput_type(int input_type) {
        this.input_type = input_type;
    }

    public String getInput_list() {
        return input_list;
    }

    public void setInput_list(String input_list) {
        this.input_list = input_list;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int getFilter_type() {
        return filter_type;
    }

    public void setFilter_type(int filter_type) {
        this.filter_type = filter_type;
    }

    public int getSearch_type() {
        return search_type;
    }

    public void setSearch_type(int search_type) {
        this.search_type = search_type;
    }

    public int getRelated_status() {
        return related_status;
    }

    public void setRelated_status(int related_status) {
        this.related_status = related_status;
    }

    public int getHand_add_status() {
        return hand_add_status;
    }

    public void setHand_add_status(int hand_add_status) {
        this.hand_add_status = hand_add_status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

}
