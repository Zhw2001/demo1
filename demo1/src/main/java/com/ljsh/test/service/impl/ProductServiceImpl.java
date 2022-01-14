package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.ProductAttributeCategoryMapper;
import com.ljsh.test.mbg.mapper.ProductCartMapper;
import com.ljsh.test.mbg.mapper.ProductMapper;
import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductAttributeCategoryMapper productAttributeCategoryMapper;
    @Autowired
    private ProductCartMapper productCartMapper;

    public Map<Long,String> getCategory_map(){
        Map<Long,String> map=new HashMap<>();
        List<Long> id=productCartMapper.getID();
        List<String> name=productCartMapper.getName();
        for(int i=0;i<id.size();i++){
            map.put(id.get(i),name.get(i));
        }
        return map;
    }

    public Map<Long,String> getAttribute_Category_map(){
        Map<Long,String> map=new HashMap<>();
        List<Long> id=productAttributeCategoryMapper.getAllId();
        List<String> name=productAttributeCategoryMapper.getAllName();
        for(int i=0;i<id.size();i++){
            map.put(id.get(i),name.get(i));
        }
        return map;
    }


    public List<Product> show(){
        return productMapper.getAll();
    }

    public void delete(long id){
        productMapper.deleteByID(id);
    }

    public void AddProduct(Product p){
        if(productMapper.getProductByName(p.getName())==null){
            productMapper.AddProduct(p);
        }
        else{
            productMapper.UpdateProduct(p);
        }
    }

    public Product getProductByName(String name){
        return productMapper.getProductByName(name);
    }

    public Product getProductById(Long id){return productMapper.getProductById(id);}

}
