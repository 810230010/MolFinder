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
    <link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">

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
<!--bootstrap select-->
<script src="/static/js/plugins/select2/select2.full.min.js" type="text/javascript"></script>
<!--jquery validate-->
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.js"></script>
<script src="/static/js/ajaxfileupload.js"></script>
<!-- Steps -->
<script src="/static/js/plugins/steps/jquery.steps.min.js"></script>
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
                        <th>20171010</th>
                        <th>123123</th>
                        <th>按实际困难大</th>
                        <th colspan="2">25g,30g</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>25g</td>
                        <td>1500(含增值税)</td>
                        <td>98%</td>
                        <td>1天</td>
                        <td>快递到门</td>
                    </tr>
                    <tr>
                        <td>30g</td>
                        <td>1500(含增值税)</td>
                        <td>98%</td>
                        <td>1天</td>
                        <td>快递到门</td>
                    </tr>
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
                    <label class="col-sm-3 control-label">CAS号: 1923111</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">开票类型: ¥1500(增值税发票17%)/25g</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">纯度: 98%</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">快递方式: 送货上门</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-12 control-label">交货期: 3-4周</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">提供图谱:</label>
                    <div class="col-sm-11">
                        <c:set value="${ fn:split(realCallpriceDetail.offerDiagram, ',') }" var="names" />
                            <a class="ui teal tag label">hsad</a>
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
                                        <p>可付订单价<input id="content1" type="text" style="width: 60px;display:inline">%至网站作保证金(默认0.5%)</p>
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
                    <div class="col-sm-4 address">
                        <dl>
                            <dd>
                                江建平(17858936109)
                            </dd>
                            <dd>北京西三旗小营东路5号院</dd>
                        </dl>
                    </div>

                    <div class="col-sm-4 address" >
                        <dl>
                            <dd>
                                江建平(17858936109)
                            </dd>
                            <dd>北京西三旗小营东路5号院</dd>
                        </dl>
                    </div>
                    <div class="col-sm-4 address" >
                        <dl>
                            <dd>
                                江建平(17858936109)
                            </dd>
                            <dd>北京西三旗小营东路5号院</dd>
                        </dl>
                    </div>
                    <div class="col-sm-4 text-center addressAdd" style="height:100px;background-color: #e0e1e2;padding: 20px 20px;margin-top:20px;cursor: pointer;padding-top: 10px;border-radius: 20px">
                        <img src="/static/img/icons/add.png"/>
                        <p>添加地址</p>
                    </div>
                </div>
            </div>

        </fieldset>

        <h1>完成</h1>
        <fieldset>
            <h2>下单成功!</h2>
        </fieldset>
    </form>
</div>
</div>
</div>

</div>

<script>

     //ajax获得收货地址列表
     function regreshAcceptGoodsAddress(){
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
                         "                            <dd>result[i].contact_tel</dd>\n" +
                         "                            <dd>result[i].acceptGoodsAddress</dd>\n" +
                         "                        </dl>\n" +
                         "                    </div>")
                 }
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
                    $(".address").mouseover(function () {
                        $(this).addClass('hover');
                    }).mouseleave(function () {
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
                    $(".addressAdd").click(function () {
                        //iframe层-父子操作
                        layer.open({
                            type: 2,
                            area: ['700px', '450px'],
                            fixed: false, //不固定
                            maxmin: true,
                            content: '/order/addAcceptOrderAddress',
                            end: function () {
                                refreshAcceptGoodsAddress()
                            }

                        });
                    })
                }
                // Always allow going backward even if the current step contains invalid fields!
                if (currentIndex > newIndex)
                {
                    return true;
                }

                // Forbid suppressing "Warning" step if the user is to young
                if (newIndex === 3 && Number($("#age").val()) < 18)
                {
                    return false;
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
                var form = $(this);

                // Submit form input
                form.submit();
            }
        }).validate({
            errorPlacement: function (error, element)
            {
                element.before(error);
            },
            rules: {
                confirm: {
                    equalTo: "#password"
                }
            }
        });
    });

</script>
</html>
