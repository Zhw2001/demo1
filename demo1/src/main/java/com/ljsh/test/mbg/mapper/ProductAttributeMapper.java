package com.ljsh.test.mbg.mapper;

import com.ljsh.test.mbg.model.ProductAttribute;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductAttributeMapper {
    List<ProductAttribute> getAll();
    List<ProductAttribute> getByPAC_IDandType(@Param("productACid")long productAC_id, @Param("type")int type);
    List<ProductAttribute> getAllByACID(@Param("productACid")long productAC_id, @Param("type")int type);
    Integer countAttributes(@Param("productACid")long productAC_id, @Param("type")int type);//统计某一类属性的数量
}
