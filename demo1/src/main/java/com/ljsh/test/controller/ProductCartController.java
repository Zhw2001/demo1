package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.mbg.model.ProductCart;
import com.ljsh.test.service.ProductCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/productcart")
public class ProductCartController {
    @Autowired
    private ProductCartService productCartService;


    @GetMapping("/list")
    public ModelAndView ShowProductCart(){
        ModelAndView mav= new ModelAndView("BackPage/Product/ProductCart");
        List<ProductCart> cart= productCartService.show();
        mav.addObject("list",cart);
        return mav;
    }

    @RequestMapping("/des")
    public ModelAndView ShowDes(@RequestParam("id")String id){
        Long this_id=Long.parseLong(id);
        List<ProductCart> pChild=productCartService.showDes(this_id);
        ModelAndView mav=new ModelAndView();
        if(pChild==null){
            mav=new ModelAndView("redirect:/productcart/list");
        }
        else{
            mav= new ModelAndView("BackPage/Product/ProductCartSecondary");
            mav.addObject("list",pChild);
        }
        return mav;
    }
}
