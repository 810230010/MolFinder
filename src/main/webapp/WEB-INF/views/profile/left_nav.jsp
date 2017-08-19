<%--
  Created by IntelliJ IDEA.
  User: usher
  Date: 2017/8/17
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
    <div class="span6">
        <ul class="breadcrumb">
            <li>
                <a href="/index/indexPage">首页</a> <span class="divider"></span>
            </li>
            <li>
                <a style="font-size:20px;">我的实单</a>
            </li>
        </ul>
    </div>
    <div class="col-md-3" style="height: 700px;background-color:#f8f8f8;padding-left: 30px">
        <div style="height:44px; vertical-align: middle">
            <h4>发单管理</h4>
        </div>
        <div style="height:176px;display: table-cell;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px"><a href="/profile/myRealSendPage" target="menuFrame">我的实单</a></li>
                <li style="height:44px">我的询单</li>
                <li style="height:44px">已删除的实单</li>
                <li style="height:44px">已删除的询单</li>
            </ul>
        </div>
        <div style="height:44px; vertical-align: middle">
            <h4>接单管理</h4>
        </div>
        <div style="height:88px;display: table-cell;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px">已报价实单</li>
                <li style="height:44px">已报价询单</li>
            </ul>
        </div>
        <div style="height:44px; vertical-align: middle">
            <h4>订单管理</h4>
        </div>
        <div style="height:88px;display: table-cell;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px">我采购的</li>
                <li style="height:44px">我生产的</li>
            </ul>
        </div>
        <div style="height:44px; vertical-align: middle">
            <h4>资料完善</h4>
        </div>
        <div style="height:44px;display: table-cell;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px">实名认证</li>
            </ul>
        </div>
    </div>
    <div class="right-content col-md-9" style="height: 700px;">
        <iframe id="menuFrame" name="menuFrame" src="/profile/myRealSendPage" style="overflow:visible;" scrolling="no" frameborder="no" width="100%" height="100%; float:left">
        </iframe>
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>
