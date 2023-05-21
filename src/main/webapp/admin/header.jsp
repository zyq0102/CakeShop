<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">蛋糕商城后台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/admin/order?status=0">订单管理</a></li>
                <li><a href="${ctx}/admin/user">客户管理</a></li>
                <li><a href="${ctx}/admin/goods">商品管理</a></li>
                <li><a href="${ctx}/admin/type">类目管理</a></li>
                <li><a href="${ctx}/index">蛋糕商城前台首页</a></li>
                <li><a href="${ctx}/logout">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>
