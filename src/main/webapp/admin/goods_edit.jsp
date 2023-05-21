<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>商品编辑</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container-fluid">

    <jsp:include page="header.jsp"/>
    <h2 class="text-center">商品修改面板</h2>
    <br>
    <form class="form-horizontal" action="${ctx}/admin/goods_update?id=${good.id}" method="post"
          enctype="multipart/form-data">
        <%--        隐藏域，显示旧值--%>
        <input type="hidden" name="id" value="${good.id}">
        <input type="hidden" name="cover" value="${good.cover}">
        <input type="hidden" name="image1" value="${good.image1}">
        <input type="hidden" name="image2" value="${good.image2}">
        <input type="hidden" name="pno" value="${pno}">
        <input type="hidden" name="type1" value="${type}">

        <div class="form-group">
            <label class="col-sm-1 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="name" value="${good.name}" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="price" value="${good.price}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">介绍</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="intro" value="${good.intro}">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name" class="col-sm-1 control-label">库存</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name" name="stock" value="${good.stock}">
            </div>
        </div>
        <div class="form-group">
            <label for="input_file" class="col-sm-1 control-label">封面图片</label>
            <div class="col-sm-6"><img src="../${good.cover}" width="100" height="100">
                <input type="file" name="cover1" id="input_file">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="input_file1" class="col-sm-1 control-label">详情图片1</label>
            <div class="col-sm-6"><img src="../${good.image1}" width="100" height="100">
                <input type="file" name="image11" id="input_file1">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="input_file2" class="col-sm-1 control-label">详情图片2</label>
            <div class="col-sm-6"><img src="../${good.image2}" width="100" height="100">
                <input type="file" name="image21" id="input_file2">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="select_topic" class="col-sm-1 control-label">类目</label>
            <div class="col-sm-6">
                <select type="text" class="form-control" id="select_topic" name="type_id">
                    <c:forEach var="t" items="${sessionScope.typeList}">
                        <option value="${t.id}" ${t.id==good.type_id?"selected":""}>${t.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-success">提交修改</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
