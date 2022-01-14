package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.ProductCartMapper;
import com.ljsh.test.mbg.mapper.ProductMapper;
import com.ljsh.test.mbg.model.Product;
import com.ljsh.test.mbg.model.ProductCart;
import com.ljsh.test.service.ProductCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ListIterator;

@Service
public class ProductCartServiceImpl implements ProductCartService {
    @Autowired
    private ProductCartMapper productCartMapper;
    @Autowired
    private ProductMapper productMapper;

    public List<ProductCart> show(){
        List<ProductCart> pc= productCartMapper.getAll();
        ListIterator<ProductCart> it=pc.listIterator();
        for(int i=1;i<pc.size();i++){
            if(pc.get(i).getLevel()==1){
                continue;
            }
            pc.get(i).setNum(productMapper.getNumByCid(pc.get(i).getId()));
        }
        int num_all=0;
        for(int i=1;i<pc.size();i++){
            if(pc.get(i).getNum()==null){
                num_all=num_all+0;
                continue;
            }
            num_all=num_all+pc.get(i).getNum();
        }
        pc.get(0).setNum(num_all);
        return pc;
    }

    public List<ProductCart> showDes(Long id){
        ProductCart cateFather= productCartMapper.getOne(id);
        if(2-cateFather.getLevel()==0){
            return null;
        }
        else{
            return productCartMapper.getAllDes(id,cateFather.getLevel()+1);
        }
    }

}
