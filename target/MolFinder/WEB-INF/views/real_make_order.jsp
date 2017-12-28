<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>实单下单页面</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link href="/static/css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/plugins/semantic/semantic.min.css">
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <style>
        .content{height:1000px}
        .hover{border:1px solid lightseagreen}
        .selected{border: 1px solid blue}
        .address{
            height:100px;
            background-color: #e0e1e2;
            padding: 20px 20px;
            cursor: pointer;
            border-bottom:1px solid grey;
            border-radius: 20px;
            margin-top:20px
        }
        .del_icon{
            text-align: right;
            display: none
        }
    </style>
</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
</div>
<div class="hr-line-dashed" style="margin-top: 10px"></div>
<div class="col-md-8 col-md-offset-2" >


</div>


<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/plugins/layer/layer.js"></script>
<script src="/static/js/plugins/semantic/semantic.min.js" type="text/javascript"></script>

<!--jquery validate-->
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.js"></script>
<script src="/static/js/ajaxfileupload.js"></script>
<!-- Steps -->
<script src="/static/js/plugins/steps/jquery.steps.min.js"></script>
<!--sweetalert-->
<script src="/static/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
<div class="ibox-content">
    <h2>
        实单下单
    </h2>
    <p>
        实单下单流程
    </p>

    <form id="form" action="#" class="wizard-big">
        <h1>同意报价</h1>
        <fieldset>
            <h2>实单报价信息</h2>
            <div class="row">
                <table class="table table-bordered">
                    <thead style="background-color:silver;">
                    <tr>
                        <th><fmt:formatDate value="${realCallpriceDetail.createTime}" pattern="yyyy-MM-dd"/></th>
                        <th>${realCallpriceDetail.casNo}</th>
                        <th>${realCallpriceDetail.chineseName}(${realCallpriceDetail.englishName})</th>
                        <th colspan="2">${realCallpriceDetail.callPriceAmount}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="callItem" items="${realCallpriceDetail.realCallpriceCompleted}">
                        <c:set value="${ fn:split(callItem, '/') }" var="callItems" />
                    <tr>
                        <td>${callItems[0]}</td>
                        <td>${callItems[1]}(${realCallpriceDetail.makeBill})</td>
                        <td>${realCallpriceDetail.callPurity}%</td>
                        <td>${realCallpriceDetail.callSubmitDeadline}</td>
                        <td>${realCallpriceDetail.expressType}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="col-lg-4">
                    <div class="text-center">
                        <div style="margin-top: 20px">
                            <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                        </div>
                    </div>
                </div>
            </div>

        </fieldset>
        <h1>生成订单</h1>
        <fieldset>
            <h2>创建订单</h2>
            <div class="hr-line-dashed"></div>
            <div class="row">
                <h4 style="background-color: silver"><img src="/static/img/icons/transaction_fill.png"/>确认价格和包装规格</h4>
                <div class="form-group">
                    <label class="col-sm-3 control-label">CAS号: <u>${realCallpriceDetail.casNo}</u></label>
                </div>
                <div class="form-group">
                    <c:set value="${ fn:split(realCallpriceDetail.callPriceMoney, ',') }" var="prices" />
                    <c:set value="${ fn:split(realCallpriceDetail.callPriceAmount, ',') }" var="amounts" />
                        <label class="col-sm-12 control-label">
                            开票类型:
                            <c:forEach var="callPriceItem" items="${realCallpriceDetail.realCallpriceCompleted}">
                            <u>${callPriceItem}(${realCallpriceDetail.makeBill})</u>
                            </c:forEach>
                        </label>

                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">纯度: <u>${realCallpriceDetail.callPurity}%</u></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">快递方式: <u>${realCallpriceDetail.expressType}</u></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">交货期: <u>${realCallpriceDetail.callSubmitDeadline}</u></label>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">提供图谱:</label>
                    <div class="col-sm-11">
                        <c:set value="${ fn:split(realCallpriceDetail.offerDiagram, ',') }" var="names" />
                        <c:forEach var="item" items="${names}">
                            <a class="ui teal tag label">${item}</a>
                        </c:forEach>
                    </div>
                </div>

                <div class="form-group" style="position: relative;top:20px">
                    <label class="col-sm-1 control-label">保奖设置:</label>
                    <div class="col-sm-11">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseOne">
                                            下拉设置保证金、奖励金
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p>可付订单价<input id="content1" type="text" style="width: 60px;display:inline" value="${realCallpriceDetail.prepayedMoneyAmount}" readonly>%至网站作保证金(默认0.5%)</p>
                                        <p>接受违约金过期<input id="content2" type="text" style="width: 60px;display: inline" value="${realCallpriceDetail.vilationMoneyAmount}" readonly>%/天(默认1%)</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group" style="position: relative; top:20px">
                    <label class="col-sm-1 control-label">备注:</label>
                    <div class="col-sm-11">
                        <textarea id="remark" class="form-control" style="height:120px"></textarea>
                    </div>
                </div>
            </div>
            <h4 style="background-color:silver;position: relative; top:40px"><img src="/static/img/icons/coordinates_fill.png"/>确认收货及开票信息</h4>
            <h5 style="position: relative;top:40px">收货地址:</h5>
            <div class="form-group" style="position: relative; top:40px">
                <div class="col-sm-12 addresses">
                    <c:forEach var="item2" items="${addressList}">
                    <div class="col-sm-4 address">
                        <dl>
                            <dd>${item2.acceptGoodsUsername}(${item2.contactTel})</dd>
                            <dd>${item2.acceptGoodsAddress}</dd>
                            <dd style="display: none;">${item2.id}</dd>
                            <dd style="text-align: right;display: none" class="del_icon"><a onclick="deleteAddress($(this).parent().prev().text())"><img src="/static/img/icons/trash_fill.png"/></a></dd>
                        </dl>
                    </div>
                    </c:forEach>
                    <div class="col-sm-4 text-center addressAdd" style="height:100px;background-color: #e0e1e2;padding: 20px 20px;margin-top:20px;cursor: pointer;padding-top: 10px;border-radius: 20px">
                        <img src="/static/img/icons/add.png"/>
                        <p>添加地址</p>
                    </div>
                </div>
            </div>

        </fieldset>

        <h1>确认下单</h1>
        <fieldset>
            <h2>最后一步，请确认!</h2>
        </fieldset>
    </form>
</div>
</div>
</div>

</div>

<script>

    //删除地址事件
    function deleteAddress(id){
        swal({
                title: "确定删除该收货地址?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function(isConfirm){
                if (isConfirm) {
                    $.ajax({
                        url: "/order/deleteAcceptAddress",
                        data: {
                            id: parseInt(id)
                        },
                        success:function(result){
                            if(result.code == 200){
                                refreshAcceptGoodsAddress();
                                swal("删除成功!", "该收货地址已删除!", "success");
                            }
                        },
                        error:function (result) {
                            alert("删除收货地址系统出错");
                        }
                    })


                }
            });
    }
    //添加收货地址事件
    function addAcceptAddress(){
        $(".addressAdd").click(function () {
            //iframe层-父子操作
            layer.open({
                type: 2,
                area: ['700px', '450px'],
                fixed: false, //不固定
                maxmin: true,
                content: '/order/addAcceptOrderAddressPage',
                end: function () {
                    refreshAcceptGoodsAddress();
                }

            });
        })
    }
    //添加操作收货地址的样式
    function addStyle(){
        $(".address").mouseover(function () {
            $(this).find(".del_icon").show();
            $(this).addClass('hover');
        }).mouseleave(function () {
            $(this).find(".del_icon").hide();
            if($(this).hasClass('hover')){
                $(this).removeClass('hover');
            }
        }).click(function () {
            $(".address").each(function () {
                if($(this).hasClass('selected')){
                    $(this).removeClass('selected')
                }
            })
            $(this).addClass('selected');
        })
    }
     //ajax获得收货地址列表
     function refreshAcceptGoodsAddress(){
         $.ajax({
             url: "/order/getAcceptGoodsAddress",
             data: {
                 userId: ${currentUser.userId}
             },
             success: function (result) {
                 $(".addresses").html("");
                 for(var i=0; i<result.length; i++){
                     $(".addresses").append("  <div class=\"col-sm-4 address\">\n" +
                         "                        <dl>\n" +
                         "                            <dd>" + result[i].acceptGoodsUsername + "(" +result[i].contactTel + ")" + "</dd>\n" +
                         "                            <dd>" + result[i].acceptGoodsAddress + "</dd>\n" +
                         "                            <dd style='display: none' id='accept_info_id'>" + result[i].id + "</dd>\n" +
                         "<dd class='del_icon'><a onclick='deleteAddress($(this).parent().prev().text())'><img src='/static/img/icons/trash_fill.png'/></a></dd>\n" +
                         "                        </dl>\n" +
                         "                    </div>")
                 }
                 $(".addresses").append("<div class=\"col-sm-4 text-center addressAdd\" style=\"height:100px;background-color: #e0e1e2;padding: 20px 20px;margin-top:20px;cursor: pointer;padding-top: 10px;border-radius: 20px\">\n" +
                  "                              <img src=\"/static/img/icons/add.png\"/>\n" +
                  "                              <p>添加地址</p>\n" +
                  "  </div>");
                 addStyle();
                 addAcceptAddress();
             },
             error:function (result) {
                 alert("系统出错")
             }
         })
     }
    $(document).ready(function(){
        $('#collapseOne').collapse('show');
        $("#form").steps({
            bodyTag: "fieldset",
            onStepChanging: function (event, currentIndex, newIndex)
            {

                if(newIndex == 1){
                    addStyle();
                    addAcceptAddress();
                }
                // Always allow going backward even if the current step contains invalid fields!
                if (currentIndex > newIndex)
                {
                    return true;
                }

                // Forbid suppressing "Warning" step if the user is to young
                if (newIndex === 2)
                {
                    var flag = false;
                    $(".address").each(function () {
                        if($(this).hasClass('selected')){
                           flag = true;
                        }
                    })
                    if(flag == false) layer.msg("请选择收货地址!")
                    return flag;
                }

                var form = $(this);

                // Clean up if user went backward before
                if (currentIndex < newIndex)
                {
                    // To remove error styles
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                }

                // Disable validation on fields that are disabled or hidden.
                form.validate().settings.ignore = ":disabled,:hidden";

                // Start validation; Prevent going forward if false
                return form.valid();
            },
            onStepChanged: function (event, currentIndex, priorIndex)
            {
                // Suppress (skip) "Warning" step if the user is old enough.
                if (currentIndex === 2 && Number($("#age").val()) >= 18)
                {
                    $(this).steps("next");
                }

                // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
                if (currentIndex === 2 && priorIndex === 3)
                {
                    $(this).steps("previous");
                }
            },
            onFinishing: function (event, currentIndex)
            {
                var form = $(this);

                // Disable validation on fields that are disabled.
                // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
                form.validate().settings.ignore = ":disabled";

                // Start validation; Prevent form submission if false
                return form.valid();
            },
            onFinished: function (event, currentIndex)
            {
                var accept_goods_info_id = "";
                //获取收货地址
                $(".address").each(function () {
                    if($(this).hasClass('selected')){
                        accept_goods_info_id = $(this).find("#accept_info_id").text();
                    }
                })
                var priceList = "${realCallpriceDetail.callPriceMoney}";
                var total = 0;
                for(var i=0; i<priceList.length; i++){
                    total += parseInt(priceList[i]);
                }
                $.ajax({
                    url: "/order/makeOrderBill",
                    data:{
                        buyerId: ${currentUser.userId},
                        callPriceId: ${realCallpriceDetail.realCallId},
                        orderId: ${realCallpriceDetail.realOrderId},
                        expressWay: ${realCallpriceDetail.expressType},
                        remark: $("#remark").val(),
                        orderType: "REAL",
                        acceptGoodsInfoId: accept_goods_info_id,
                        sellerId:${realCallpriceDetail.userId},
                        orderPrice: total
                    },
                    success: function (result) {
                        if(result.code == 200) layer.msg("下单成功!")
                        setTimeout(function () {
                            location.href = '/profile/profilePage';
                        }, 2000)
                    },
                    error: function(result){
                        alert("下单出错");
                    }
                })

            }
        })
    });

</script>
</html>
