package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.SkuStockMapper;
import com.ljsh.test.mbg.model.Sku_Stock;
import com.ljsh.test.service.SkuStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SkuStockServiceImpl implements SkuStockService {
    @Autowired
    SkuStockMapper skuStockMapper;

    public List<Sku_Stock> skuindicatelist(String sp1,String sp2){
        List<Sku_Stock> skulist=new ArrayList<>();
        String str1s[]=sp1.split(",");
        String str2s[]=sp2.split(",");
        for(int i=1;i<str1s.length;i++){
            for(int j=1;j<str2s.length;j++){
                Sku_Stock tmp=new Sku_Stock();
                tmp.setSp2(str2s[j]);
                tmp.setSp1(str1s[i]);
                skulist.add(tmp);
            }
        }
        return skulist;
    }
    public void add(Sku_Stock sku){
        skuStockMapper.add(sku);
    };
}
