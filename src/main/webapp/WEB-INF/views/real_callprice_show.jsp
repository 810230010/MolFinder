<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>实单报价页面</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <%--<link rel="stylesheet" href="/static/css/index.css">--%>
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
                            <input id="cas" type="text" class="form-control" value="${realDetail.casNo}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">英文名称:</label>
                        <div class="col-sm-7">
                            <input id="en_name" type="text" class="form-control" value="${realDetail.englishName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">中文名称:</label>
                        <div class="col-sm-7">
                            <input id="cn_name" type="text" class="form-control" value="${realDetail.chineseName}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">上传图片</label>
                        <div class="col-sm-7">
                            <div id="preview">
                                <img style="width:90px;height:90px" src="${realDetail.image}">
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">纯度要求:</label>
                        <div class="col-sm-7">
                            <input id="purity" type="text" class="form-control" value="${realDetail.purity}">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">采购量:</label>
                        <div class="col-sm-4">
                           <span class="col-sm-8">
                            <input id="amount" type="text" class="form-control" style="height:30px">
                           </span>
                            <span class="col-sm-4">
                            <select class="weight">
                                <option>g</option>
                                <option>mg</option>
                                <option>kg</option>
                            </select>
                           </span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">实单价格:</label>
                        <div class="input-group col-sm-4" style="position:relative;left: 20px">
                            <input id="lowPrice" type="text" class="input-sm form-control" name="lowPrice">
                            <span class="input-group-addon">-</span>
                            <input id="highPrice" type="text" class="input-sm form-control" name="highPrice">
                            <span class="input-group-addon">元</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">期望交货期:</label>
                        <div class="input-group col-sm-4" style="position:relative;left: 20px">
                            <c:set value="${ fn:split(realDetail.submitDeadline, '-') }" var="names" />
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
                                <option>HNMR</option>
                                <option>LCMS</option>
                                <option>CNMR</option>
                                <option>FNMR</option>
                                <option>HPLC</option>
                                <option>GC</option>
                                <option>GCMS</option>
                                <option>MS</option>
                                <option>Optical rotation</option>
                                <option>ee</option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">发票要求:</label>
                        <div class="col-sm-7">
                            <select class="col-sm-12 bill">
                                <option>不开发票</option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">抢单截止日期:</label>
                        <div class="col-sm-7">
                            <button id="1" class="medium ui inverted grey button" style="color: black;width:100px" onclick="getDeadline(1)">1天</button>
                            <button id="2" class="medium ui inverted grey button" style="color: black;width:100px" onclick="getDeadline(2)">2天</button>
                            <button id="3" class="medium ui inverted grey button" style="color: black;width:100px" onclick="getDeadline(3)">3天</button>
                            <input type="hidden" id="days"/>
                        </div>
                    </div>
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
                                            <p><input id="item1" type="checkbox">可付订单价<input id="content1" type="text" style="width: 60px">%至网站作保证金(默认0.5%)</p>
                                            <p><input id="item2" type="checkbox">提前交货可奖励订单价<input id="content2" type="text" style="width: 60px">%/天(默认0.5)</p>
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
                            <textarea id="remark" class="form-control" style="height:120px"></textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="text-center">
                            <input id="submit" type="submit" class="btn btn-primary" value="生成订单"/>
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
        $('#collapseOne').collapse('hide');
        $(".diagram").select2();
        $(".weight").select2({
            minimumResultsForSearch: -1
        });
        $(".bill").select2({
            minimumResultsForSearch: -1
        });

    });
    //表单验证提交
    $("#form").validate({
        submitHandler:function(form){
            var guaranteend = $("#item1").is(':checked');
            var reward = $("#item2").is(':checked')
            var guaranteeMoney;
            var rewardMoney;
            if(guaranteend == true && $("#content1").val() != ""){
                guaranteeMoney = $("#content1").val();
            }else if(guaranteend == true && $("#content1").val() == ""){
                guaranteeMoney = "0.5%";
            }else{
                guaranteeMoney = "";
            }
            if(reward == true && $("#content2").val() != ""){
                rewardMoney = $("#content2").val();
            }else if(reward == true && $("#content2").val() == ""){
                rewardMoney = "0.5%";
            }else{
                guaranteeMoney = "";
            }
            $.ajaxFileUpload({
                url: '/real/publishReal', //用于文件上传的服务器端请求地址
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'previewImg', //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                data:{
                    <%--userId: ${currentUser.userId},--%>
                    casNo: $("#cas").val(),
                    englishName: $("#en_name").val(),
                    chineseName: $("#cn_name").val(),
                    buyAmount: $("#amount").val() + $(".weight").val(),
                    image: $("#previewImg").val(),
                    purity: $("#purity").val(),
                    diagramRequire:$(".diagram").val(),
                    makeBill: $(".bill").val(),
                    endTime:$("#days").val(),
                    guaranteeMoneyPercent: guaranteeMoney,
                    rewardMoneyPercent: rewardMoney,
                    remark: $("#remark").val(),
                    priceBetween: $("#lowPrice").val() + "-" + $("#highPrice").val(),
                    submitDeadline: $("#beginWeek").val() + $("#endWeek").val(),
                },
                success: function (data, status)  //服务器成功响应处理函数
                {
                    alert(data.code)
                    if(data.code == 200){
                        swal("成功！", "发布实单成功", "success");
                        setTimeout(function () {
                            window.location.href = "/index/indexPage";
                        },2000)
                    }
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert("系统出错");
                }
            })
        },
        invalidHandler: function(form, validator) {return false;}
    });



    //点击期限事件
    function getDeadline(days){
        $("#"+days).addClass('active');
        removeOtherSelectedStyle(days);
        var deadLine = dateFtt("yyyy-MM-dd hh:mm:ss",addDays(new Date(), days));
        $("#days").val(deadLine);
        var show = "截止日期:" + deadLine;
        layer.tips(show, '#'+days, {
            tips: 3,
        });
    }

    //格式化日期
    function dateFtt(fmt,date)
    {
        var o = {
            "M+" : date.getMonth()+1,                 //月份
            "d+" : date.getDate(),                    //日
            "h+" : date.getHours(),                   //小时
            "m+" : date.getMinutes(),                 //分
            "s+" : date.getSeconds(),                 //秒
            "q+" : Math.floor((date.getMonth()+3)/3), //季度
            "S"  : date.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
    function addDays(theDate, days) {
        return new Date(theDate.getTime() + days*24*60*60*1000);
    }
    function removeOtherSelectedStyle(k){
        for(var i=1; i<=3; i++){
            if(i == k){
                continue;
            }else{
                $("#"+i).removeClass('active');
            }
        }
    }
</script>
</html>
