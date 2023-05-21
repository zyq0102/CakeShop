<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>类目修改</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp"/>
    <h2 class="text-center">类目修改面板</h2>
    <br><br>

    <form class="form-horizontal" action="${ctx}/admin/type_update?id=${param.id}" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <div class="form-group">
            <label for="input_name" class="col-sm-1 control-label">类目名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name" name="name" value="${param.name}"
                       required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-success">提交修改</button>
            </div>
        </div>
    </form>

    <span style="color:red;"></span>

</div>
</body>
</html>