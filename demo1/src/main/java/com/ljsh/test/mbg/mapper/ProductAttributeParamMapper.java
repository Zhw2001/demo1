package com.ljsh.test.mbg.mapper;

import com.ljsh.test.dto.ProductAttributeParam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductAttributeParamMapper {
    List<ProductAttributeParam> getAllByPAC_id(@Param("productACid")long productAC_id, @Param("type")int type);
}
