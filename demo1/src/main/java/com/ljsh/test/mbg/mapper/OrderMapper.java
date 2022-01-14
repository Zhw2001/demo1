package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    List<Order> getAll();
    void delete(String order_id);
    Order getOrderByID(String order_id);
    void add(Order order);
}
