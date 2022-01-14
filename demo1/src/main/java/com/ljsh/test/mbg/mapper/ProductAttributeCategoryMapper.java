package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.ProductAttributeCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductAttributeCategoryMapper {
    List<ProductAttributeCategory> getAll();
    List<ProductAttributeCategory> getAllById(Long id);
    String getNameById(Long id);
    List<String> getAllName();
    List<Long> getAllId();
}
