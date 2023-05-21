<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>类目管理</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<h2 class="text-center">类目管理面板</h2>
<div class="container-fluid">
    <div>
        <form class="form-inline" method="post" action="${ctx}/admin/type_insert">
            <input type="text" class="form-control" id="input_name" name="name" placeholder="输入类目名称"
                   required="required">
            <input type="submit" class="btn btn-default" value="添加类目">
        </form>
    </div>
    <br>
    <br>
    <table class="table table-bordered table-hover">
        <tbody>
        <tr>
            <th width="5%">ID</th>
            <th width="10%">名称</th>
            <th width="10%">操作</th>
        </tr>
        <c:forEach var="t" items="${typeList}">
            <tr>
                <td><p>${t.id}</p></td>
                <td><p>${t.name}</p></td>
                <td>
                    <a class="btn btn-primary" href="${ctx}/admin/type_edit.jsp?id=${t.id}&name=${t.name}">修改</a>
                    <a class="btn btn-danger" href="${ctx}/admin/type_delete?action=delete&id=${t.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
