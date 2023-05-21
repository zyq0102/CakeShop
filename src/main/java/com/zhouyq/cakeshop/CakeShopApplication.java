package com.zhouyq.cakeshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@MapperScan("com.zhouyq.cakeshop.mapper")
@ServletComponentScan("com.zhouyq.cakeshop.filter")
public class CakeShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(CakeShopApplication.class, args);
    }

}
