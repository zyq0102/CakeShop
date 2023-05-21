<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp?flag=6"/>
<div class="account">
    <div class="container">
        <div class="register">
            <%--用户登录时的信息--%>
            <c:if test="${!empty msg }">
                <div class="alert alert-danger">${msg}</div>
            </c:if>
            <%--->Order_submit:请登录后提交订单--%>
            <c:if test="${!empty failMsg }">
                <div class="alert alert-danger">${failMsg}</div>
            </c:if>
            <%--修改密码后返回的信息--%>
            <c:if test="${!empty msg_pwd }">
                <div class="alert alert-success">${msg_pwd}</div>
            </c:if>
            <c:if test="${!empty failMsg1 }">
                <div class="alert alert-danger">${failMsg1 }</div>
            </c:if>
            <form action="${ctx}/login" method="post">
                <div class="register-top-grid">
                    <h3>用户登录</h3>
                    <div class="input">
                        <span>用户名/邮箱 <label style="color:red;">*</label></span>
                        <input type="text" id="na" name="username" placeholder="请输入用户名/邮箱" required="required">
                    </div>
                    <div class="input">
                        <span>密码 <label style="color:red;">*</label></span>
                        <input type="password" name="password" placeholder="请输入密码" required="required">
                    </div>
                    <div class="input">
                        <div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 0">
                            <span>验证码 <label style="color:red;">*</label></span>
                            <input type="text" name="verifyCode" placeholder="请输入验证码" required="true">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6" style="padding-top: 20px">
                            <img alt="点击图片刷新！" src="${ctx}/kaptcha"
                                 onclick="this.src='${ctx}/kaptcha?d='+new Date()*1">
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交">
                    <div class="clearfix"></div>
                </div>
            </form>
<%--                无验证码版本--%>
<%--            <form action="${ctx}/login" method="post">--%>
<%--                <div class="register-top-grid">--%>
<%--                    <h3>用户登录</h3>--%>
<%--                    <div class="input">--%>
<%--                        <span>用户名/邮箱 <label style="color:red;">*</label></span>--%>
<%--                        <input type="text" name="username" placeholder="请输入用户名" required="required">--%>
<%--                    </div>--%>
<%--                    <div class="input">--%>
<%--                        <span>密码 <label style="color:red;">*</label></span>--%>
<%--                        <input type="password" name="password" placeholder="请输入密码" required="required">--%>
<%--                    </div>--%>
<%--                    <div class="input">--%>
<%--                        <div class="col-lg-6 col-md-6 col-sm-6" style="padding-left: 0">--%>
<%--                            <span>验证码 <label style="color:red;">*</label></span>--%>
<%--                            <input type="text" name="verifyCode" placeholder="请输入验证码" required="true">--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6 col-md-6 col-sm-6" style="padding-top: 20px">--%>
<%--                            <img alt="点击图片刷新！" src="${ctx}/kaptcha" onclick="this.src='${ctx}/kaptcha?d='+new Date()*1">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="clearfix"></div>--%>
<%--                </div>--%>
<%--                <div class="register-but text-center">--%>
<%--                    <input type="submit" value="提交">--%>
<%--                    <div class="clearfix"></div>--%>
<%--                </div>--%>
<%--            </form>--%>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<!--//account-->
<jsp:include page="footer.jsp"/>
<script>
    document.getElementById("codeImg").src="${ctx}/code?"+new Date().getTime();
    //生产验证码
    function reloadcode() {
        document.getElementById("codeImg").src="code?"+new Date().getTime();
    }

</script>
</body>
</html>
