<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>客户修改</title>
    <link rel="stylesheet" href="${ctx}/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<form class="form-horizontal" action="${ctx}/admin/user_update?id=${param.id}&pno=${param.pno}" method="post">
    <div class="form-group">
        <label for="username" class="col-sm-1 control-label">用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="username" name="username" value="${param.username}">
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-1 control-label">邮箱</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="email" name="email" value="${param.email}">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-1 control-label">收货人</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="name" name="name" value="${param.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-1 control-label">电话</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="phone" name="phone" value="${param.phone}">
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-1 control-label">地址</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="address" name="address" value="${param.address}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10">
            <button type="submit" class="btn btn-success">提交修改</button>
        </div>
    </div>
</form>
<span style="color:red;"></span>
</body>
</html>
