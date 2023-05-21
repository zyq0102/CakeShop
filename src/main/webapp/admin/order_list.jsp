<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>订单管理</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp"/>
    <h2 class="text-center">订单管理面板</h2>
    <br>
    <ul role="tablist" class="nav nav-tabs">
        <li class="${status==0?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=0">全部订单</a></li>
        <li class="${status==1?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=1">未付款</a></li>
        <li class="${status==2?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=2">已付款</a></li>
        <li class="${status==3?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=3">配送中</a></li>
        <li class="${status==4?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=4">已完成</a></li>
    </ul>
    <br>

    <table class="table table-bordered table-hover">
        <tbody>
        <tr>
            <th width="5%">ID</th>
            <th width="5%">总价</th>
            <th width="15%">商品详情</th>
            <th width="20%">收货信息</th>
            <th width="10%">订单状态</th>
            <th width="10%">支付方式</th>
            <th width="10%">下单用户</th>
            <th width="10%">下单时间</th>
            <th width="10%">操作</th>
        </tr>
        <c:forEach var="o" items="${orderList.list}">
            <input type="hidden" name="uid" value="${o.user_id}">
            <tr>
                <td><p>${o.id}</p></td>
                <td><p>${o.total}</p></td>
                <td>
                    <c:forEach var="i" items="${o.itemList}">
                        <p>${i.goods.name}(${i.goods.price}) x ${i.amount}</p>
                    </c:forEach>
                </td>
                <td>
                    <p>${o.name}</p>
                    <p>${o.phone}</p>
                    <p>${o.address}</p>
                </td>
                <td>
                    <p>
                     <span style="color:red;">
                         <c:if test="${o.status==1}"><span style="color:red;">未付款</span></c:if>
                         <c:if test="${o.status==2}"><span style="color:green;">已付款</span></c:if>
                         <c:if test="${o.status==3}"><span style="color:purple;">已发货</span></c:if>
                         <c:if test="${o.status==4}"><span style="color:blue;">已完成</span></c:if>
                    </span>
                    </p>
                </td>
                <td>
                    <p>
                        <c:if test="${o.paytype==1}">
                            微信
                        </c:if>
                        <c:if test="${o.paytype==2}">
                            支付宝
                        </c:if>
                        <c:if test="${o.paytype==3}">
                            货到付款
                        </c:if>

                    </p>
                </td>
                <td><p>${o.name}</p></td>
                <td><p>${o.datetime}</p></td>
                <td>
                    <c:if test="${o.status==1||o.status==2}">
                        <a class="btn btn-success" href="${ctx}/admin/order_edit?id=${o.id}&status=3">发货</a>
                    </c:if>
                    <c:if test="${o.status==3}">
                        <a class="btn btn-primary" href="${ctx}/admin/order_edit?id=${o.id}&status=4">完成</a>
                    </c:if>
                    <a class="btn btn-danger" href="${ctx}/admin/order_delete?id=${o.id}">删除</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <br>

    <div style="text-align:center;">
        <a href="${ctx}/admin/order?status=${status}&pno=1" ${orderList.pageNum==1?'disabled':''} class="btn btn-info">首页</a>
        <a href="${ctx}/admin/order?status=${status}&pno=${orderList.pageNum-1>0?orderList.pageNum-1:1}"
           class="btn btn-info">上一页</a>
        <h3 style="display:inline;">[${orderList.pageNum}/${orderList.pages}]</h3>
        <h3 style="display:inline;">[${orderList.pages}]</h3>
        <a class="btn btn-info"
           href="${ctx}/admin/order?status=${status}&pno=${orderList.pageNum+1<orderList.pages?orderList.pageNum+1:orderList.pages}">下一页</a>
        <a class="btn btn-info" ${orderList.pageNum==orderList.pages?'disabled':''}
           href="${ctx}/admin/order?status=${status}&pno=${orderList.pages}">尾页</a>
        <input type="text" class="form-control" style="display:inline;width:60px;" value="">
        <a class="btn btn-info" href="javascript:void(0);"
           onclick='location.href="${ctx}/admin/order?status=${status}&pno="+this.previousElementSibling.value'>GO</a>
    </div>

    <br>
</div>
</body>
</html>
