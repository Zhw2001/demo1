package com.ljsh.test.service.impl;

import com.ljsh.test.mbg.mapper.ProductCartMapper;
import com.ljsh.test.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PageServiceImpl implements PageService {
    @Autowired
    private ProductCartMapper productCartMapper;



}
