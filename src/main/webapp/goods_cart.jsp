<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer.js"></script>
    <script type="text/javascript" src="${ctx}/js/cart.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="cart-items">
    <div class="container">
        <h2>我的购物车</h2>
        <%--        遍历购物车，即Order中的itemMap--%>
        <c:forEach var="item" items="${sessionScope.order.itemMap}">
            <div class="cart-header col-md-6">
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <a href="${ctx}/goods_detail?id=${item.value.goods_id}">
                            <img src="${ctx}${item.value.goods.cover}" class="img-responsive">
                        </a>
                    </div>
                    <div class="cart-item-info">
                        <h3><a href="${ctx}/goods_detail?id=${item.value.goods_id}">${item.value.goods.name}</a></h3>
                        <h3><span>单价: ¥ ${item.value.goods.price}</span></h3>
                        <h3><span>数量: ${item.value.amount}</span></h3>
                        <a class="btn btn-info" href="javascript:buy(${item.value.goods_id});">增加</a>
                        <a class="btn btn-warning" href="javascript:lessen(${item.value.goods_id});">减少</a>
                        <a class="btn btn-danger" href="javascript:deletes(${item.value.goods_id});">删除</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </c:forEach>

        <div class="cart-header col-md-12">
            <hr>
            <h3>订单总金额: ¥ ${sessionScope.order.total}</h3>
            <a class="btn btn-success btn-lg" style="margin-left:74%" href="${ctx}/order_submit.jsp">提交订单</a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
