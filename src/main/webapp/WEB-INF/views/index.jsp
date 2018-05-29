<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/js/jquery-3.1.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/layer/layer.js"></script>
</head>
<style>
    .model1,.model2{
        transition: all .4s;
    }
    .model1:hover,.model2:hover{
        transform: scale(1.1);
    }
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
<div class="top-logo" style="height: 200px; background: white; width: 66%;margin: 0 auto">
    <div class="col-md-8 logo">
        <a href="/index/indexPage"><img src="/static/img/logo.png"/></a>
    </div>
    <a href="#" style="text-decoration: none; color: black">
        <div class="col-md-4 text-left" style="margin-top: 20px">
            <h3>资讯</h3>
            <div class="analysis">
                实单: <span class="badge">${analysis.get("real_total")}</span>
                询单: <span class="badge">${analysis.get("query_total")}</span></span>
                成交单数: <span class="badge">${analysis.get("deal_total")}</span>
            </div>
        </div>
    </a>
</div>
<div class="hr-line-dashed" style="margin-top: 10px"></div>
<div class="menus" style="font-size: 24px;font-weight: 600;margin-bottom: 140px">
    <div class="row1" id="row1">
        <div class="col-md-4 text-right"><a href="#realdiv">实单</a></div>
        <div class="col-md-4 text-center"><a href="#querydiv">询单</a></div>
        <div class="col-md-4 text-left"><a class="authority publish" url="/material/materialBuyPage">原料采购</a></div>
    </div>

    <div class="row2" style="margin-top: 40px">
        <div class="col-md-4 text-right"><a class="authority publish" url="/real/realPublishPage">发布实单</a></div>
        <div class="col-md-4 text-center"><a class="authority publish" url="/enquiry/enquiryPublishPage">发布询单</a></div>
        <div class="col-md-4 text-left"><a class="authority publish" url="/material/materialSupplyPage">原料供应</a></div>
    </div>
</div>
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="/static/img/banner06.png" alt="First slide">
        </div>
        <div class="item">
            <img src="/static/img/banner06.png" alt="Second slide">
        </div>
        <div class="item">
            <img src="/static/img/banner06.png" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
</div>
<!--定制实单-->
<div class="col-lg-12 text-center real-bill" id="realdiv"><h3 id="real"><i class="fa fa-building-o" style="color: red"></i>定制实单</h3></div>
<div class="row text-center" style="position: relative;top:40px;width: 70%; margin:0 auto">
    <c:forEach var="item" items="${realList}">
        <div class="col-md-6 model1">
        <a href="/real/realDetailPage?realOrderId=${item.realOrderId}&userId=${item.userId}" class="thumbnail" style="text-decoration: none">
            <div class="description" style="height: 170px">
                <div class="img col-md-4">
                   <img src="${item.image}" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                </div>
            <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                <h4>CAS号:${item.casNo}</h4>
                <p style="text-align: left">
                <span>纯度:${item.purity}</span></br>
                实单价:<font color="red" style="font-size: 24px">${item.priceBetween}</font><br/>
                采购量:<font color="red">${item.buyAmount}</font><br/>
                交货期:<font color="red">${item.submitDeadline1}</font><br/>
                已报名:<font color="red">${item.joinCount}</font>人
                </p>
            </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="deadline text-left" style="height: 40px;">
            <div style="color: black" class="col-md-8">
               <i class="fa fa-clock-o fa-2x"></i>
                <span flag="real" data="${item.realOrderId}" endTime="<fmt:formatDate value="${item.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" class="timespan" style="font-size: 18px;font-weight: 400"></span>
            </div>
            <div class="col-md-4">
               <button style="display: none" class="btn btn-danger col-md-12 rub" data="${item.realOrderId}">立即抢单</button>
            </div>
          </div>
        </a>
        </div>
    </c:forEach>

    <div class="more">
        <button class="btn btn-primary btn-rounded btn-block" href="#"><i class="fa fa-spinner"></i> 更多实单</button>
    </div>
</div>

<!--定制询单-->
<div class="col-lg-12 text-center enquiry-bill" id="querydiv"><h3><i class="fa fa-question-circle-o" style="color: red"></i>定制询单</h3></div>
<div class="row text-center enquiry-main" style="position: relative;top:20px;width: 70%; margin:0 auto">
    <c:forEach var="item" items="${queryList}">
        <div class="col-md-6 model2">
            <a href="/enquiry/queryDetailPage?queryOrderId=${item.queryOrderId}" class="thumbnail" style="text-decoration: none">
                <div class="description" style="height: 160px">
                    <div class="img col-md-4">
                        <img src="${item.image}" alt="通用的占位符缩略图" style="width: 100%; height: 150px;border: 0"/>
                    </div>
                    <div class="word col-md-7 col-md-offset-1" style="color: #000; text-align: left">
                        <h4>CAS号:${item.casNo}</h4>
                        <p>纯度:${item.purity}</p>
                        <p>采购量:<font color="red">${item.buyAmount}</font></p>
                        <p>交货期:<font color="red">${item.submitDeadline1}</font></p>
                        <p>已报名:<font color="red">${item.joinCount}</font>人</p>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="deadline text-left" style="height: 40px;">
                    <div style="color: black" class="col-md-8">
                        <i class="fa fa-clock-o fa-2x"></i>
                        <span flag="query" data="${item.queryOrderId}" class="timespan" endTime="<fmt:formatDate value="${item.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" style="font-size: 18px;font-weight: 400"></span>
                    </div>
                    <div class="col-md-4">
                        <button style="display: none" class="btn btn-danger col-md-12 rub">立即报价</button>
                    </div>
                </div>
            </a>
        </div>

    </c:forEach>

    <div class="more">
        <button class="btn btn-primary btn-rounded btn-block" href="#"><i class="fa fa-spinner"></i> 更多询单</button>
    </div>
    <div class="hr-line-dashed"></div>
</div>

<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
    $(function(){
        // 初始化轮播
        $("#myCarousel").carousel('cycle');
        //获得实单列表
        updateEndTime();
        $(".authority").click(function(){
            var isPass = "${currentUser.isCertificated}";
            if($(".register").text() == '注册'){
                layer.msg('请先登录');
                return;
            }
            if($(this).hasClass('publish') && isPass == "false"){
                layer.msg('实名认证过后才能发单');
                return;
            }
            window.location.href = $(this).attr("url");
        });
    });

    //倒计时函数
    function updateEndTime()
    {
        var date = new Date();
        var time = date.getTime(); //当前时间距1970年1月1日之间的毫秒数


        $(".timespan").each(function(i){


            var endDate =this.getAttribute("endTime"); //结束时间字符串
           //转换为时间日期类型
            var endDate1 = eval('new Date(' + endDate.replace(/\d+(?=-[^-]+$)/, function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) +')');

            var endTime = endDate1.getTime(); //结束时间毫秒数


            var lag = (endTime - time) / 1000; //当前时间和结束时间之间的秒数
            if(lag > 0)
            {
                var second = Math.floor(lag % 60);
                var minite = Math.floor((lag / 60) % 60);
                var hour = Math.floor((lag / 3600) % 24);
                var day = Math.floor((lag / 3600) / 24);
                $(this).html(day+"天"+hour+"小时"+minite+"分"+second+"秒");
            }
            else{
                $(this).removeClass("timespan");
                $(this).html("已经结束");
                $(this).parent().siblings().children('.rub').html('报价结束');
                $(this).parent().siblings().children('.rub').css('background-color', 'grey');
                $(this).parent().siblings().children('.rub').css('border', 'none');
                changeOrderState($(this).attr('data'), $(this).attr('flag'),'CLOSE');

            }
        });
        setTimeout("updateEndTime()",1000);
    }
    $(".model1").mouseover(function () {
        $(this).children().find('.rub').show();
    })
    $(".model1").mouseleave(function () {
        $(this).children().find('.rub').hide();
    })
    $(".model2").mouseover(function () {
        $(this).children().find('.rub').show();
    })
    $(".model2").mouseleave(function () {
        $(this).children().find('.rub').hide();
    })

    function changeOrderState(orderId, orderType,state){
        if(orderType == "real"){
            $.ajax({
                url: "/real/updateRealOrderState/" + state,
                data:{
                    realOrderId: orderId
                },
                success:function(result){
                    if(result.code != 200){

                    }
                },
                error:function (result) {
                    alert("系统出错!")
                }
            })
        }else{
            $.ajax({
                url: "/enquiry/updateQueryOrderState/" + state,
                data:{
                    queryOrderId: orderId
                },
                success:function(result){
                    if(result.code != 200){

                    }
                },
                error:function (result) {
                    alert("系统出错!")
                }
            })
        }
    }
</script>
</html>
