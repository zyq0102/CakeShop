package com.zhouyq.cakeshop.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//UTF-8编码过滤，防止网页乱码
@WebFilter(filterName = "Filter1", urlPatterns = "/*")
public class CharSetFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        chain.doFilter(request, response);
    }
}
