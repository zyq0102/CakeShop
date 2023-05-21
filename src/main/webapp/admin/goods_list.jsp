<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>商品分类管理</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<h2 class="text-center">商品分类管理面板</h2>
<div class="container-fluid">
    <div class="text-left"><a class="btn btn-default" href="${ctx}/admin/goods_add.jsp">添加商品</a></div>
    <br>
    <ul role="tablist" class="nav nav-tabs">
        <li class="${type.id==0?"active":""}" role="presentation"><a href="${ctx}/admin/goods?type=0">全部商品</a>
        <li class="${type.id==1?"active":""}" role="presentation"><a href="${ctx}/admin/goods_recommend?type=1">条幅推荐</a>
        <li class="${type.id==2?"active":""}" role="presentation"><a href="${ctx}/admin/goods_recommend?type=2">热销推荐</a>
        <li class="${type.id==3?"active":""}" role="presentation"><a href="${ctx}/admin/goods_recommend?type=3">新品推荐</a>
    </ul>
    <br>
    <table class="table table-bordered table-hover">
        <tbody>
        <tr>
            <th width="5%">ID</th>
            <th width="10%">图片</th>
            <th width="10%">名称</th>
            <th width="20%">介绍</th>
            <th width="10%">价格</th>
            <th width="10%">类目</th>
            <th width="25%">操作</th>
        </tr>
        <c:forEach var="g" items="${goodsList.list}">
            <tr>
                <td><p>${g.id}</p></td>
                <td><p><a href="${ctx}/goods_detail?id=${g.id}" target="_blank">
                    <img src="${ctx}${g.cover}" width="100px" height="100px"></a></p></td>
                <td><p><a href="${ctx}/goods_detail?id=${g.id}" target="_blank">${g.name}</a></p></td>
                <td><p>${g.intro}</p></td>
                <td><p>${g.price}</p></td>
                <td><p>${g.typename}</p></td>
                <td>
                    <p>
                            <%--     依靠 Goods实体类中的 recomm 判断是否属于各个类别 recomm来自GoodsMapper中查询语句别名--%>
                        <c:if test="${g.recomm==1}">
                            <a class="btn btn-info"
                               href="${ctx}/admin/remove?id=${g.id }&typeTarget=1&pno=${pno}&type=${type.id}">移出条幅</a>
                        </c:if>
                        <c:if test="${g.recomm!=1}">
                            <a class="btn btn-primary"
                               href="${ctx}/admin/add?id=${g.id }&typeTarget=1&pno=${pno}&type=${type.id}">加入条幅</a>
                        </c:if>
                            <%--热销 --%>
                        <c:if test="${g.recomm==2}">
                            <a class="btn btn-info"
                               href="${ctx}/admin/remove?id=${g.id }&typeTarget=2&pno=${pno}&type=${type.id}">移出热销</a>
                        </c:if>
                        <c:if test="${g.recomm!=2}">
                            <a class="btn btn-primary"
                               href="${ctx}/admin/add?id=${g.id }&typeTarget=2&pno=${pno}&type=${type.id}">加入热销</a>
                        </c:if>
                            <%--新品 --%>
                        <c:if test="${g.recomm==3}">
                            <a class="btn btn-info"
                               href="${ctx}/admin/remove?id=${g.id }&typeTarget=3&pno=${pno}&type=${type.id}">移出新品</a>
                        </c:if>
                        <c:if test="${g.recomm!=3}">
                            <a class="btn btn-primary"
                               href="${ctx}/admin/add?id=${g.id }&typeTarget=3&pno=${pno}&type=${type.id}">加入新品</a>
                        </c:if>
                    </p>
                    <a class="btn btn-success"
                       href="${ctx}/admin/goods_edit?id=${g.id}&pno=${pno}&type=${type.id}">修改</a>
                    <a class="btn btn-danger"
                       href="${ctx}/admin/goods_delete?id=${g.id}&pno=${pno}&type=${type.id}">删除</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <tr>
        <div style="text-align:center">
            <a class="btn btn-info" href="${ctx}/admin/goods?type=${type.id}&pno=1">首页</a>
            <a class="btn btn-info"
               href="${ctx}/admin/goods?type=${type.id}&pno=${goodsList.pageNum-1>0?goodsList.pageNum-1:1}">上一页</a>
            <h3 style="display:inline;">[${goodsList.pageNum}/${goodsList.pages}]</h3>
            <a class="btn btn-info"
               href="${ctx}/admin/goods?type=${type.id}&pno=${goodsList.pageNum+1<goodsList.pages?goodsList.pageNum+1:goodsList.pages}">下一页</a>
            <a class="btn btn-info" href="${ctx}/admin/goods?type=${type.id}&pno=${goodsList.pages}">尾页</a>
            <input type="text" class="form-control" style="display:inline;width:60px;" value="">
            <a class="btn btn-info" href="javascript:void(0);"
               onclick='location.href="${ctx}/admin/goods?type=${type.id}&pno="+this.previousElementSibling.value'>GO</a>
        </div>
    </tr>
    <br><br>
</div>
</body>
</html>
