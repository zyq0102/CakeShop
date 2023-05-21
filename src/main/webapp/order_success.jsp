<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>确认订单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<head/>
<body>
<jsp:include page="header.jsp"/>
<div class="cart-items">
    <div class="container">
        <div class="alert alert-success">订单提交成功！</div>
        <p><a class="btn btn-success" href="${ctx}/order_list">查看我的订单</a></p>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
