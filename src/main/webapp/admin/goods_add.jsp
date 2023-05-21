<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>商品添加</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
</head>
<body class="container-fluid">
<jsp:include page="header.jsp"/>
<h2 class="text-center">商品添加面板</h2>
<form class="form-horizontal" action="${ctx}/admin/goods_add" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">名称</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="name" name="name" required="required">
        </div>
    </div>
    <div class="form-group">
        <label for="price" class="col-sm-1 control-label">价格</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="price" name="price">
        </div>
    </div>
    <div class="form-group">
        <label for="intro" class="col-sm-1 control-label">介绍</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="intro" name="intro">
        </div>
    </div>
    <div class="form-group">
        <label for="stock" class="col-sm-1 control-label">库存</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="stock" name="stock">
        </div>
    </div>
    <div class="form-group">
        <label for="cover" class="col-sm-1 control-label">封面图片</label>
        <div class="col-sm-6">
            <input type="file" name="cover" id="cover" required="required">推荐尺寸: 500 * 500
        </div>
    </div>
    <div class="form-group">
        <label for="image1" class="col-sm-1 control-label">详情图片1</label>
        <div class="col-sm-6">
            <input type="file" name="image1" id="image1" required="required">推荐尺寸: 500 * 500
        </div>
    </div>
    <div class="form-group">
        <label for="image2" class="col-sm-1 control-label">详情图片2</label>
        <div class="col-sm-6">
            <input type="file" name="image2" id="image2" required="required">推荐尺寸: 500 * 500
        </div>
    </div>
    <div class="form-group">
        <label for="select_topic" class="col-sm-1 control-label">类目</label>
        <div class="col-sm-6">
            <select type="text" class="form-control" id="select_topic" name="type_id">
                <c:forEach var="t" items="${sessionScope.typeList}">
                    <option value="${t.id}">${t.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10">
            <button type="submit" class="btn btn-success">提交保存</button>
        </div>
    </div>
</form>
</body>
</html>
