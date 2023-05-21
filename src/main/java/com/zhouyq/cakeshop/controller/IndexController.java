package com.zhouyq.cakeshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;
import com.zhouyq.cakeshop.entity.*;
import com.zhouyq.cakeshop.mapper.GoodsMapper;
import com.zhouyq.cakeshop.mapper.OrderMapper;
import com.zhouyq.cakeshop.mapper.TypeMapper;
import com.zhouyq.cakeshop.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    TypeMapper typeMapper;
    @Autowired
    OrderMapper orderMapper;

    @RequestMapping("index")
    public String index(Model model, HttpSession session) {
        List<Recommend> bannergoodslist = goodsMapper.getAllRecommends(1);
        List<Recommend> hotgoodslist = goodsMapper.getAllRecommends(2);
        List<Recommend> newgoodslist = goodsMapper.getAllRecommends(3);
        model.addAttribute("bannergoodslist", bannergoodslist);
        model.addAttribute("hotgoodslist", hotgoodslist);
        model.addAttribute("newgoodslist", newgoodslist);
        session.setAttribute("typeList", typeMapper.findAll());
        return "index";
    }

    //用户登录-有验证码：IndexController[login]->
    @RequestMapping("/login")
    public String test(Model model, User user, HttpServletRequest request, HttpSession session, String verifyCode) {
//        //如果表单提交填入的验证码为空
//        if (StringUtils.isEmpty(verifyCode)) {
//            model.addAttribute("failMsg1", "验证码不能为空");
//            return "user_login";
//        }
        String kaptchaCode = (String) request.getSession().getAttribute("verifyCode");
        if (!(verifyCode.toLowerCase()).equals(kaptchaCode)) {
            model.addAttribute("failMsg1", "验证码有误，请重新输入！");
            return "user_login";
        } else {
            User user1 = userMapper.login(user);
            if (user1 != null) {
                session.setAttribute("loginuser", user1);
                return "user_center";
            } else
                model.addAttribute("msg", "用户名或密码错误，请重新登录！");
            return "user_login";
        }
    }
    //验证码刷新
    @GetMapping("/kaptcha")
    public void defaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/gif");

        // 三个参数分别为宽、高、位数
        SpecCaptcha captcha = new SpecCaptcha(150, 30, 4);

        // 设置字体
        captcha.setCharType(Captcha.FONT_9);

        // 验证码存入session
        httpServletRequest.getSession().setAttribute("verifyCode", captcha.text().toLowerCase());

        // 输出图片流
        captcha.out(httpServletResponse.getOutputStream());
    }


//    //用户登录(无验证码)：IndexController[login]->
//    @RequestMapping("login")
//    public String login(Model model, User user, HttpSession session) {
//        User user1 = userMapper.login(user);
//        if (user1 != null) {
//            session.setAttribute("loginuser", user1);
//            return "user_center";
//        } else
//            model.addAttribute("msg", "用户名或密码错误，请重新登录！");
//        return "user_login";
//    }

    //用户登出
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginuser");
        session.invalidate();
        return "index";
    }

    //修改用户信息->UserMapper
    @RequestMapping("changeuser")
    public String changeuser(String name, String address, String phone, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginuser");
        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);
        int r = userMapper.update(user);
        if (r > 0)
            model.addAttribute("msg", "收货信息修改成功！");
        else
            model.addAttribute("failMsg", "收货信息修改失败");
        return "user_center";
    }

    //仅仅用于修改密码（旧密码验证成功的前提下）
    @RequestMapping("changepwd")
    public String changepwd(String password, String newPassword, Integer id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginuser");
        if (password.equals(user.getPassword())) {
            userMapper.updatepwd(newPassword, user.getId());
            model.addAttribute("msg_pwd", "修改成功，请重新登录！");
            return "user_login";
        } else
            model.addAttribute("failMsg", "修改失败,请检查原密码是否正确");
        return "user_center";
    }

    //    user_register.jsp->
    @RequestMapping("register")
    public String register(User user, Model model) {
        userMapper.insert(user);
        model.addAttribute("msg", "注册成功!");
        return "user_register";
    }

    //商品分类-goods_list.jsp
    @RequestMapping("goods_list")
    public String goods_list(Integer typeid, Model model, @RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno) {
        Type type = new Type();
        if (typeid != null && typeid == 0) {//显示所有商品（typeid默认是0）
            type.setId(0);
            type.setName("所有商品");//展示在JSP的导航栏下方
            PageHelper.startPage(pno, 8);
            List<Goods> goodsList = goodsMapper.findAll();
            PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
            model.addAttribute("goodsPageInfo", goodsPageInfo);
        } else {//根据商品类别查询商品（根据typeid查询）
            PageHelper.startPage(pno, 8);//每次分类显示之前先做分页
            List<Goods> goodsList = goodsMapper.getGoodsList(typeid);
            PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
            model.addAttribute("goodsPageInfo", goodsPageInfo);
            type = typeMapper.getType(typeid);
        }
        model.addAttribute("type", type);
        model.addAttribute("typeid", typeid);
        return "goods_list";
    }

    @RequestMapping("recommend")
    public String recommend(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, Model model, Integer type) {
        Type type1 = new Type();
        PageHelper.startPage(pno, 8);
        List<Recommend> list = goodsMapper.getAllRecommends(type);
        PageInfo<Recommend> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo", pageInfo);
        if (type == 2) {
            type1.setId(2);
            type1.setName("热销推荐");
        }
        if (type == 3) {
            type1.setId(3);
            type1.setName("新品推荐");
        }
        model.addAttribute("type", type1);
        return "goods_list1";
    }

    @RequestMapping("goods_detail")
    public String goods_detail(Integer id, Model model) {
        Goods good = goodsMapper.getGoods(id);
        model.addAttribute("good", good);
        return "goods_detail";
    }

    //order_list.jsp 查看订单
    @RequestMapping("order_list")
    public String order_list(Model model, @RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, HttpSession session) {
        User user = (User) session.getAttribute("loginuser");
        PageHelper.startPage(pno, 5);
        List<Order> orderList = orderMapper.getOrderByUser_id(user.getId());
        PageInfo<Order> orderPageInfo = new PageInfo<>(orderList);
        model.addAttribute("orderPageInfo", orderPageInfo);
        return "order_list";
    }

    @RequestMapping("order_delete")
    public String order_delete(Integer id) {
        orderMapper.deleteOrder(id);
        orderMapper.deleteOrderitem(id);
        return "redirect:order_list";
    }

    @RequestMapping("order_pay")
    public String order_pay(Integer id) {
        orderMapper.pay(id);
        return "redirect:order_list";
    }

    //header.jsp中的模糊查询商品搜索 独立于上方的goods_list
    @RequestMapping("goods_search")
    public String searchGoods(@RequestParam(value = "pno", defaultValue = "1", required = true) Integer pno, String keyword, Model model) {
        List<Goods> goodsList;
        PageHelper.startPage(pno, 8);
        goodsList = goodsMapper.searchGoods(keyword);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        model.addAttribute("goodsPageInfo", goodsPageInfo);
        model.addAttribute("keyword", keyword);//搜索关键词
        return "goods_search";
    }

    //购买商品（购物车->提交订单)
    @RequestMapping("goods_buy")
    @ResponseBody
    public String goods_buy(HttpSession session, String action, Integer goodsid) {
        Order o = (Order) session.getAttribute("order");//从session中获取购物车，初次为空
        Goods good = goodsMapper.getGoods(goodsid);
        //添加商品
        if ("add".equals(action)) {
            if (o == null) {//购物车中如果没有添加过商品，先新建一个
                o = new Order();
            }
            //如果还有库存
            if (good.getStock() > 0) {
                o.addGoods(good);
                good.setStock(good.getStock() - 1);//更改库存
                goodsMapper.updateStock(good);
                session.setAttribute("order", o);  //更新共享购物车，其实是o.itemMap
                return "ok";
            } else {//如果没有库存
                return "fail";
            }
        }
        //减少商品
        else if ("lessen".equals(action)) {
            o.lessenGoods(good.getId());
            good.setStock(good.getStock() + 1);
            goodsMapper.updateStock(good);
            session.setAttribute("order", o); //更新共享购物车，其实是o.itemMap
            return "ok";
        }
        //删除商品
        else {
            o.deleteGoods(good.getId());
            good.setStock(good.getStock() + o.getAmount());
            goodsMapper.updateStock(good);
            session.setAttribute("order", o); //更新共享购物车，其实是o.itemMap
            return "ok";
        }
    }


    //order_submit.jsp->提交订单(order_confirm)->OrderMapper(插入订单、插入订单详情) （对应Order、Order_item数据库）
    @RequestMapping("order_confirm")
    public String order_confirm(Model model, HttpSession session, String name, String phone, String address, Integer paytype) {
        User user = (User) session.getAttribute("loginuser");
        Order order = (Order) session.getAttribute("order");
        //完善order信息，更新收件信息
        order.setName(name);
        order.setPhone(phone);
        order.setAddress(address);
        order.setPaytype(paytype);

        if (paytype == 1 || paytype == 2) {
            order.setStatus(2);
        } else {
            order.setStatus(1);
        }
        order.setUser_id(user.getId());
        orderMapper.insertOrder(order);

        for (OrderItem item : order.getItemMap().values()) { //遍历OrderItem，反复插入订单详情
            item.setOrder_id(order.getId());//给订单详情添加order_id外键，maxId()用来获取最新的id
            orderMapper.insertOrderItem(item);//向数据库中添加一个订单详情
        }
        model.addAttribute("msg", "订单提交成功！");
        session.removeAttribute("order");//删除已经提交完成的订单
        return "order_success";
    }

    //检查注册页面中用户名是否重复(Ajax)
    @RequestMapping("checkName")
    @ResponseBody
    public String checkName(String username) {
        //checkName方法定义在UserMapper中
        User user = userMapper.checkName(username);
        if (user != null) {
            //说明数据库已经有该用户姓名的用户，会将信息传递给user_register.jsp->Ajax（getResult中的data）
            return "0";
        } else
            //说明数据库没有该用户姓名的用户，会将信息传递给user_register.jsp->Ajax（getResult中的data）
            return "1";
    }


}
