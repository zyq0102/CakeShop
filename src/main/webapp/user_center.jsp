<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>个人中心</title>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp?flag=7"/>
<div class="account">
    <div class="container">
        <div class="register">
            <c:if test="${!empty msg}">
                <div class="alert alert-success">${msg}</div>
            </c:if>
            <c:if test="${!empty failMsg }">
                <div class="alert alert-danger">${failMsg}</div>
            </c:if>

            <div class="register-top-grid">
                <h3>个人中心</h3>
                <form action="${ctx}/changeuser" method="post">
                    <!-- 收货信息 start -->
                    <h4>收货信息</h4>
                    <div class="input">
                        <span>收货人<label></label></span>
                        <input type="text" name="name" value="${sessionScope.loginuser.name}" placeholder="请输入收货人">
                    </div>
                    <div class="input">
                        <span>收货电话</span>
                        <input type="text" name="phone" value="${sessionScope.loginuser.phone}" placeholder="请输入收货电话">
                    </div>
                    <div class="input">
                        <span>收货地址</span>
                        <input type="text" name="address" value="${sessionScope.loginuser.address}"
                               placeholder="请输入收货地址">
                    </div>
                    <div class="register-but text-center">
                        <input type="submit" value="提交">
                    </div>
                    <!-- 收货信息 end -->
                </form>
                <hr>
                <form action="${ctx}/changepwd" method="post">
                    <h4>安全信息</h4>
                    <div class="input">
                        <span>原密码</span>
                        <input type="text" name="password" placeholder="请输入原密码">
                    </div>
                    <div class="input">
                        <span>新密码</span>
                        <input type="text" name="newPassword" placeholder="请输入新密码">
                    </div>
                    <div class="clearfix"></div>
                    <div class="register-but text-center">
                        <input type="submit" value="提交">
                    </div>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
