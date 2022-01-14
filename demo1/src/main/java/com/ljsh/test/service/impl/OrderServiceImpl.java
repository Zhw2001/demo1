package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.OrderItemMapper;
import com.ljsh.test.mbg.mapper.OrderMapper;
import com.ljsh.test.mbg.mapper.ShoppingCartMapper;
import com.ljsh.test.mbg.mapper.UserMapper;
import com.ljsh.test.mbg.model.Order;
import com.ljsh.test.mbg.model.Order_Item;
import com.ljsh.test.mbg.model.ShoppingCart;
import com.ljsh.test.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;


    public List<Order> getAll(){
        return orderMapper.getAll();
    }

    public void delete(String order_id){
        orderMapper.delete(order_id);
        orderItemMapper.deleteByOrder_Id(order_id);
    }

    public Order getOrderByID(String order_id){return orderMapper.getOrderByID(order_id);}

    public List<Order_Item> getOrder_ItemByOrder_Id(String order_id){return orderItemMapper.getOrder_ItemByorderid(order_id);}

    public void generateOrderFromCart(Long[] ids,String username){
        Order orderlist=new Order();
        Long user_id=Long.parseLong("0");
        if(username!=null){
            user_id=userMapper.getUserByUsername(username).getId();
        }
        Date date= new Date();
        SimpleDateFormat ft =new SimpleDateFormat ("yyyyMMdd");
        String datestr=ft.format(date);
        Random rand = new Random();
        int ran=rand.nextInt(10);
        String order_id=datestr+user_id.toString()+ran;
        for(int i=0;i<ids.length;i++){
            ShoppingCart sc_tmp=shoppingCartMapper.getOneById(ids[i]);
            Order_Item oi_tmp=new Order_Item();
            oi_tmp.setOrder_id(order_id);
            oi_tmp.setItem_id(sc_tmp.getProduct_id());
            oi_tmp.setNum(sc_tmp.getQuantity());
            oi_tmp.setPic(sc_tmp.getProduct_pic());
            oi_tmp.setPrice(sc_tmp.getPrice());
            oi_tmp.setProduct_category_id(sc_tmp.getProduct_category_id());
            oi_tmp.setProduct_sku_code(sc_tmp.getProduct_sku_code());
            oi_tmp.setProduct_sku_id(sc_tmp.getProduct_sku_id());
            oi_tmp.setSp1(sc_tmp.getSp1());
            oi_tmp.setSp2(sc_tmp.getSp2());
            oi_tmp.setTotal_cost(sc_tmp.getPrice()*sc_tmp.getQuantity());
            oi_tmp.setTitle(sc_tmp.getProduct_name());
            orderItemMapper.add_item(oi_tmp);
        }
        orderlist.setOrder_id(order_id);
        orderlist.setStatus(0);
        orderlist.setUser_id(user_id);
        orderlist.setBuyer_nick(username);
        orderMapper.add(orderlist);
    }


    public ModelAndView getOrderAndItsItem(String order_id){
        ModelAndView mav=new ModelAndView();
        Order order=orderMapper.getOrderByID(order_id);
        int status=order.getStatus();
        List<Order_Item> order_item_list=orderItemMapper.getOrder_ItemByorderid(order_id);
        String username=userMapper.getUserById(order.getUser_id()).getUsername();
        if(order.getShipping_name()==null)order.setShipping_name("无");
        double total=0;
        for(int i=0;i<order_item_list.size();i++){
            total=total+order_item_list.get(i).getTotal_cost();
        }
        if (order_item_list.size()==0) status=6;
        int situation;
        if(order.getBuyer_comment()==1){//完成评价
            situation=5;
        }
        else if(order.getEnd_time()!=null){//交易完成时间不为空，表示用户已经确认订单，交易关闭
            situation=4;
        }
        else if(order.getConsign_time()!=null){//发货时间不为空
            situation=3;
        }
        else if(order.getPayment_time()!=null){//支付时间不为空
            situation=2;
        }
        else{//至少提交了订单
            situation=1;
        }
        switch(situation)
        {
            case 1:
                mav.setViewName("BackPage/Order/OrderStatus/OrderStatus1");
                mav.addObject("order_item",order_item_list);
                mav.addObject("order",order);
                mav.addObject("total",total);
                mav.addObject("username",username);
                mav.addObject("status",status);
                break;
            case 2:
                mav.setViewName("BackPage/Order/OrderStatus/OrderStatus2");
                mav.addObject("order_item",order_item_list);
                mav.addObject("order",order);
                mav.addObject("total",total);
                mav.addObject("username",username);
                mav.addObject("status",status);
                break;
            case 3:
                mav.setViewName("BackPage/Order/OrderStatus/OrderStatus3");
                mav.addObject("order_item",order_item_list);
                mav.addObject("order",order);
                mav.addObject("total",total);
                mav.addObject("username",username);
                mav.addObject("status",status);
                break;
            case 4:
                mav.setViewName("BackPage/Order/OrderStatus/OrderStatus4");
                mav.addObject("order_item",order_item_list);
                mav.addObject("order",order);
                mav.addObject("total",total);
                mav.addObject("username",username);
                mav.addObject("status",status);
                break;
            case 5:
                mav.setViewName("BackPage/Order/OrderStatus/OrderStatus5");
                mav.addObject("order_item",order_item_list);
                mav.addObject("order",order);
                mav.addObject("total",total);
                mav.addObject("username",username);
                mav.addObject("status",status);
                break;
        }
        return mav;
    }
}
