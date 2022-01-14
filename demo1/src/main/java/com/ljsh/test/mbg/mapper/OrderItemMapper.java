package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Order_Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderItemMapper {
    List<Order_Item> getOrder_ItemByorderid(String order_id);
    void deleteByOrder_Id(String order_id);
    void deleteByProduct_Id(long item_id);
    void add_item(Order_Item item);
}
