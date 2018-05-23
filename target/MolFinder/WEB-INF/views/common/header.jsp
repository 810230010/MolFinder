<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>


<div class="col-lg-12 top-left-slogan" style="background-color: #354b56">
    <div class="col-lg-2 col-lg-offset-2 pull-left" style="color: white;line-height: 44px;height: 44px">专注定制合成</div>
    <div class="col-lg-4 pull-right">
        <c:choose>
            <c:when test="${!empty currentUser}">
                <ul class="top-nav-right" style="list-style: none;">
                    <li style="width: 160px;float: left; height:44px; line-height: 44px;color: white">${currentUser.phone},欢迎您</li>
                    <a class="register" href="/user/logout" style="text-decoration: none;color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">注销</li></a>
                    <a href="/profile/profilePage" style="text-decoration: none;color: white"><li style="width: 60px;float: left; height:44px; line-height: 44px">我的信息</li></a>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="top-nav-right" style="list-style: none;">
                    <a class="login" href="/user/loginPage" style="text-decoration: none;color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">登录</li></a>
                    <a class="register" href="/user/registerPage" style="color: white"><li style="width: 40px;float: left; height:44px; line-height: 44px">注册</li></a>
                </ul>
            </c:otherwise>
        </c:choose>

    </div>

</div>




