package com.ljsh.test.dto;

public class ProductAttributeList {
    private Long id;
    private String name;
    private String AttributeCategoryType;
    private String selectT;
    private String inputT;
    private String inputList;
    private int sort;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAttributeCategoryType() {
        return AttributeCategoryType;
    }

    public void setAttributeCategoryType(String attributeCategoryType) {
        AttributeCategoryType = attributeCategoryType;
    }

    public String getSelectT() {
        return selectT;
    }

    public void setSelectT(String selectT) {
        this.selectT = selectT;
    }

    public String getInputT() {
        return inputT;
    }

    public void setInputT(String inputT) {
        this.inputT = inputT;
    }

    public String getInputList() {
        return inputList;
    }

    public void setInputList(String inputList) {
        this.inputList = inputList;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }
}
