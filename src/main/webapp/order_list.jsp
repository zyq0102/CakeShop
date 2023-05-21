<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>列表</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <link rel="stylesheet" href="${ctx}/layer/theme/default/layer.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer.js"></script>
    <script type="text/javascript" src="${ctx}/js/cart.js"></script>
</head>
<body>
<jsp:include page="header.jsp?flag=8"/>
<div class="cart-items">
    <div class="container">
        <h2>我的订单</h2>
        <table class="table table-bordered table-hover">
            <tbody>
            <tr>
                <th width="10%">ID</th>
                <th width="10%">总价</th>
                <th width="20%">商品详情</th>
                <th width="30%">收货信息</th>
                <th width="10%">订单状态</th>
                <th width="10%">支付方式</th>
                <th width="10%">下单时间</th>
                <th width="10%">操作</th>
            </tr>
            <c:forEach var="order" items="${orderPageInfo.list}">
                <tr>
                    <td><p>${order.id}</p></td>
                    <td><p>${order.total}</p></td>
                    <td>
                        <%--一对多的联表查询：一个Order，多个Order_item--%>
                        <c:forEach var="i" items="${order.itemList}">
                            <p>${i.goods.name}(${i.goods.price}) x ${i.amount}</p>
                        </c:forEach>
                    </td>
                    <td>
                        <p>${order.name}</p>
                        <p>${order.phone}</p>
                        <p>${order.address}</p>
                    </td>
                    <td>
                        <p>
                        <span style="color:red;">
                            <c:if test="${order.status==1}"><span style="color:red;">未付款</span></c:if>
                            <c:if test="${order.status==2}"><span style="color:green;">已付款</span></c:if>
                            <c:if test="${order.status==3}"><span style="color:purple;">已发货</span></c:if>
                            <c:if test="${order.status==4}"><span style="color:blue;">已完成</span></c:if>
                        </span>
                        </p>
                    </td>
                    <td>
                        <p>
                            <c:if test="${order.paytype==1}">
                                微信
                            </c:if>
                            <c:if test="${order.paytype==2}">
                                支付宝
                            </c:if>
                        </p>
                    </td>
                    <td><p>${order.datetime}</p></td>
                    <td>
                        <c:if test="${order.status==1}">
                            <p><a href="${ctx}/order_pay?id=${order.id}" class="btn btn-default">付款</a></p>
                        </c:if>
                        <p><a href="${ctx}/order_delete?id=${order.id}" onclick='return confirm("确定删除?");'
                              class="btn btn-default">删除订单</a></p>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="text-align:center;">
            <a class="btn btn-info" href="${ctx}/order_list?pno=1">首页</a>
            <a class="btn btn-info" ${orderPageInfo.pageNum==1?'disabled':''}
               href="${ctx}/order_list?pno=${orderPageInfo.pageNum-1}">上一页</a>
            <h3 style="display:inline;">[${orderPageInfo.pageNum}/${orderPageInfo.pages}]</h3>
            <a class="btn btn-info" ${orderPageInfo.pageNum==orderPageInfo.pages?'disabled':''}
               href="${ctx}/order_list?pno=${orderPageInfo.pageNum+1}">下一页</a>
            <a class="btn btn-info" href="${ctx}/order_list?pno=${orderPageInfo.pages}">尾页</a>
            <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info"
                                                                                                   href="javascript:void(0);"
                                                                                                   onclick='location.href="${ctx}/order_list?pno="+(this.previousSibling.value)'>GO</a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
