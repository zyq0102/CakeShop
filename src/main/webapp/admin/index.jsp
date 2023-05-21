<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>后台管理首页</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<br>
<div class="alert alert-success" role="alert">恭喜你，登陆成功！</div>
</body>
</html>
