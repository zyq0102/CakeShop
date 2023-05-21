package com.zhouyq.cakeshop.mapper;

import com.zhouyq.cakeshop.entity.Order;
import com.zhouyq.cakeshop.entity.OrderItem;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    //查询某个用户的订单（链表查询）
    @Select("select * from `order` where user_id=#{user_id}")
    @Results(id = "orderMap",value = {
            @Result(property = "id",column = "id"),
            @Result(property = "itemList",column = "id",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.OrderMapper.getItems"))
    })
    List<Order> getOrderByUser_id(Integer id);
    //我的订单-查询某个用户的订单详情（联表查询）
    @Select("select * from orderItem where order_id=#{id}")
    @Results(id = "orderMap1",value = {
            @Result(property = "goods_id",column = "goods_id"),
            @Result(property = "goods",column = "goods_id",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.GoodsMapper.getGoods"))
    })
    List<OrderItem> getItems(Integer id);


    //插入订单
    @Insert("insert into `order` (total,amount,status,paytype,name,phone,address,user_id) values(#{total},#{amount},#{status},#{paytype},#{name},#{phone},#{address},#{user_id})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")//注解方式实现：插入完信息order对象中会有最新的id值
    void insertOrder(Order order);
    //插入订单详情，可能会多次调用，订单中每有一类商品就调用一次
    @Insert("insert into orderitem (price,amount,goods_id,order_id) values (#{price},#{amount},#{goods_id},#{order_id})")
    void insertOrderItem(OrderItem orderItem);

    @Delete("delete from `order` where id=#{id}")
    void deleteOrder(Integer id);

    @Delete("delete from orderitem where order_id=#{id}")
    void deleteOrderitem(Integer id);

    @Update("update `order` set status=2 where id=#{id}")
    void pay(Integer id);

    @Select("select * from `order` where status=#{status}")
    @ResultMap("orderMap")
    List<Order> findBystatus(Integer status);

    @Select("select * from `order`")
    @ResultMap("orderMap")
    List<Order> findAll();
    //更新订单状态
    @Update("update `order` set status=#{status} where id=#{id}")
    void orderUpdate(Integer status,Integer id);


}
