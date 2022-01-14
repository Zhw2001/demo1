package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.Sku_Stock;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SkuStockMapper {
    void add(Sku_Stock sku);
    List<Sku_Stock> getSkuByPid(Long product_id);
    Sku_Stock getSkuBySku_id(Long id);
}
