package com.zhouyq.cakeshop.mapper;

import com.zhouyq.cakeshop.entity.Type;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TypeMapper
{
    @Select("select * from type")
    List<Type> findAll();

    @Select("select * from type where id=#{id}")
    Type getType(Integer id);

    @Insert("insert into type (name) values (#{name})")
    void insert(Type type);

    @Delete("delete from type where id=#{id}")
    void delete(Integer id);

    @Update("update type set name=#{name} where id=#{id}")
    void update(Type type);

}
