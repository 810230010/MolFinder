<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
    <style>
        .active{background-color: silver;color: white;border-left: 5px solid #c23}
        .active2{background-color: wheat;color: white;border-left: 5px solid #c23}
        .menu ul{padding-left: 0;text-align: center}
        .menu ul li{height:44px; line-height: 44px;}
        .menu ul li a{color:black; text-decoration: none}
        .menu ul li a:hover{color:black;text-decoration: none}
        .menu ul li a:visited{color:black;text-decoration: none}
        .menu ul li a:active{color:black;text-decoration: none}
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
    <div class="span6">
        <ul class="breadcrumb">
            <li>
                <a href="/index/indexPage">首页</a> <span class="divider"></span>
            </li>
            <li id="breadcrumb" style="font-size: 24px">
                我的实单
            </li>
        </ul>
    </div>
    <div class="col-md-2 menu" style="height: 700px;background-color:#f8f8f8;padding-left: 0;padding-right: 0">
        <div style="height:44px;padding-left: 30px">
            <h4>发单管理</h4>
        </div>
        <div style="height:132px;vertical-align: middle" class="aaa">
            <ul style="list-style: none;width:100%">
                <li class="active"><a href="/profile/mypublish/myRealSendPage" target="menuFrame">我的实单</a></li>
                <li><a href="/profile/mypublish/myEnquirySendPage" target="menuFrame">我的询单</a></li>
                <li><a href="/profile/mypublish/deletedOrdersPage" target="menuFrame">已删除</a></li>
            </ul>
        </div>
        <div style="height:44px;padding-left: 30px">
            <h4>接单管理</h4>
        </div>
        <div style="height:132px;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px"><a href="/profile/callprice/realOrdersCallpricePage" target="menuFrame">已报价实单</a></li>
                <li style="height:44px"><a href="/profile/callprice/queryOrdersCallpricePage" target="menuFrame">已报价询单</a></li>
                <li style="height:44px"><a href="/profile/callprice/deletedOrdesPage" target="menuFrame">已删除</a></li>
            </ul>
        </div>
        <div style="height:44px;padding-left: 30px">
            <h4>订单管理</h4>
        </div>
        <div style="height:88px;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px"><a href="/profile/orders/purchasePage" target="menuFrame">我采购的</a></li>
                <li style="height:44px"><a href="/profile/orders/sellPage" target="menuFrame">我生产的</a></li>
            </ul>
        </div>
        <div style="height:44px;padding-left: 30px">
            <h4>资料完善</h4>
        </div>
        <div style="height:44px;vertical-align: middle">
            <ul style="list-style: none">
                <li style="height:44px"><a href="/profile/certificationPage" target="menuFrame">实名认证</a></li>
            </ul>
        </div>
    </div>
    <div class="right-content col-md-10" style="height: 1200px;">
        <iframe id="menuFrame" name="menuFrame" src="/profile/mypublish/myRealSendPage" style="overflow:visible;" scrolling="no" frameborder="no" width="100%" height="100%; float:left">
        </iframe>
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
    $(".menu ul li").click(function () {
        $(".menu ul li").removeClass('active');
        $(this).addClass('active');
        $("#breadcrumb").html($(this).text())
    })
    $(".menu ul li").mouseover(function () {
        $(".menu ul li").removeClass('active2');
        $(this).addClass('active2');
        if($(this).hasClass('active')){
            $(this).removeClass('active2');
        }
    })
    $(".menu ul li").mouseleave(function () {
        $(".menu ul li").removeClass('active2');
    })
    $(".menu ul li").mousedown(function () {
        $(".menu ul li").removeClass('active2');
    })
</script>
</html>
