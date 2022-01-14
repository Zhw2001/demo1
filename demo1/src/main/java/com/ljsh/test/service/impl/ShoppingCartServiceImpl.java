package com.ljsh.test.service.impl;

import com.ljsh.test.dto.CartParam;
import com.ljsh.test.mbg.mapper.ProductMapper;
import com.ljsh.test.mbg.mapper.ShoppingCartMapper;
import com.ljsh.test.mbg.mapper.SkuStockMapper;
import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.mbg.model.ShoppingCart;
import com.ljsh.test.mbg.model.Sku_Stock;
import com.ljsh.test.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Autowired
    private SkuStockMapper skuStockMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    public List<ShoppingCart> getSCList(String username){
        return shoppingCartMapper.getAllByUsername(username);
    }

    public List<CartParam> get_add_item(Long pid){//根据商品编号获取sku库存属性:价格的列表
        List<Sku_Stock> skus=skuStockMapper.getSkuByPid(pid);
        List<CartParam> cplist=new ArrayList<>();
        for(int i=0;i<skus.size();i++){
            CartParam tmp=new CartParam();
            tmp.setSp1(skus.get(i).getSp1());
            tmp.setSp2(skus.get(i).getSp2());
            tmp.setPrice(skus.get(i).getPrice());
            tmp.setSku_stock_id(skus.get(i).getId());
            cplist.add(tmp);
        }
        return cplist;
    }

    public ShoppingCart completeShoppingCart(ShoppingCart sc,String username){
        sc.setUsername(username);
        sc.setDelete_status(0);
        Product p=productMapper.getProductById(sc.getProduct_id());
        sc.setPrice(skuStockMapper.getSkuBySku_id(sc.getProduct_sku_id()).getPrice());
        sc.setProduct_category_id(p.getProduct_category_id());
        sc.setProduct_name(p.getName());
        sc.setProduct_pic(p.getPic());
        sc.setProduct_sub_title(p.getSub_title());
        sc.setProduct_sn(p.getProduct_sn());
        Sku_Stock tmp=skuStockMapper.getSkuBySku_id(sc.getProduct_sku_id());
        sc.setProduct_sku_code(tmp.getSku_code());
        shoppingCartMapper.add(sc);
        return sc;
    }

    public void delete_cart_item(Long id){
        shoppingCartMapper.delete(id);
    }

    public void delete_multi(Long[] ids){
        for(int i=0;i<ids.length;i++){
            shoppingCartMapper.delete(ids[i]);
        }
    }

}
