<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>头部页面</title>


</head>

<body>
<div class="col-lg-12 top-left-slogan" style="background-color: #354b56">
    <div class="col-lg-2 col-lg-offset-3 top-nav-left pull-left" style="color: white;line-height: 44px;height: 44px">专注定制合成</div>
    <div class="col-lg-4 pull-right">
        <c:choose>
            <c:when test="${!empty currentUser}">
                <ul class="top-nav-right" style="list-style: none;">
                    <li style="width: 160px;float: left; height:44px; line-height: 44px;color: white">${currentUser.phone},欢迎您</li>
                    <a class="register" href="/user/logout" style="text-decoration: none;color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">注销</li></a>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="top-nav-right" style="list-style: none;">
                    <a class="login" href="/user/loginPage" style="text-decoration: none;color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">登陆</li></a>
                    <a class="register" href="/user/registerPage" style="color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">注册</li></a>
                </ul>
            </c:otherwise>
        </c:choose>

    </div>

</div>
<div class="top-logo" style="height: 200px; background: white; width: 66%;margin: 0 auto">
    <div class="col-md-8 logo">
        <img src="/static/img/logo.png"/>
    </div>
    <a href="#" style="text-decoration: none; color: black">
    <div class="col-md-4 text-left" style="margin-top: 20px">
        <h3>资讯</h3>
        <div class="analysis">
            实单: <span class="badge">21</span>
            询单: <span class="badge">21</span></span>
            成交单数: <span class="badge">21</span>
        </div>
    </div>
    </a>
</div>
</body>
<script>

</script>
</html>
