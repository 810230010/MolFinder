<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>实单详情</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <%--<%@include file="/WEB-INF/views/common/resource_js.jsp"%>--%>
    <script src="/static/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="hr-line-dashed"></div>
<div class="container">
    <div class="row">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="/index/indexPage">首页</a> <span class="divider"></span>
                </li>
                <li>
                    <a href="#" style="font-size:20px;">实单详情</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="background: #f4f4f4">
<div class="container" style="padding-top: 20px; padding-bottom: 20px">
    <div class="real-content" style="height:200px">
        <div class="real-img col-md-3"><img src="${realDetail.image}" style="width: 200px;height:200px" alt="图片"/></div>
        <div class="real-des col-md-9">
            <h3>CAS号：${realDetail.casNo}</h3>
            <div class="pull-left"><i class="fa fa-user"></i>已报名:${realDetail.joinCount}人</div>
            <div class="pull-right"><i class="fa fa-clock-o"></i>距离时间结束还有：<span class="timespan" style="color: red" endTime="<fmt:formatDate value="${realDetail.endTime}" pattern="yyyy-MM-dd hh:mm:ss" />"></span></div>
            <div class="col-md-12 text-center" style="height: 50px;line-height: 50px; border: 1px solid #ddd;background: white;margin-top: 10px">
                <div class="col-md-3" style="border-right: 1px solid #ddd">采购量:${realDetail.buyAmount}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">发票要求:${realDetail.makeBill}</div>
                <div class="col-md-3" style="border-right: 1px solid #ddd">纯度要求:${realDetail.purity}</div>
                <div class="col-md-3" >交货期:${realDetail.submitDeadline}周</div>
            </div>
            <div class="col-md-6 text-left" style="color: red;font-size: 24px;margin-top: 30px">¥ ${realDetail.priceBetween}</div>
            <div class="col-md-6 text-right" style="margin-top: 30px"><a type="button" class="btn btn-danger" style="width:120px" href="/real/realCallpricePage?realOrderId=${realDetail.realOrderId}">立即抢单</a></div>
        </div>

    </div>
</div>
</div>
<!--tab-->
<div class="container">
<div class="row" style="margin-top:40px;">
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active col-md-4" style="padding-left: 0"><a data-toggle="tab" href="#tab-1"><i class="fa fa-eye"> </i>实单详情</a></li>
            <li class="col-md-4"><a data-toggle="tab" href="#tab-2"><i class="fa fa-book"></i>参考文献与路线</a></li>
            <li class="col-md-4" style="padding-right: 0"><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>发单人</a></li>
        </ul>
        <div class="tab-content" style="height:400px">
            <div id="tab-1" class="tab-pane fade in active">
                <div class="panel-body text-center">
                    <h3><i class="fa fa-building-o" style="color: red"></i>实单详情</h3>
                    <div class="text-left" style="margin-top: 20px">
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>CAS号</strong>： ${realDetail.casNo}</p>
                        <p><strong>英文名称</strong>： ${realDetail.englishName}</p>
                        <p><strong>中文名称</strong>：${realDetail.chineseName}</p>
                        <p><strong>其他要求</strong>：${realDetail.remark}</p>
                    </div>
                    <div class="col-md-4" style="border-right: 1px dashed grey">
                        <p><strong>采购量</strong>：${realDetail.buyAmount}</p>
                        <p><strong>纯度要求</strong>： ${realDetail.purity}</p>
                        <p><strong>图谱要求</strong>：${realDetail.diagramRequire}</p>
                        <p><strong>实单价格</strong>：${realDetail.priceBetween}元</p>
                    </div>
                    <div class="col-md-4">
                        <p><strong>交货期</strong>：${realDetail.submitDeadline}</p>
                        <p><strong>发布日期</strong>： <fmt:formatDate value="${realDetail.beginTime}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
                        <p><strong>发票类型</strong>： ${realDetail.makeBill}</p>
                    </div>
                        <c:if test="${realDetail.guaranteeMoneyPercent != null}">
                        <div class="col-md-12">
                            <div class="hr-line-dashed"></div>
                            <p><b>成交后买方预付全款${realDetail.guaranteeMoneyPercent}%至网站作为保证金</b></p>
                            <c:if test="${realDetail.rewardMoneyPercent != null}">
                                <p><b>提前完成奖励订单价${realDetail.rewardMoneyPercent}%每天</b></p>
                            </c:if>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane fade">
                <div class="panel-body text-center">
                      ${realDetail.referDoc}
                </div>
            </div>
            <div id="tab-3" class="tab-pane fade">
                <div class="panel-body" style="background:#F6F6F6;">
                    <div class="col-md-6 text-center" style="border-right:2px solid silver;height: 220px">
                        <h5><img src="/static/img/icons/phone.png">联系人信息</h5>
                        <div class="hr-line-dashed"></div>
                        <div>
                            <div class="alert alert-warning">
                                <strong><img src="/static/img/icons/exclaim.png">报价后方可查看发单人信息!</strong>
                            </div>
                        </div>
                        <div style="font-size: 16px;display: none">
                            <p>
                                <span>企业地址:<font style="font-size: 18px;font-weight: bold">闲林</font></span>
                            </p>
                            <p>
                                <span>联系人:<font style="font-size: 18px;font-weight: bold">闲林</font>；</span>
                                <span>联系号码:<font style="font-size: 18px;font-weight: bold">闲林</font></span>
                            </p>
                            <p>
                                <span>qq:<font style="font-size: 18px;font-weight: bold">闲林</font></span>
                            </p>
                            <p>
                                <span>邮箱:<font style="font-size: 18px;font-weight: bold">闲林</font></span>
                            </p>
                            <p>
                                <span>传真:<font style="font-size: 18px;font-weight: bold">闲林</font></span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6 text-center" style="height: 220px">
                        <h5><img src="/static/img/icons/info.png" style="width:20px; height: 20px;">他的概况</h5>
                        <div class="hr-line-dashed"></div>
                        <div>
                            <p>
                                <div>
                                     <span>积分等级:</span>
                                     <span>伯爵</span>
                                </div>
                            </p>
                            <p>
                            <div>
                                <span>实单成单率:</span>
                                <span>99%</span>
                            </div>
                            </p>
                            <p>
                            <div>
                                <span>资质:</span>
                                <span>实名认证</span>
                            </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>
<script>
$(function () {
    updateEndTime();
})
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
        }
    });
    setTimeout("updateEndTime()",1000);
}
</script>
</html>
