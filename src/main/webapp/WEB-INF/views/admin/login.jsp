<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>后台登录页面</title>

    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/static/css/animate/animate.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>精细化工后台管理页面</h3>
        <form class="m-t" role="form">
            <div class="form-group">
                <input id="username" type="email" class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
                <input id="password" type="password" class="form-control" placeholder="密码">
            </div>
            <button id="login-btn" type="button" class="btn btn-primary block full-width m-b">登录</button>
        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/plugins/layer/layer.js"></script>
</body>
    <script>
        $("#login-btn").click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            $.ajax({
                url: "/admin/login/check",
                data:{
                    adminName: username,
                    adminPass: password
                },
                success: function (result) {
                    if(result.code == 200){
                        layer.msg("登录成功!");
                        setTimeout(function () {
                            window.location.href = "/admin/page/index";
                        }, 1500);
                    }else{
                        layer.msg("用户名或密码错误!");
                    }
                },
                error: function (result) {
                    alert("登录服务出错!");
                }
            })
        })
    </script>
</html>
