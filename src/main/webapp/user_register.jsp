<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp?flag=5"/>
<div class="account">
    <div class="container">
        <div class="register">
            <%--        用户注册成功与否的提醒--%>
            <c:if test="${!empty msg }">
                <div class="alert alert-success">${msg}</div>
            </c:if>
            <%--    <c:if test="${!empty failMsg }">--%>
            <%--        <div class="alert alert-danger">${failMsg}</div>--%>
            <%--    </c:if>--%>

            <form action="${ctx}/register" method="post" onsubmit="return flag">
                <div class="register-top-grid">
                    <h3>注册新用户</h3>
                    <div class="input">
                        <span>用户名 <label style="color:red;">*</label></span>
                        <%--            失去焦点，触发check事件，会传送当前用户的文本框数据--%>
                        <input type="text" name="username" placeholder="请输入用户名" required="required"
                               onblur="check(this.value)">
                        <%--             显示错误信息，对应下方Ajax--%>
                        <span id="msg" class="row"></span>
                    </div>
                    <div class="input">
                        <span>邮箱 <label style="color:red;">*</label></span>
                        <input type="text" name="email" placeholder="请输入邮箱" required="required">
                    </div>
                    <div class="input">
                        <span>密码 <label style="color:red;">*</label></span>
                        <input type="password" name="password" placeholder="请输入密码" required="required">
                    </div>
                    <div class="input">
                        <span>收货人<label></label></span>
                        <input type="text" name="name" placeholder="请输入收货">
                    </div>
                    <div class="input">
                        <span>收货电话<label></label></span>
                        <input type="text" name="phone" placeholder="请输入收货电话">
                    </div>
                    <div class="input">
                        <span>收货地址<label></label></span>
                        <input type="text" name="address" placeholder="请输入收货地址">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交">
                    <div class="clearfix"></div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    function check(name) {
        $.ajax({
            type: "post",
            url: "checkName",//controller-IndexController中对应的url
            data: {username: name},//传的数值为name
            success: getResult
        })
    }

    //flag：防止表单提交。
    let flag = true;

    function getResult(data) {
        if (data == 0) {
            //$("#msg"):id=msg的对象-上方onsubmit="return flag"
            $("#msg").html("<font color='red'>用户名重复！</font>");
            flag = false;
        } else
            //不能不写，否则弹出提示语句后无论用户名如何，错误提示语句不会消失
            $("#msg").html("");
        flag = true;
    }
</script>
</body>
</html>
