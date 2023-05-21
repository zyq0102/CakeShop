package com.zhouyq.cakeshop.mapper;

import com.zhouyq.cakeshop.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public interface UserMapper {
    //->IndexController->checkName()；
    //能查到用户就返回该用户信息。
    @Select("select * from user where username=#{username}")
    User checkName(String name);

    //->用户登录user_login.jsp
    @Select("select * from user where username=#{username} and password=#{password}")
    User login(User user);

    //修改用户信息
    @Update("update user set name=#{name},phone=#{phone},address=#{address} where id=#{id}")
    int update(User user);

    //仅用于修改登录密码
    @Update("update user set password=#{newPassword} where id=#{id}")
    void updatepwd(String newPassword, Integer id);

    @Insert("insert into user(username,email,password,name,phone,address,isadmin,isvalidate) values(#{username},#{email},#{password},#{name},#{phone},#{address},0,0)")
    void insert(User user);

    @Select("select * from user")
    List<User> findAll();

    @Update("update user set username=#{username},email=#{email},password=#{password},name=#{name},phone=#{phone},address=#{address},isadmin=#{isadmin},isvalidate=#{isvalidate} where id=#{id}")
    void Update(User user);

    @Select("select * from user where id=#{id}")
    User getuser(Integer id);

    @Delete("delete from user where id=#{id}")
    void delete(Integer id);

    //后台-模糊查询和组合条件查询User
    @Select({"<script>" +
            "SELECT * FROM USER WHERE 1=1 " +
            "<if test=\"username!=null and username!=''\"> AND username like CONCAT('%',#{username},'%')</if>" +
            "<if test=\"email!=null and email!=''\"> AND email like CONCAT('%',#{email},'%')</if>" +
            "<if test=\"phone!=null and phone!=''\"> AND phone like CONCAT('%',#{phone},'%')</if>" +
            "</script>"})
    List<User> getUsersByCondition(User user);
}
