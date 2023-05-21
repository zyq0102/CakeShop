package com.zhouyq.cakeshop.entity;

import lombok.Data;
//订单详情表
@Data
public class OrderItem {
    private Integer id;
    private float price;//good价格
    private Integer amount;//同一个good的数量
    private Integer goods_id;
    private Integer order_id;
    private Goods goods;

    public OrderItem() {
    }

    public OrderItem(float price, Integer amount, Integer goods_id, Integer order_id, Goods goods) {
        this.price = price;
        this.amount = amount;
        this.goods_id = goods_id;
        this.order_id = order_id;
        this.goods = goods;
    }

}
