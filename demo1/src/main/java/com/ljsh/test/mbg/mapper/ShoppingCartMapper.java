package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShoppingCartMapper {
    void add(ShoppingCart sc);
    List<ShoppingCart> getAllByUsername(String username);
    ShoppingCart getOneById(Long id);
    void delete(Long id);
}
