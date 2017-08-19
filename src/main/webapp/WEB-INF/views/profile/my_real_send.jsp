<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
    <style>
        ul{height: 40px;padding-left: 0px;background: #f8f8f8}
        li{height:40px;float: left;line-height: 40px;padding: 0 15px;cursor: pointer}
        .active{background-color: #c23;color: white}

    </style>
</head>
<body style="background-color: white">
<div class="container" style="padding-top: 30px;">
    <div style="border-left: 5px solid #c23;height:44px;line-height:44px;padding-left:10px;box-shadow: grey">
        <font style="font-size: 24px"><b>我的实单</b></font>
    </div>
    <div class="hr-line-dashed"></div>
    <div class="filter1">
        <span>
            <label>CAS号:</label>
            <input type="text"/>
        </span>
        <span style="margin-left: 20px">
            <label>发布时间:</label>
            <input type="date"/>
        </span>
        <span>-</span>
        <span>
            <input type="date"/>
        </span>
        <span style="margin-left: 20px">
            <input type="button" class="btn btn-danger" value="搜索"/>
        </span>
    </div>
    <div class="filter2" style="box-shadow: 0 5px 3px #e8e8e8;margin-top:20px">
        <ul style="list-style: none">
            <li class="active"><b>全部</b><i></i></li>
            <li><b>抢单中</b></li>
            <li><b>已派单</b></li>
            <li><b>停止抢单</b></li>
            <li><b>报价结束未派单</b></li>
        </ul>
    </div>
</div>
</body>
<script>
    $("ul li").click(function () {
        $("ul li").removeClass('active');
        $(this).addClass('active');
    })
</script>
</html>
