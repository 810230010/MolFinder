<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>询单报价详情页面</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link rel="stylesheet" href="/static/css/plugins/semantic/semantic.min.css">
    <link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">
    <link href="/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <style>
        .select2-hidden-accessible{display: none}
    </style>
</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
</div>
<div class="hr-line-dashed" style="margin-top: 10px"></div>
<div class="col-md-8 col-md-offset-2" >
    <!--规则-->
    <div class="rules col-md-3" style="height:400px;padding-left: 0">

        <div class="ibox" style="border: 1px dashed #999">
            <div class="ibox-title">
                <h3 id="rank">询单报价规则</h3>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal">
                    <label>真实有效</label>
                    <div class="form-group" style="padding-left: 20px;background: #f1f1f1">
                        <font class="col-md-12">所发询单必须保证真实有效，不得恶意发布虚假信息，一经发现永久封号.</font>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group" style="padding-left: 10px">
                        <h3>询单流程</h3>
                        <ul style="list-style: none">
                            <li>1.需求方发布询单</li>
                            <li><i class="fa fa-arrow-circle-down"></i></li>
                            <li>2.供应方报价</li>
                            <li><i class="fa fa-arrow-circle-down"></i></li>
                            <li>3.需求方选择合适报价下单</li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>

    </div>

    <!--发布实单表单-->
    <div class="col-md-9">
        <div class="ibox">
            <div class="ibox-title text-center">
                <h3>询单报价</h3>
            </div>
            <div class="ibox-title">
                <h4>基本要求</h4>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal" id="form" onsubmit="return false">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="cas">CAS号:</label>
                        <div class="col-sm-7">
                            <input id="cas" type="text" class="form-control" value="${queryCallpriceDetail.casNo}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文名称:</label>
                        <div class="col-sm-7">
                            <input id="en_name" type="text" class="form-control" value="${queryCallpriceDetail.englishName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">中文名称:</label>
                        <div class="col-sm-7">
                            <input id="cn_name" type="text" class="form-control" value="${queryCallpriceDetail.chineseName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">上传图片</label>
                        <div class="col-sm-7">
                            <div id="preview">
                                <img style="width:90px;height:90px" src="${queryCallpriceDetail.image}">
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">纯度要求:</label>
                        <div class="col-sm-7">
                            <input id="purity" type="text" class="form-control" value="${queryCallpriceDetail.callPurity}">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">报价:</label>
                        <div class="input-group col-sm-7" style="position:relative;left: 20px">
                            <c:set value="${ fn:split(queryCallpriceDetail.callPriceMoney, '/') }" var="amountList" />
                            <c:set var="amount" value="${ fn:substring(amountList[0], 0, fn:indexOf(amountList[0], '元')) }"/>
                                <span style="margin-top:30px">
                                    <input id="price" class="input-sm" type="text" name="lowPrice" value="${amount}">元/
                                    <input id="amount" class="input-sm" type="text" name="highPrice" value="${amountList[1]}" readonly>
                                </span>


                        </div>

                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                            <label class="col-sm-3 control-label">期望交货期:</label>
                            <div class="input-group col-sm-4" style="position:relative;left: 20px">
                                <c:set value="${ fn:split(queryCallpriceDetail.callSubmitDeadline, '-') }" var="names" />
                                <input id="beginWeek" type="text" class="input-sm form-control" name="lowPrice" value="${names[0]}">
                                <span class="input-group-addon">-</span>
                                <input id="endWeek" type="text" class="input-sm form-control" name="highPrice" value="${names[1]}">
                                <span class="input-group-addon">周</span>
                            </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">图谱要求:</label>
                        <div class="col-sm-7">
                            <select class="col-sm-12 diagram" multiple="multiple">
                                <option value="HNMR">HNMR</option>
                                <option value="LCMS">LCMS</option>
                                <option value="CNMR">CNMR</option>
                                <option value="FNMR">FNMR</option>
                                <option value="HPLC">HPLC</option>
                                <option value="GC">GC</option>
                                <option value="GCMS">GCMS</option>
                                <option value="MS">MS</option>
                                <option value="Optical rotation">Optical rotation</option>
                                <option value="ee">ee</option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发票要求:</label>
                        <div class="col-sm-7">
                            <select class="col-sm-12 bill">
                                <option value="增值税17%">增值税17%</option>
                                <option value="不开发票">不开发票</option>

                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="ibox-title">
                        <h4>其他项设置</h4>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">保奖设置:</label>
                        <div class="col-sm-7">
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
                                        <p>可付订单价<input id="content1" type="text" style="width: 60px" value="${queryCallpriceDetail.prepayedMoneyAmount}">%至网站作保证金(默认0.5%)</p>
                                        <p>接受违约金过期<input id="content2" type="text" style="width: 60px" value="${queryCallpriceDetail.vilationMoneyAmount}">%/天(默认1%)</p>
                                    </div>
                                </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">其他要求:</label>
                        <div class="col-sm-7">
                            <textarea id="remark" class="form-control" style="height:120px">${queryCallpriceDetail.otherRequire}</textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="text-center">
                            <input id="submit" type="button" class="btn btn-primary" value="修改报价" onclick="updateQueryCallprice()"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
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

<script src="/static/js/plugins/sweetalert/sweetalert.min.js" type="text/javascript"></script>
</body>


<script>

    $(function(){
        $('#collapseOne').collapse('show');
        $(".diagram").select2({
            minimumResultsForSearch: -1
        });
        var diagrams = "${queryCallpriceDetail.offerDiagram}";
        var diagramArr = diagrams.split(",");
        $('.diagram').val(diagramArr).trigger('change');
        $(".bill").select2({
            minimumResultsForSearch: -1
        });
        var diagrams = "${queryCallpriceDetail.offerDiagram}";
        var diagramArr = diagrams.split(",");
        $(".bill").select2({
            minimumResultsForSearch: -1
        });
        var bill = "${queryCallpriceDetail.makeBill}";
        $('.bill').val(bill).trigger('change');
    });


    //跳转到下单页面
    function updateQueryCallprice() {
        var callPriceMoney = $("#price").val() + "元" + "/" + $("#amount").val();
        $.ajax({
            url: "/enquiry/updateQueryOrderCallprice",
            data:{
                queryCallId: ${queryCallpriceDetail.queryCallId},
                queryOrderId: ${queryCallpriceDetail.queryOrderId},
                callPurity: $("#purity").val(),
                callSubmitDeadline: $("#beginWeek").val() + "-" +$("#endWeek").val(),
                offerDiagram: $(".diagram").val().join(","),
                makeBill: $(".bill").val(),
                otherRequire: $("#remark").val(),
                prepayedMoneyAmount: $("#content1").val(),
                vilationMoneyAmount: $("#content2").val(),
                callPriceMoney: callPriceMoney
            },
            success: function (result) {
                if(result.code == 200){
                    swal("成功！", "修改询单报价成功", "success");
                    setTimeout(function () {
                        window.location.reload();
                    },2000)
                }
            },
            error: function (result) {
                alert("修改询单报价失败!");
            }
        })
    }
</script>
</html>
