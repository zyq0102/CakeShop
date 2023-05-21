package com.zhouyq.cakeshop.filter;

import com.zhouyq.cakeshop.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//拦截非法的管理员身份登录请求
//                                                拦截路径
@WebFilter(filterName = "Filter2", urlPatterns = "/admin/*")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        User user = (User) req.getSession().getAttribute("loginuser");
        if (user == null || user.getIsadmin() != 1) {
            resp.sendRedirect("../index");//转到首页
        } else chain.doFilter(request, response);
    }
}
