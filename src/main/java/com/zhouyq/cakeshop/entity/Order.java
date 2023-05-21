package com.zhouyq.cakeshop.entity;

import lombok.Data;

import java.util.HashMap;
import java.util.List;
//订单总表
@Data
public class Order {
    private Integer id;
    private Float total = 0.0f;//总价钱
    private Integer amount = 0;//总商品数
    private Integer status;//订单状态：4种：未付款，已付款，已发货，已完成。
    private Integer paytype;//付款方式：2种：微信，支付宝。
    private String name;
    private String phone;
    private String address;
    private String datetime;
    private int user_id;
    private User user;
    private List<OrderItem> itemList;//订单对应的详情

    //模拟购物车，作为Order订单的一个属性
    private HashMap<Integer, OrderItem> itemMap = new HashMap<>();

    //向购物车添加商品
    public void addGoods(Goods g) {
        if (itemMap.containsKey(g.getId())) {//如果itemMap中已经包含该商品[实际是根据是否有商品id进行判断]，则数量追加
            OrderItem item = itemMap.get(g.getId());//根据Id获取已有的商品
            int c = item.getAmount() + 1;//已有商品数量+1
            item.setAmount(c);//重新设定已有商品的数量
        } else {//如果itemMap中没有该商品，则在模拟购物车中新添加一个商品，默认添加一件
            OrderItem item = new OrderItem(g.getPrice(), 1, g.getId(), id, g);
            itemMap.put(g.getId(), item);//<商品Id,订单详情属性）>
        }
        amount++;//Order订单中的商品总数+1；同时商品数量会在导航栏购物车logo附近显示
        total = total + g.getPrice();//Order订单总金额增加
    }

    //从购物车减少商品
    public void lessenGoods(int goodsid) {
        if (itemMap.containsKey(goodsid)) {//如果itemMap中已经包含该商品[实际是根据是否有商品id进行判断]
            OrderItem item = itemMap.get(goodsid);//根据Id获取已有的商品
            int c = item.getAmount() - 1;//该商品数量-1
            item.setAmount(c);//重新设定已有商品的数量
            amount--;//订单总数-1
            total = total - item.getPrice();//订单总金额减少，减去删除部分的金额
            if (item.getAmount() <= 0) {//如果该商品数量<=0，则从购物车中删除该商品的卡片。
                itemMap.remove(goodsid);
            }
        }
    }

    //从购物车减少商品
    public void deleteGoods(int goodsid) {
        if (itemMap.containsKey(goodsid)) {//如果itemMap中已经包含该商品[实际是根据是否有商品id进行判断]
            OrderItem item = itemMap.get(goodsid);//根据Id获取已有的商品
            amount = amount - item.getAmount();//商品总数量减少
            total = total - item.getAmount() * item.getPrice();//订单总金额减少，减去删除商品的金额
            itemMap.remove(goodsid);//如果该商品数量<=0，则从购物车中删除该商品的卡片。
        }
    }

}
