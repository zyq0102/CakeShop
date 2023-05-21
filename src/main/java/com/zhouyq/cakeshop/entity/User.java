package com.zhouyq.cakeshop.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;
//用户
@Data
public class User {

    @ExcelProperty(value = {"id"}, index = 0)
    private Integer id;

    @ExcelProperty(value = {"用户名"}, index = 1)
    private String username;

    @ExcelProperty(value = {"邮箱"}, index = 2)
    private String email;

    @ExcelProperty(value = {"密码"}, index = 3)
    private String password;

    @ExcelProperty(value = {"姓名"}, index = 4)
    private String name;

    @ExcelProperty(value = {"手机号"}, index = 5)
    private String phone;

    @ExcelProperty(value = {"地址"}, index = 6)
    private String address;
    @ExcelProperty(value = {"isadmin"}, index = 7)
    private Integer isadmin;
    @ExcelProperty(value = {"isvalidate"}, index = 8)
    private Integer isvalidate;
}
