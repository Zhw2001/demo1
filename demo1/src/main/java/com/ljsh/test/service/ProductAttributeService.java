package com.ljsh.test.service;

import com.ljsh.test.mbg.model.Person;
import com.ljsh.test.mbg.model.ProductAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface ProductAttributeService {
    List<ProductAttribute> getAll();
    ModelAndView getParam(long productAC_id, int type);
    String getAttributes(Long ACID);//获取某一属性类型下的所有规格和参数
}
