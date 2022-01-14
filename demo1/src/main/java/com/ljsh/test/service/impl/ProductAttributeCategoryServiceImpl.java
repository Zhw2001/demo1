package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.ProductAttributeCategoryMapper;
import com.ljsh.test.mbg.model.ProductAttributeCategory;
import com.ljsh.test.service.ProductAttributeCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductAttributeCategoryServiceImpl implements ProductAttributeCategoryService {
    @Autowired
    private ProductAttributeCategoryMapper productAttributeCategoryMapper;
    public List<ProductAttributeCategory> getAll(){
        return productAttributeCategoryMapper.getAll();
    }
}
