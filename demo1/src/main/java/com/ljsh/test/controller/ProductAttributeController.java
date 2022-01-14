package com.ljsh.test.controller;


import com.ljsh.test.mbg.model.Sku_Stock;
import com.ljsh.test.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/productAttribute")
public class ProductAttributeController {
    @Autowired
    private ProductAttributeService productAttributeService;



    @GetMapping("/list")
    public ModelAndView ShowProductCart(@RequestParam(value = "PAC_id")Long id ,@RequestParam(value = "type") int type){
        return productAttributeService.getParam(id,type);
    }

    @GetMapping("/attributeParam")
    @ResponseBody
    public String getAttributes(@RequestParam("attributes_category_id") Long id){
       return productAttributeService.getAttributes(id);
    }


}
