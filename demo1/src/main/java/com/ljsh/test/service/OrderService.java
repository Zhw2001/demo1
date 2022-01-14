package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Order;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface OrderService {
    List<Order> getAll();
    void delete(String order_id);
    Order getOrderByID(String order_id);
    ModelAndView getOrderAndItsItem(String order_id);
    void generateOrderFromCart(Long[] ids,String username);
}
