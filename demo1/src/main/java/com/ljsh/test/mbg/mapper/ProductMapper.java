package com.ljsh.test.mbg.mapper;


import com.ljsh.test.mbg.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> getAll();
    void deleteByID(Long id);
    Product getProductByName(String Name);
    Integer getNumByCid(Long cid);
    void UpdateProduct(Product p);
    Product getProductById(Long id);
    void AddProduct(Product p);
}
