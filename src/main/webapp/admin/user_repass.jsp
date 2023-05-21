<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>重置密码（管理员）</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <div class="account">
        <div class="container">
            <div class="register">
                <c:if test="${!empty failMsg}">
                    <div class="alert alert-danger">${failMsg}</div>
                </c:if>
                <form action="${ctx}/admin/user_repass?id=${param.id}" method="post">
                    <div class="register-top-grid">
                        <h3>重置密码（管理员）</h3>
                        <div class="input">
                            <span>用户名 <label style="color:red;">*</label></span>
                            <input type="text" name="username" placeholder="请输入用户名" required="required"
                                   value="${param.username}">
                        </div>
                        <%--          <div class="input">--%>
                        <%--            <span>原密码 <label style="color:red;">*</label></span>--%>
                        <%--            <input type="password" name="password" placeholder="请输入密码" required="required">--%>
                        <%--          </div>--%>
                        <div class="input">
                            <span>新密码 <label style="color:red;">*</label></span>
                            <input type="password" name="newPassword" placeholder="请输入密码" required="required">
                        </div>
                        <div class="register-but text-center">
                            <input type="submit" value="提交">
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
