<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${type.name}-商品分类</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <link rel="stylesheet" href="${ctx}/layer/theme/default/layer.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer.js"></script>
    <script type="text/javascript" src="${ctx}/js/cart.js"></script>
</head>
<body>
<c:if test="${type.id>=0}">
    <jsp:include page="header.jsp?flag=2"/>
</c:if>
<div class="products">
    <div class="container">
        <h2>${type.name} </h2>
        <div class="col-md-12 product-model-sec">
            <c:forEach var="g" items="${goodsPageInfo.list}">
                <div class="product-grid">
                    <a href="${ctx}/goods_detail?id=${g.id}">
                        <div class="more-product"><span> </span></div>
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <img src="${ctx}${g.cover}" class="img-responsive" alt="${g.name}" width="240" height="240">
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <button href="${ctx}/goods_detail?id=${g.id}">查看详情</button>
                                </h4>
                            </div>
                        </div>
                    </a>
                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <h4>${g.name}</h4>
                            <span class="item_price">¥ ${g.price}</span>
                            <input type="button" class="item_add items" value="加入购物车" onclick="buy(${g.id})">
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="text-align:center;">
            <a class="btn btn-info" href="${ctx}/goods_list?typeid=${type.id}&pno=1">首页</a>
            <a class="btn btn-info" href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pageNum-1}">上一页</a>
            <h3 style="display:inline;">[${goodsPageInfo.pageNum}/${goodsPageInfo.pages}]<%--当前页/总页码--%>
                <a class="btn btn-info"
                   href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pageNum+1}">下一页</a>
                <a class="btn btn-info" href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pages}">尾页</a>
                <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a
                        class="btn btn-info" href="javascript:void(0);"
                        onclick='location.href="${ctx}/goods_list?typeid=${type.id}&pno="+(this.previousSibling.value)'>GO</a>
        </div>
    </div>

    <%--    <div style="text-align:center;">--%>
    <%--        <a class="btn btn-info" href="${ctx}/goods_list?typeid=${type.id}&pno=1">首页</a>--%>
    <%--        <a class="btn btn-info" ${goodsPageInfo.pageNum==1?'disabled':''} href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pageNum-1}">上一页</a>--%>
    <%--        <h3 style="display:inline;">[${goodsPageInfo.pageNum}/${goodsPageInfo.pages}]</h3>--%>
    <%--        <a class="btn btn-info" ${goodsPageInfo.pageNum==goodsPageInfo.pages?'disabled':''} href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pageNum+1}">下一页</a>--%>
    <%--        <a class="btn btn-info" href="${ctx}/goods_list?typeid=${type.id}&pno=${goodsPageInfo.pages}">尾页</a>--%>
    <%--        <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info" href="javascript:void(0);" onclick='location.href="${ctx}/goods_list?typeid=${type.id}&pno="+(this.previousSibling.value)'>GO</a>--%>
    <%--    </div>--%>
    <%--</div>--%>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
