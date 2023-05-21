<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>商品详情页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <link rel="stylesheet" href="${ctx}/layer/theme/default/layer.css">
    <link rel="stylesheet" href="${ctx}/css/flexslider.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer.js"></script>
    <script type="text/javascript" src="${ctx}/js/cart.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.flexslider.js"></script>
    <script>
        $(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp?flag=2"/>
<div class="single">
    <div class="container">
        <div class="single-grids">
            <div class="col-md-4 single-grid">
                <div class="flexslider">
                    <ul class="slides">
                        <li data-thumb="${ctx}${good.cover}">
                            <div class="thumb-image"><img src="${ctx}${good.cover}" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                        <li data-thumb="${ctx}${good.image1}">
                            <div class="thumb-image"><img src="${ctx}${good.image1}" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                        <li data-thumb="${ctx}${good.image2}">
                            <div class="thumb-image"><img src="${ctx}${good.image2}" data-imagezoom="true"
                                                          class="img-responsive"></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 single-grid simpleCart_shelfItem">
                <h3>${good.name}</h3>
                <div class="tag">
                    <p>分类 : <a href="${ctx}/goods_list?typeid=${good.type_id}">${good.typename}</a></p>
                </div>
                <p>${good.intro}</p>
                <div class="galry">
                    <div class="prices">
                        <h5 class="item_price">¥ ${good.price}</h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="btn_form">
                    <%--                                                                        buy()在cart.js中，把good.id传送其中--%>
                    <a href="javascript:;" class="add-cart item_add" onclick="buy(${good.id})">加入购物车</a>
                </div>
            </div>
            <div class="col-md-4 single-grid1">
                <!-- <h2>商品分类</h2> -->
                <ul>
                    <li><a href="${ctx}/goods_list?typeid=0">全部系列</a></li>
                    <c:forEach var="t" items="${sessionScope.typeList}">
                        <li><a href="${ctx}/goods_list?typeid=${t.id}">${t.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
