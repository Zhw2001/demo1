package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Sku_Stock;

import java.util.List;

public interface SkuStockService {
    List<Sku_Stock> skuindicatelist(String sp1,String sp2);
    void add(Sku_Stock sku);
}
