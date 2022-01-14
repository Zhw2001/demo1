package com.ljsh.test.service;

import com.ljsh.test.mbg.model.ProductCart;

import java.util.List;


public interface ProductCartService {
    List<ProductCart> show();
    List<ProductCart> showDes(Long id);
}
