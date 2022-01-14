package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.ProductAttribute;
import com.ljsh.test.mbg.model.ProductAttributeCategory;
import com.ljsh.test.service.ProductAttributeCategoryService;
import com.ljsh.test.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/productAttributeCategory")
public class ProductAttributeCategoryController {
    @Autowired
    private ProductAttributeCategoryService productAttributeCategoryService;


    @GetMapping("/list")
    public ModelAndView ShowProductCart(){
        ModelAndView mav= new ModelAndView("BackPage/Product/ProductAttributeCategory");
        List<ProductAttributeCategory> productAttributeCategories=productAttributeCategoryService.getAll();
        mav.addObject("ProductACs_list",productAttributeCategories);
        return mav;
    }
}
