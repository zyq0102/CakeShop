package com.zhouyq.cakeshop.entity;

import lombok.Data;

@Data
public class Goods {
    private int id;
    private String name;
    private String cover;
    private String image1;
    private String image2;
    private Float price;
    private String intro;
    private Integer stock;
    private Integer type_id;//外键，根据id查找一个类别
    //联表查询，根据type_id->GoodsMapper中查询一个type
    private Type type;
    private String typename;
    private Integer recomm;
}
