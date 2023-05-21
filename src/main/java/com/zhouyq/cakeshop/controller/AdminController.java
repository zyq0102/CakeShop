package com.zhouyq.cakeshop.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.write.builder.ExcelWriterBuilder;
import com.alibaba.excel.write.builder.ExcelWriterSheetBuilder;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhouyq.cakeshop.entity.Goods;
import com.zhouyq.cakeshop.entity.Order;
import com.zhouyq.cakeshop.entity.Type;
import com.zhouyq.cakeshop.entity.User;
import com.zhouyq.cakeshop.mapper.GoodsMapper;
import com.zhouyq.cakeshop.mapper.OrderMapper;
import com.zhouyq.cakeshop.mapper.TypeMapper;
import com.zhouyq.cakeshop.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;


@RequestMapping("/admin")
@Controller
public class AdminController {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    TypeMapper typeMapper;

    @RequestMapping("type")
    public String type(Model model) {
        List<Type> typeList = typeMapper.findAll();
        model.addAttribute("typeList", typeList);
        return "admin/type_list";
    }

    @RequestMapping("type_insert")
    public String type_insert(Model model, String name) {
        Type type = new Type();
        type.setName(name);
        typeMapper.insert(type);
        return "forward:type";
    }

    @RequestMapping("type_delete")
    public String type_delete(Integer id) {
        typeMapper.delete(id);
        return "redirect:type";
    }

    @RequestMapping("type_edit")
    public String type_edit(Integer id, String name, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        return "admin/type_edit";
    }

    @RequestMapping("type_update")
    public String type_update(Integer id, String name) {
        Type type = typeMapper.getType(id);
        type.setName(name);
        typeMapper.update(type);
        return "redirect:type";
    }

    @RequestMapping("user")
    public String user(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model) {
        PageHelper.startPage(pno, 5);
        List<User> userList = userMapper.findAll();
        PageInfo pageInfo = new PageInfo<>(userList);
        model.addAttribute("userList", pageInfo);
        return "admin/user_list";
    }

    @RequestMapping("user_search")
    public String user_search(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, User user) {
        PageHelper.startPage(pno, 5);
        List<User> userList = userMapper.getUsersByCondition(user);
        PageInfo pageInfo = new PageInfo<>(userList);
        model.addAttribute("userList", pageInfo);
        model.addAttribute("user", user);
        return "admin/user_list";
    }
    //密码重置-管理员才有的权限，因此不需要验证原来密码。
    @RequestMapping("user_repass")
    public String user_repass(Model model, String newPassword, Integer id) {
        User user = userMapper.getuser(id);
            userMapper.updatepwd(newPassword, id);
            return "redirect:user";
    }

    @RequestMapping("user_update")
    public String user_update(User user, Integer pno) {
        userMapper.Update(user);
        return "redirect:user?pno=" + pno;
    }

    @RequestMapping("user_add")
    public String user_add(User user) {
        userMapper.insert(user);
        return "redirect:user";
    }

    @RequestMapping("user_delete")
    public String user_delete(Integer id, Integer pno) {
        userMapper.delete(id);
        return "redirect:user?pno=" + pno;
    }
//
//    //后台-商品分类查询
//    @RequestMapping("goods_search")
//    public String goods_recommend(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, Integer type, HttpSession session) {
//        Type type1 = new Type();
//        if (type != null && type == 0) {
//            type1.setId(0);
//            type1.setName("全部系列");
//            PageHelper.startPage(pno, 5);
//            List<Goods> goodsList = goodsMapper.goods();
//            PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
//            model.addAttribute("type", type1);
//            model.addAttribute("goodsList", goodsPageInfo);
//            session.setAttribute("typeList", typeMapper.findAll());
//            pno = goodsPageInfo.getPages();
//            model.addAttribute("pno", pno);
//            return "admin/goods_list";
//        }
//        else if (type == 1) {
//            type1.setId(1);
//            type1.setName("条幅推荐");
//            PageHelper.startPage(pno, 5);
//            List<Goods> list = goodsMapper.recommend(type);
//            PageInfo<Goods> pageInfo = new PageInfo<>(list);
//            pno = pageInfo.getPages();
//            model.addAttribute("pno", pno);
//            model.addAttribute("recommendList", pageInfo);
//            model.addAttribute("type", type1);
//            model.addAttribute("type1", type);
//            return "admin/goods_list";
//        }
//        else if (type == 2) {
//            type1.setId(2);
//            type1.setName("热销推荐");
//            PageHelper.startPage(pno, 5);
//            List<Goods> list = goodsMapper.recommend(type);
//            PageInfo<Goods> pageInfo = new PageInfo<>(list);
//            pno = pageInfo.getPages();
//            model.addAttribute("pno", pno);
//            model.addAttribute("recommendList", pageInfo);
//            model.addAttribute("type", type1);
//            model.addAttribute("type1", type);
//            return "admin/goods_list";
//        }
//        else if (type == 3) {
//            type1.setId(3);
//            type1.setName("新品推荐");
//            PageHelper.startPage(pno, 5);
//            List<Goods> list = goodsMapper.recommend(type);
//            PageInfo<Goods> pageInfo = new PageInfo<>(list);
//            pno = pageInfo.getPages();
//            model.addAttribute("pno", pno);
//            model.addAttribute("recommendList", pageInfo);
//            model.addAttribute("type", type1);
//            model.addAttribute("type1", type);
//            return "admin/goods_list";
//        }
//        return "admin/goods_list";
//    }

    //后台-商品管理（查询所有商品）
    @RequestMapping("goods")
    public String goods(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, HttpSession session) {
        Type type1 = new Type();
        type1.setId(0);
        type1.setName("全部系列");
        PageHelper.startPage(pno, 8);
        List<Goods> goodsList = goodsMapper.goods();
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        model.addAttribute("type", type1);
        model.addAttribute("goodsList", goodsPageInfo);
        session.setAttribute("typeList", typeMapper.findAll());
        pno = goodsPageInfo.getPages();
        model.addAttribute("pno", pno);
        return "admin/goods_list";
    }

    //后台-商品管理（分类别查询）
    @RequestMapping("goods_recommend")
    public String goods_recommend(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, Integer type) {
        Type type1 = new Type();
        if (type == 1) {
            type1.setId(1);
            type1.setName("条幅推荐");
        }
        if (type == 2) {
            type1.setId(2);
            type1.setName("热销推荐");
        }
        if (type == 3) {
            type1.setId(3);
            type1.setName("新品推荐");
        }
        PageHelper.startPage(pno, 5);
        List<Goods> list = goodsMapper.recommend(type);
        PageInfo<Goods> pageInfo = new PageInfo<>(list);
        pno = pageInfo.getPages();
        model.addAttribute("pno", pno);
        model.addAttribute("recommendList", pageInfo);
        model.addAttribute("type", type1);
        model.addAttribute("type1", type);
        return "admin/goods_recommend";
    }

    //新增商品（包括照片文件的上传）
    @RequestMapping("goods_add")
    public String upload(MultipartFile cover, MultipartFile image1, MultipartFile image2, String name, Float price, String intro, Integer stock, Integer type_id, HttpSession session) {
        /*
    文件不能为空
     */
        Goods g = new Goods();
        g.setName(name);
        g.setPrice(price);
        g.setStock(stock);
        g.setIntro(intro);
        g.setType_id(type_id);
        if (cover.isEmpty() || image1.isEmpty() || image2.isEmpty()) {
            System.out.println("文件不能为空");
            return "fileerror";
        }
        /*
        为映射数据库和保存地址准备
         */
        String filePath = session.getServletContext().getRealPath("/picture/");
        String fileName = cover.getOriginalFilename();//获取文件名
        String fileName1 = image1.getOriginalFilename();//获取文件名
        String fileName2 = image2.getOriginalFilename();//获取文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));//获取后缀名
        String suffixName1 = fileName1.substring(fileName1.lastIndexOf("."));//获取后缀名
        String suffixName2 = fileName2.substring(fileName2.lastIndexOf("."));//获取后缀名
        //String filePath="E://Idea workspace//demoweb2//src//main//resources//static//images//image//";

        fileName = UUIDUtil.generateUUID() + suffixName;//新图片名
        fileName1 = UUIDUtil.generateUUID() + suffixName1;//新图片名
        fileName2 = UUIDUtil.generateUUID() + suffixName2;//新图片名

        g.setCover("/picture/" + fileName);
        g.setImage1("/picture/" + fileName1);
        g.setImage2("/picture/" + fileName2);
        File dest = new File(filePath + fileName); //创建新文件
        File dest1 = new File(filePath + fileName1); //创建新文件
        File dest2 = new File(filePath + fileName2); //创建新文件

        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
            dest1.getParentFile().mkdirs();
            dest2.getParentFile().mkdirs();
        }
        try {
            cover.transferTo(dest); //保存图片
            image1.transferTo(dest1);
            image2.transferTo(dest2);
        } catch (IOException e) {
            e.printStackTrace();
        }
        goodsMapper.insert(g);

        PageHelper.startPage(1, 8);
        List<Goods> list = goodsMapper.findAll();
        PageInfo<Goods> page = new PageInfo<>(list);
        return "redirect:goods?pno=" + page.getPages();
    }

    @RequestMapping("goods_delete")
    public String goods_delete(Integer id, Integer pno) {
        goodsMapper.delete(id);
        return "redirect:goods?pno=" + pno;
    }

    @RequestMapping("goods_edit")
    public String good_edit(Model model, Integer pno, Integer id, Integer type) {
        Goods good = goodsMapper.getGoods(id);
        model.addAttribute("good", good);
        model.addAttribute("pno", pno);
        model.addAttribute("type", type);
        return "admin/goods_edit";
    }

    //商品信息修改（包括照片上传）
    @RequestMapping("goods_update")
    public String goods_update(Goods g, MultipartFile cover1, MultipartFile image11, MultipartFile image21, HttpSession session) {
        String filePath = session.getServletContext().getRealPath("/picture/");
        if (!cover1.isEmpty()) {
            String fileName = cover1.getOriginalFilename();//获取文件名
            String suffixName = fileName.substring(fileName.lastIndexOf("."));//获取后缀名
            fileName = UUIDUtil.generateUUID() + suffixName;//新图片名
            g.setCover("/picture/" + fileName);//设置新图片的路径和名称

            File dest = new File(filePath + fileName);//创建新文件
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            try {
                cover1.transferTo(dest);//保存图片

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!image11.isEmpty()) {
            String fileName1 = image11.getOriginalFilename();//获取文件名
            String suffixName1 = fileName1.substring(fileName1.lastIndexOf("."));//获取后缀名
            fileName1 = UUIDUtil.generateUUID() + suffixName1;//新图片名
            g.setImage1("/picture/" + fileName1);//设置新图片的路径和名称

            File dest1 = new File(filePath + fileName1);//创建新文件
            if (!dest1.getParentFile().exists()) {
                dest1.getParentFile().mkdirs();
            }
            try {
                image11.transferTo(dest1);//保存图片
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!image21.isEmpty()) {
            String fileName2 = image21.getOriginalFilename();//获取文件名
            String suffixName2 = fileName2.substring(fileName2.lastIndexOf("."));//获取后缀名
            fileName2 = UUIDUtil.generateUUID() + suffixName2;//新图片名
            g.setImage2("/picture/" + fileName2);//设置新图片的路径和名称

            File dest2 = new File(filePath + fileName2);//创建新文件
            if (!dest2.getParentFile().exists()) {
                dest2.getParentFile().mkdirs();
            }
            try {
                image21.transferTo(dest2);//保存图片
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        goodsMapper.update(g);
        PageHelper.startPage(1, 5);
        List<Goods> list = goodsMapper.findAll();
        PageInfo<Goods> page = new PageInfo<>(list);
        return "redirect:goods?pno=" + page.getPages();
    }

    //某一具体商品推荐类别的添加删除[recommend]
    @RequestMapping("add")
    public String add(Model model, Integer typeTarget, Integer id, Integer type, Integer pno) {
        goodsMapper.addRecommend(typeTarget, id);
        model.addAttribute("type", type);
        return "redirect:goods?type=" + type;
    }

    //某一具体商品推荐类别的添加删除[recommend]
    @RequestMapping("remove")
    public String remove(Model model, Integer typeTarget, Integer id, Integer type, Integer pno) {
        goodsMapper.deleteRecommend(typeTarget, id);
        model.addAttribute("type", type);
        return "redirect:goods?type=" + type;
    }

    //导出用户信息到Excel表格
    @GetMapping("export")
    public void exportExcel(HttpServletResponse response) throws IOException {
        //1、设定响应类型
        response.setContentType("application/vnd.ms-excel");
        //2、设定附件的打开方法为：下载，并指定文件名称为 用户列表.xlsx
        response.setHeader("content-disposition", "attachment;filename=User.xlsx");
        //3、、创建工作簿
        ExcelWriterBuilder writeWork = EasyExcel.write(response.getOutputStream(), User.class);
        //4、创建表格
        ExcelWriterSheetBuilder sheet = writeWork.sheet();
        //5、调用业务层获取数据
        List<User> list;
        list = userMapper.findAll();
        //6、写入数据到表格中
        sheet.doWrite(list);
    }

    //订单管理中：
    //订单管理
    @RequestMapping("order")
    public String order(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, Integer status) {
        List<Order> orderList = null;
        if (status == null || status == 0) {//全部订单
            PageHelper.startPage(pno, 5);
            orderList = orderMapper.findAll();
        } else {//根据状态查询订单
            PageHelper.startPage(pno, 5);
            orderList = orderMapper.findBystatus(status);
        }
        PageInfo pageInfo = new PageInfo<>(orderList);
        model.addAttribute("orderList", pageInfo);
        model.addAttribute("status", status);
        return "admin/order_list";
    }

    //订单删除
    @RequestMapping("order_delete")
    public String order_delete(Integer id) {
        orderMapper.deleteOrder(id);
        orderMapper.deleteOrderitem(id);
        return "redirect:order";
    }

    //订单修改
    @RequestMapping("order_edit")
    public String order_edit(Integer status, Integer id) {
        orderMapper.orderUpdate(status, id);
        return "redirect:order?status=" + status;
    }
}