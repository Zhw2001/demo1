package com.ljsh.test.controller;

import com.ljsh.test.dto.CartParam;
import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @PostMapping("/add_next")
    public ModelAndView AddNewProductNext(HttpServletRequest request){
        Product p=new Product();
        if(request.getParameter("id")!=""){
            p.setId(Long.parseLong(request.getParameter("id")));
        }
        p.setName(request.getParameter("name"));
        p.setSub_title(request.getParameter("sub_title"));
        p.setDescription(request.getParameter("description"));
        p.setProduct_sn(request.getParameter("product_sn"));
        if(request.getParameter("price")==""){
            p.setPrice(0);
        }
        else{
            p.setPrice(Double.parseDouble(request.getParameter("price")));
        }

        if(request.getParameter("original_price")==""){
            p.setOriginal_price(0);
        }
        else{
            p.setOriginal_price(Double.parseDouble(request.getParameter("original_price")));
        }
        if(request.getParameter("stock")==""){
            p.setStock(0);
        }
        else{
            p.setStock(Integer.parseInt(request.getParameter("stock")));
        }
        if(request.getParameter("sort")==""){
            p.setSort(0);
        }
        else{
            p.setSort(Integer.parseInt(request.getParameter("sort")));
        }
        p.setProduct_category_id(Long.parseLong(request.getParameter("product_category")));
        p.setPic(request.getParameter("pic"));
        Map<Long,String> Category_map=productService.getCategory_map();
        p.setProduct_category_name(Category_map.get(p.getProduct_category_id()));
        Map<Long,String> Attribute_Category_map=productService.getAttribute_Category_map();
        productService.AddProduct(p);
        Long id=productService.getProductByName(p.getName()).getId();
        ModelAndView mav=new ModelAndView("BackPage/Product/ProductAdd2");
        mav.addObject("product_id",id);
        mav.addObject("ACMap",Attribute_Category_map);
        return mav;
    }


/*
    @PostMapping("/edit")
    @ResponseBody
    public Product EditProduct(@RequestBody Product product){
        Product p= productService.ShowTheProduct(product.getTitle());
        return p;
    }
*/
    @GetMapping("/edit")
    public ModelAndView EditProduct(@RequestParam("name")String name){
        ModelAndView mav=new ModelAndView("BackPage/Product/AddProduct");
        Product p=productService.getProductByName(name);
        Map<Long,String> Category_map=productService.getCategory_map();
        mav.addObject("product",p);
        mav.addObject("category_map",Category_map);
        return mav;
    }



    @GetMapping("/list")
    public ModelAndView ShowProductList(){
        ModelAndView mav=new ModelAndView("BackPage/Product/ProductList");
        List<Product> product= productService.show();
        mav.addObject("p_list",product);
        return mav;
    }

    @GetMapping("/front/list")
    public ModelAndView ShowFrontProduct(){
        ModelAndView mav=new ModelAndView("FrontPage/Product/ProductList");
        List<Product> product= productService.show();
        mav.addObject("p_list",product);
        return mav;
    }


    @PostMapping("/delete")
    @ResponseBody
    public String testPostRestful(@RequestBody Product product){
        Long id=product.getId();
        System.out.println(id);
        productService.delete(id);
        return product.toString();
    }


}
