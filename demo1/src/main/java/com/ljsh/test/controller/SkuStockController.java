package com.ljsh.test.controller;

import com.ljsh.test.mbg.model.Sku_Stock;
import com.ljsh.test.service.SkuStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/SKU")
public class SkuStockController {
    @Autowired
    private SkuStockService skuStockService;

    @RequestMapping("/skuRefresh")
    public String localSkuRefresh(Model model, @RequestParam("sp1") String sp1, @RequestParam("sp2")String sp2){
        Sku_Stock sku=new Sku_Stock();
        sku.setSp1(sp1);
        sku.setSp2(sp2);
        List<Sku_Stock> skulist=skuStockService.skuindicatelist(sp1,sp2);
        model.addAttribute("SKU_list",skulist);
        return "BackPage/Product/ProductAdd2::table_refresh";
    }

    @RequestMapping("/addsku")
    @ResponseBody
    public void addsku(HttpServletRequest request){
        List<Sku_Stock> skulist= new ArrayList<>();
        String[] sp1=request.getParameter("sp1").split(",");
        String[] sp2=request.getParameter("sp2").split(",");
        String[] price=request.getParameter("price").split(",");
        String[] stock=request.getParameter("stock").split(",");
        String[] low_stock=request.getParameter("low_stock").split(",");
        String[] sku_code=request.getParameter("sku_code").split(",");
        int sale=Integer.parseInt(request.getParameter("sale"));
        Long product_id=Long.parseLong(request.getParameter("product_id"));
        for(int i=0;i<sp1.length;i++){
            Sku_Stock tmp=new Sku_Stock();
            tmp.setSp1(sp1[i]);
            tmp.setSp2(sp2[i]);
            tmp.setStock(Integer.parseInt(stock[i]));
            tmp.setLow_stock(Integer.parseInt(low_stock[i]));
            tmp.setSku_code(sku_code[i]);
            tmp.setSale(sale);
            tmp.setProduct_id(product_id);
            tmp.setPrice(Double.parseDouble(price[i]));
            skuStockService.add(tmp);
        }
    }
}
