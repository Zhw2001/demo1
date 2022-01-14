package com.ljsh.test.service;

import com.ljsh.test.dto.CartParam;
import com.ljsh.test.mbg.model.ShoppingCart;

import java.util.List;

public interface ShoppingCartService {

    List<CartParam> get_add_item(Long pid);
    ShoppingCart completeShoppingCart(ShoppingCart sc, String username);
    List<ShoppingCart> getSCList(String username);
    void delete_cart_item(Long id);
    void delete_multi(Long[] ids);
}
