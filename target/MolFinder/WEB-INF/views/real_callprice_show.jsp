<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>他人实单报价详情页面</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <link rel="stylesheet" href="/static/css/plugins/semantic/semantic.min.css">
    <link href="/static/css/plugins/select2/select2.min.css" rel="stylesheet">

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
                <h3 id="rank">实单报价规则</h3>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal">
                    <label>真实有效</label>
                    <div class="form-group" style="padding-left: 20px;background: #f1f1f1">
                        <font class="col-md-12">所发实单必须保证真实有效，不得恶意发布虚假信息，一经发现永久封号.</font>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group" style="padding-left: 10px">
                        <h3>实单流程</h3>
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
                <h3>实单报价</h3>
            </div>
            <div class="ibox-title">
                <h4>基本要求</h4>
            </div>
            <div class="ibox-content">
                <form class="form-horizontal" id="form" onsubmit="return false">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="cas">CAS号:</label>
                        <div class="col-sm-7">
                            <input id="cas" type="text" class="form-control" value="${realCallpriceDetail.casNo}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文名称:</label>
                        <div class="col-sm-7">
                            <input id="en_name" type="text" class="form-control" value="${realCallpriceDetail.englishName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">中文名称:</label>
                        <div class="col-sm-7">
                            <input id="cn_name" type="text" class="form-control" value="${realCallpriceDetail.chineseName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">上传图片</label>
                        <div class="col-sm-7">
                            <div id="preview">
                                <img style="width:90px;height:90px" src="${realCallpriceDetail.image}">
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">纯度要求:</label>
                        <div class="col-sm-7">
                            <input id="purity" type="text" class="form-control" value="${realCallpriceDetail.callPurity}%">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                            <label class="col-sm-3 control-label">报价:</label>
                            <div class="col-sm-6" style="position:relative;left:-20px">
                            <c:forEach var="item" items="${realCallpriceDetail.realCallpriceCompleted}">
                                <div class="input-group col-sm-8" style="position:relative;left: 20px">
                                    <input type="text" class="input-sm form-control col-sm-6" value="${item}" readonly>
                                </div>
                            </c:forEach>
                            </div>

                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">期望交货期:</label>
                        <div class="input-group col-sm-4" style="position:relative;left: 20px">
                            <c:set value="${ fn:split(realCallpriceDetail.callSubmitDeadline, '-') }" var="names" />
                            <input id="beginWeek" type="text" class="input-sm form-control" readonly value="${realCallpriceDetail.callSubmitDeadline}">
                            <%--<span class="input-group-addon">-</span>--%>
                            <%--<input id="endWeek" type="text" class="input-sm form-control" readonly value="${names[1]}">--%>
                            <%--<span class="input-group-addon">周</span>--%>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">图谱要求:</label>
                        <div class="col-sm-7">
                            <c:set value="${ fn:split(realCallpriceDetail.offerDiagram, ',') }" var="names" />
                            <c:forEach var="item" items="${names}">
                            <a class="ui tag label">${item}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发票要求:</label>
                        <div class="col-sm-7">
                            <select class="col-sm-12 bill" disabled>
                                <option>${realCallpriceDetail.makeBill}</option>
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
                                        <p>可付订单价<input id="content1" type="text" style="width: 60px" value="${realCallpriceDetail.prepayedMoneyAmount}" readonly>%至网站作保证金(默认0.5%)</p>
                                        <p>接受违约金过期<input id="content2" type="text" style="width: 60px" value="${realCallpriceDetail.vilationMoneyAmount}" readonly>%/天(默认1%)</p>
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
                            <textarea id="remark" class="form-control" style="height:120px" readonly>${realCallpriceDetail.otherRequire}</textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="text-center">
                            <input id="submit" type="button" class="btn btn-primary" value="生成订单" onclick="jump2makeOrder()"/>
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
<!--预览图片-->
<script src="/static/js/preview.js" type="text/javascript"></script>
<!--bootstrap select-->
<script src="/static/js/plugins/select2/select2.full.min.js" type="text/javascript"></script>
<!--jquery validate-->
<script src="/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/js/plugins/validate/messages_zh.js"></script>
<script src="/static/js/ajaxfileupload.js"></script>
</body>


<script>

    $(function(){
        $('#collapseOne').collapse('show');
        var diagrams = "${realCallpriceDetail.offerDiagram}";
        var diagramArr = diagrams.split(",");
        $(".bill").select2({
            minimumResultsForSearch: -1
        });

    });


    //跳转到下单页面
    function jump2makeOrder() {
        window.location.href = "/order/realMakeOrderPage?realCallId=" + ${realCallpriceDetail.realCallId};
    }
</script>
</html>
