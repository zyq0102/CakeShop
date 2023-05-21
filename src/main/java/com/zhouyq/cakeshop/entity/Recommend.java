package com.zhouyq.cakeshop.entity;

import lombok.Data;
//推荐
@Data
public class Recommend {
    private Integer id;
    private Integer type;
    private Integer goods_id;
    private Goods goods;
}
