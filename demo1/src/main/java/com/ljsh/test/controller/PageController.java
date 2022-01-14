package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.service.PageService;
import com.ljsh.test.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class PageController {
    @Autowired
    private ProductService productService;


    @RequestMapping("/login")
    public String tologin(){
        return "FrontPage/login/login";
    }
    @RequestMapping("/后台")
    public String toHouTai(){
        return "BackPage/后台";
    }
    @RequestMapping("/regist")
    public String toregist(){return "FrontPage/login/regist";}
    @RequestMapping("/addproduct")
    public ModelAndView toAddProduct() {
        ModelAndView mav=new ModelAndView("BackPage/Product/AddProduct");
        Map<Long,String> Category_map=productService.getCategory_map();
        Product p=new Product();
        mav.addObject("category_map",Category_map);
        mav.addObject("product",p);
        return mav;
    }
    @RequestMapping("/EditProduct")
    public String toEditP(){return "BackPage/Product/EditProduct";}
    @RequestMapping("/productAttribute")
    public String toProAttribute(){
        return "BackPage/Product/ProductAttribute";
    }

}
