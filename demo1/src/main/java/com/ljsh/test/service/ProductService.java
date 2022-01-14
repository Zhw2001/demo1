package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Person;
import com.ljsh.test.mbg.model.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    List<Product> show();
    void delete(long id);
    void AddProduct(Product p);
    Product getProductByName(String name);
    Product getProductById(Long id);
    Map<Long,String> getCategory_map();
    Map<Long,String> getAttribute_Category_map();

}
