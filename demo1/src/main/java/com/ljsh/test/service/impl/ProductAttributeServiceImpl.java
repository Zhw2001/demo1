package com.ljsh.test.service.impl;


import com.ljsh.test.dto.ProductAttributeList;
import com.ljsh.test.mbg.mapper.ProductAttributeCategoryMapper;
import com.ljsh.test.mbg.mapper.ProductAttributeMapper;
import com.ljsh.test.mbg.model.ProductAttribute;
import com.ljsh.test.service.ProductAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductAttributeServiceImpl implements ProductAttributeService {
    @Autowired
    private ProductAttributeMapper productAttributeMapper;
    @Autowired
    private ProductAttributeCategoryMapper productAttributeCategoryMapper;

    public List<ProductAttribute> getAll(){
        return productAttributeMapper.getAll();
    }

    public ModelAndView getParam(long productAC_id,int type){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("BackPage/Product/ProductAttribute");
        List<ProductAttribute> productAs=productAttributeMapper.getByPAC_IDandType(productAC_id,type);
        String Cname=productAttributeCategoryMapper.getNameById(productAC_id);
        List<ProductAttributeList> productAttributeList=new ArrayList<ProductAttributeList>();
        for(int i=0;i<productAs.size();i++){
            ProductAttributeList tmp=new ProductAttributeList();
            tmp.setId(productAs.get(i).getId());
            tmp.setName(productAs.get(i).getName());
            tmp.setAttributeCategoryType(Cname);
            switch (productAs.get(i).getSelect_type()){
                case 0:
                    tmp.setSelectT("唯一");
                    break;
                case 1:
                    tmp.setSelectT("单选");
                    break;
                case 2:
                    tmp.setSelectT("多选");
                    break;
            }
            switch (productAs.get(i).getInput_type()){
                case 0:
                    tmp.setInputT("手工输入");
                    break;
                case 1:
                    tmp.setInputT("列表读取");
                    break;
            }
            tmp.setInputList(productAs.get(i).getInput_list());
            tmp.setSort(productAs.get(i).getSort());
            productAttributeList.add(tmp);
        }
        mav.addObject("ProductAs_list", productAttributeList);
        return mav;
    }

    public String getAttributes(Long ACID){
        int Attr_num=productAttributeMapper.countAttributes(ACID,0);
        int AttrValue_num=0;
        List<ProductAttribute> P_A=productAttributeMapper.getAllByACID(ACID,0);
        String num="";
        num=num+Attr_num;
        String tmp="";
        String sku=new String();
        String s1="";
        String s2="";
        String A_V_N="";
        for(int i=0;i<P_A.size();i++){
            if(P_A.get(i).getInput_type()==0)continue;
            tmp="";
            sku=P_A.get(i).getInput_list();
            s1=s1+"&"+P_A.get(i).getName();
            ArrayList<String> sku_value=new ArrayList<>();
            for(int j=0;j<sku.length();j++){
                if(sku.charAt(j)!=','){
                    tmp=tmp+sku.charAt(j);
                }
                else{
                    s2=s2+"&"+tmp;
                    tmp="";
                    AttrValue_num=AttrValue_num+1;
                    continue;
                }
            }
            s2=s2+"&"+tmp;
            A_V_N=A_V_N+"&"+(AttrValue_num+1);
            AttrValue_num=0;
        }
        return num+A_V_N+s1+s2;//num是这一类属性的个数，A_V_N是某个属性的取值个数，s1是属性名，s2是取值
    }
}
