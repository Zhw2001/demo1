package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.Order;
import com.ljsh.test.mbg.model.Order_Item;
import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/list")
    public ModelAndView ShowOrderList(){
        ModelAndView mav=new ModelAndView("BackPage/Order/OrderList");
        List<Order> orderList=orderService.getAll();
        mav.addObject("list",orderList);
        return mav;
    }

    @PostMapping("/delete")
    @ResponseBody
    public String testPostRestful(@RequestBody Order order){
        String orderid=order.getOrder_id();
        System.out.println(orderid);
        orderService.delete(orderid);
        return order.toString();
    }


    @GetMapping("/orderstatus")
    public ModelAndView tocheckorder(@RequestParam("order_id") String order_id){
        System.out.println(order_id);
        ModelAndView mav=orderService.getOrderAndItsItem(order_id);
        return mav;
    }

    @GetMapping("/add")
    public String addorder(@RequestParam("id")String id, HttpSession session){
        String username=(String)session.getAttribute("loginUser");
        String[] strs=id.split(",");
        Long[] ids=new Long[strs.length];
        for(int i=0;i<strs.length;i++){
            ids[i]=Long.parseLong(strs[i]);
        }
        orderService.generateOrderFromCart(ids,username);
        return "redirect:/product/front/list";
    }

}
