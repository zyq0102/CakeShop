package com.zhouyq.cakeshop.mapper;

import com.zhouyq.cakeshop.entity.Goods;
import com.zhouyq.cakeshop.entity.Recommend;
import com.zhouyq.cakeshop.entity.Type;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {
    //根据type_id查询一个type
    @Select("select * from goods where type_id=#{typeid}")
    @Results(id = "goodsMap", value = {
            @Result(property = "type_id", column = "type_id"),
            @Result(property = "type", column = "type_id",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.GoodsMapper.getType"))
    })
    List<Goods> getGoodsList(Integer typeid);

    //查询所有商品
    @Select("select * from goods")
    @Results(id = "type", value = {
            @Result(property = "recomm", column = "type",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.GoodsMapper.Type"))
    })
    List<Goods> findAll();

    @Select("select type from recommend")
    Integer Type();

    //根据id查找一个类别->首页类别商品展示
    @Select("select * from type where id=#{id}")
    Type getType();

    @Select("select * from goods where id=#{id}")
    @Results(id = "goodsMap1", value = {
            @Result(property = "type_id", column = "type_id"),
            @Result(property = "typename", column = "type_id",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.GoodsMapper.getTypeName"))
    })
    Goods getGoods(Integer id);

    //根据id获取类别名
    @Select("select name from type where id=#{id}")
    String getTypeName(Integer id);

    //根据type查询商品 1.轮播图 2.热销产品 3.新品推荐| goods_list.jsp、导航栏中的热销推荐和新品推荐[查询的是recommend表]
    @Select("select * from recommend where type=#{type}")
    @Results(id = "recommendMap", value = {
            @Result(property = "goods_id", column = "goods_id"),
            @Result(property = "goods", column = "goods_id",
                    one = @One(select = "com.zhouyq.cakeshop.mapper.GoodsMapper.getGoods"))
    })
    List<Recommend> getAllRecommends(int type);

    //搜索商品（模糊查询） header.jsp、IndexController->goods_search
    @Select({"<script>" +
            "select * from goods where 1=1" +
            "<if test=\"name!=null and name!=''\"> and name like concat('%',#{name},'%')</if>" +
            "</script>"})
    List<Goods> searchGoods(String keyword);

    @Update("update goods set stock=#{stock} where id=#{id}")
    void updateStock(Goods g);

    @Insert("insert into goods (name,price,intro,stock,cover,image1,image2,type_id) values(#{name},#{price},#{intro},#{stock},#{cover},#{image1},#{image2},#{type_id})")
    void insert(Goods goods);

    @Update("update goods set name=#{name},price=#{price},intro=#{intro},stock=#{stock},cover=#{cover},image1=#{image1},image2=#{image2},type_id=#{type_id} where id=#{id}")
    void update(Goods goods);

    @Delete("delete from goods where id=#{id}")
    void delete(Integer id);

    @Insert("insert into recommend(type,goods_id) values(#{type},#{goods_id})")
    void addRecommend(Integer type, Integer goods_id);

    @Delete("delete from recommend where type=#{type} and goods_id=#{goods_id}")
    void deleteRecommend(Integer type, Integer goods_id);

    //商品查询：查询所有商品->indexController[goods]
    @Select("select distinct g.*,t.name typename,r.type recomm from goods g left join type t on g.type_id=t.id left join recommend r on g.id=r.goods_id")
    List<Goods> goods();

    // 商品查询：根据推荐类别查询->indexController[recommend]
    @Select("select distinct g.*,t.name typename,r.type recomm from goods g left join type t on g.type_id=t.id left join recommend r on g.id=r.goods_id where r.type=#{type}")
    List<Goods> recommend(Integer type);

    @Select({"<script>" +
            "SELECT * FROM goods WHERE 1=1 " +
            "<if test=\"name!=null and name!=''\"> AND name like CONCAT('%',#{name},'%')</if>" +
            "<if test=\"price!=null and price!=''\"> AND price like CONCAT('%',#{price},'%')</if>" +
            "</script>"})
    List<Goods> getGoodsByCondition(String name, float price);

}
