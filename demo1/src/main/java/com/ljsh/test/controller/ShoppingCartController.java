package com.ljsh.test.controller;

import com.alibaba.fastjson.JSON;
import com.ljsh.test.dto.CartParam;
import com.ljsh.test.mbg.model.ShoppingCart;
import com.ljsh.test.service.ShoppingCartService;
import com.ljsh.test.service.SkuStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartController {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @RequestMapping("/list")
    public ModelAndView toCartIndex(HttpSession session){
        String username=(String)session.getAttribute("loginUser");
        List<ShoppingCart> cart_list=shoppingCartService.getSCList(username);
        ModelAndView mav=new ModelAndView("FrontPage/ShoppingCart/cart");
        mav.addObject("cart_list",cart_list);
        return mav;
    }

    @GetMapping("/add_item")
    public ModelAndView AddIntoCart(@RequestParam("product_id")String pid){
        ModelAndView mav=new ModelAndView("FrontPage/ShoppingCart/AddIntoCart");
        Long product_id=Long.parseLong(pid);
        List<CartParam> cplist=shoppingCartService.get_add_item(product_id);
        mav.addObject("pid",product_id);
        mav.addObject("cplist",cplist);
        return mav;
    }

    @PostMapping("/addintocart")
    @ResponseBody
    public ShoppingCart SendCartDatatoCart(@RequestBody String json, HttpSession session){
        ShoppingCart sc=new ShoppingCart();
        sc=JSON.parseObject(json,  ShoppingCart.class);
        String username=(String)session.getAttribute("loginUser");
        shoppingCartService.completeShoppingCart(sc,username);
        return sc;
    }

    @RequestMapping("/delete_cart_item")
    @ResponseBody
    public void delete(@RequestBody String json){
        ShoppingCart sc=new ShoppingCart();
        sc=JSON.parseObject(json,  ShoppingCart.class);
        shoppingCartService.delete_cart_item(sc.getId());
    }

    @RequestMapping("/delete_mult")
    public String delete_mult(@RequestParam("id") String id){
        String[] strs=id.split(",");
        Long[] ids=new Long[strs.length];
        for(int i=0;i<strs.length;i++){
            ids[i]=Long.parseLong(strs[i]);
        }
        shoppingCartService.delete_multi(ids);
        return "redirect:/product/front/list";
    }
}
