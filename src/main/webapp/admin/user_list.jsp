<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<h2 class="text-center">用户管理面板</h2>
<div class="container-fluid">

    <div class="text-left">
        <a class="btn btn-default" href="${ctx}/admin/user">所有用户</a>
        <%--    将用户导出到Excel--%>
        <a class="btn btn-default" href="${ctx}/admin/export">导出用户</a>
        <a class="btn btn-default" href="${ctx}/admin/user_register.jsp">添加用户</a>
    </div>

    <br>
    <%--        根据用户名、邮箱、手机号进行模糊查询--%>
    <form action="${ctx}/admin/user_search">
        用户信息查询(模糊查询+组合条件查询):<input type="text" class="form-control" style="display: inline;width: 150px; "
                                   placeholder="请输入用户名" name="username">
        <input type="text" class="form-control" style="display: inline;width: 150px; " placeholder="请输入邮箱" name="email">
        <input type="text" class="form-control" style="display: inline;width: 150px; " placeholder="请输入手机号"
               name="phone">
        <input type="submit" class="btn btn-info" value="查询">
    </form>

    <table class="table table-bordered table-hover">
        <tbody>
        <tr>
            <th width="5%">ID</th>
            <th width="10%">用户名</th>
            <th width="10%">邮箱</th>
            <th width="10%">收件人</th>
            <th width="10%">电话</th>
            <th width="10%">地址</th>
            <th width="12%">操作</th>
        </tr>

        <c:forEach var="u" items="${userList.list}">
            <tr>
                <td><p>${u.id}</p></td>
                <td><p>${u.username}</p></td>
                <td><p>${u.email}</p></td>
                <td><p>${u.name}</p></td>
                <td><p>${u.phone}</p></td>
                <td><p>${u.address}</p></td>
                <td>
                    <a class="btn btn-info"
                       href="${ctx}/admin/user_repass.jsp?id=${u.id}&username=${u.username}&pno=${userList.pageNum}">重置密码</a>
                    <a class="btn btn-primary"
                       href="${ctx}/admin/user_edit.jsp?id=${u.id}&username=${u.username}&email=${u.email}&name=${u.name}&phone=${u.phone}&address=${u.address}&pno=${userList.pageNum}">修改</a>
                    <a class="btn btn-danger" href="${ctx}/admin/user_delete?id=${u.id}&pno=${userList.pageNum}">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <div style="text-align:center;">
        <a href="${ctx}/admin/user?pno=1" class="btn btn-info">首页</a>
        <a href="${ctx}/admin/user?pno=${userList.pageNum-1>0?userList.pageNum-1:1}" class="btn btn-info">上一页</a>
        <h3 style="display:inline;">[${userList.pageNum}/${userList.pages}]</h3>
        <a class="btn btn-info"
           href="${ctx}/admin/user?pno=${userList.pageNum+1<userList.pages?userList.pageNum+1:userList.pages}">下一页</a>
        <a class="btn btn-info" href="${ctx}/admin/user?pno=${userList.pages}">尾页</a>
        <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info"
                                                                                               href="javascript:void(0);"
                                                                                               onclick='location.href="${ctx}/admin/user?pno="+(this.previousSibling.value)'>GO</a>
    </div>
    <br>
</div>
</body>
</html>
