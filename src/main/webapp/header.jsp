<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="header">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 class="navbar-brand"><a href="${ctx}/index"></a></h1>
            </div>
            <!--navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${ctx}/index" class="${param.flag==1?'active':''}">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle ${param.flag==2?'active':''}" data-toggle="dropdown">商品分类<b
                                class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-2">
                            <li>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4>商品分类</h4>
                                        <ul class="multi-column-dropdown">
                                            <li><a class="list" href="${ctx}/goods_list?typeid=0">全部系列</a></li>
                                            <c:forEach var="t" items="${sessionScope.typeList}">
                                                <li><a class="list"
                                                       href="${ctx}/goods_list?typeid=${t.id}">${t.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li><a href="${ctx}/recommend?type=2" class="${param.flag==3?'active':''}">热销</a></li>
                    <li><a href="${ctx}/recommend?type=3" class="${param.flag==4?'active':''}">新品</a></li>
                    <c:if test="${empty sessionScope.loginuser}">
                        <li><a href="${ctx}/user_register.jsp" class="${param.flag==5?'active':''}">注册</a></li>
                        <li><a href="${ctx}/user_login.jsp" class="${param.flag==6?'active':''}">登录</a></li>

                    </c:if>
                    <c:if test="${not empty sessionScope.loginuser}">
                        <li><a href="${ctx}/order_list" class="${param.flag==8?'active':''}">我的订单</a></li>
                        <li><a href="${ctx}/user_center.jsp" class="${param.flag==7?'active':''}">个人中心</a></li>
                        <li><a href="${ctx}/logout" class="${param.flag==6?'active':''}">退出登录</a></li>
                    </c:if>
                    <c:if test="${sessionScope.loginuser.isadmin==1}">
                        <li><a href="${ctx}/admin/index.jsp">后台管理</a></li>
                    </c:if>
                </ul>
                <!--/.navbar-collapse-->
            </div>
            <!--//navbar-header-->
        </nav>
        <div class="header-info">
            <div class="header-right search-box">
                <a href="javascript:"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
                <%--                模糊查询:GoodsMapper、 --%>
                <div class="search">
                    <form class="navbar-form" action="${ctx}/goods_search">
                        <input type="text" class="form-control" name="keyword">
                        <button type="submit" class="btn btn-default " aria-label="Left Align">搜索</button>
                    </form>
                </div>
            </div>
            <div class="header-right cart">
                <a href="${ctx}/goods_cart.jsp">
                    <span class="glyphicon glyphicon-shopping-cart " aria-hidden="true"><span
                            class="card_num">${sessionScope.order.amount}</span></span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
