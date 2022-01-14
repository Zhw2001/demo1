package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.mbg.model.ProductCart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductCartMapper {
    List<ProductCart> getAll();

    List<String> getName();

    List<ProductCart> getAllDes(@Param("parent_id")long parent_id, @Param("level")int level);

    ProductCart getOne(Long id);

    List<Long> getID();
}
