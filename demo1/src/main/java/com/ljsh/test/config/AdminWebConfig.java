package com.ljsh.test.config;

import com.ljsh.test.Filter.MyHandlerInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdminWebConfig implements WebMvcConfigurer {

    private MyHandlerInterceptor myHandlerInterceptor;

    public AdminWebConfig(MyHandlerInterceptor myHandlerInterceptor){
        this.myHandlerInterceptor = myHandlerInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myHandlerInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/","/login","/admin/login","/regist","/admin/regist","FrontPage/login/login","/css/**","/pic/**","/js/**");
    }

}
