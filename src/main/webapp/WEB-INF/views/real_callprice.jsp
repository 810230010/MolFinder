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
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none !important;
            margin: 0;
        }
    </style>
</head>
<body>
<div>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
</div>
<div id="top" class="col-md-8 col-md-offset-2">
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
                        <label class="col-sm-3 control-label">图片</label>
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
                            <input id="purity" type="text" class="form-control" value="${realDetail.purity}" readonly>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">采购量:</label>
                        <c:set var="g_index" value="${fn:indexOf(realDetail.buyAmount, 'g')}"></c:set>
                        <c:set var="amount" value="${fn:substring(realDetail.buyAmount, 0, g_index)}"></c:set>
                        <c:set var="unit" value="${fn:substring(realDetail.buyAmount, g_index, fn:length(realDetail.buyAmount))}"></c:set>
                        <div class="col-sm-4 input-group" style="position: relative;left:20px">
                            <input id="amount" type="number" class="input-sm form-control" name="lowPrice" value="${amount}">
                            <span class="input-group-addon">${unit}</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">出价:</label>
                        <div class="input-group col-sm-4" style="position:relative;left: 20px">
                            <input id="callprice" type="number" class="input-sm form-control" name="lowPrice">
                            <span class="input-group-addon">元</span>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">交货期:</label>
                        <div class="input-group col-sm-4" style="position:relative;left: 20px">
                            <%--<c:set value="${ fn:split(realDetail.submitDeadline, '-') }" var="names" />--%>
                            <input id="beginWeek" type="number" class="input-sm form-control" name="lowPrice">
                            <span class="input-group-addon">-</span>
                            <input id="endWeek" type="number" class="input-sm form-control" name="highPrice">
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
                        <label class="col-sm-3 control-label">发票:</label>
                        <div class="col-sm-7">
                            <select class="col-sm-12 bill">
                                <option>不开发票</option>
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
                                            <p><input id="item1" type="checkbox">需要预付款订单金额<input id="content1" type="text" style="width: 60px">%</p>
                                            <p><input id="item2" type="checkbox">接受预约金过期<input id="content2" type="text" style="width: 60px">%/天(默认1)订单金额</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注:</label>
                        <div class="col-sm-7">
                            <textarea id="remark" class="form-control" style="height:120px"></textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="text-center">
                            <input id="submit" type="button" class="btn btn-primary" value="下一步"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--录入报价-->
<div id="bottom" style="border-top: 1px solid grey;padding-top: 20px;padding-bottom: 100px;display: none" class="col-md-12">
    <div class="content container">
        <div class="content_title" style="background: darkgreen;color:white;height: 40px;width:150px;border-radius: 50px">
            <center><label style="line-height: 40px"><i class="fa fa-pencil" style="margin-right: 20px"></i>录入报价</label></center>
        </div>
        <div class="content_basic_inf" style="margin-top: 30px;border-bottom: 1px dashed silver">
            <div class="col-md-3">
                <label>CAS号：</label>
                <label>${realDetail.casNo}</label>
            </div>
            <div class="col-md-3">
                <label>中文名：</label>
                <label>${realDetail.chineseName}</label>
            </div>
            <div class="col-md-3">
                <label>重量：</label>
                <label>${realDetail.buyAmount}</label>
            </div>
            <div class="col-md-3">
                <label>发布日期：</label>
                <label><fmt:formatDate value="${realDetail.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div class="select_content" style="margin-top: 40px">
            <div class="col-md-3">
                <span>形状：</span>
                <select class="shape">
                    <option>固体</option>
                    <option>液体</option>
                    <option>油</option>
                    <option>晶体</option>
                    <option>粉末</option>
                </select>
            </div>
            <div class="col-md-3">
                <span>颜色：</span>
                <select class="color">
                    <option>白色</option>
                    <option>米白色</option>
                    <option>黄色</option>
                    <option>无色/透明</option>
                    <option>棕色/褐色</option>
                </select>
            </div>
            <div style="clear: both;"></div>
            <table class="table table-bordered" style="margin-top: 30px;border-radius:50px">
                <thead>
                    <tr>
                        <th>包装</th>
                        <th>规格</th>
                        <th>总价</th>
                        <th>纯度</th>
                        <th>配送方式</th>
                        <th>开票类型</th>
                        <th>期限</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:set var="unit_index" value="${fn:contains(realDetail.buyAmount, 'g') ? fn:indexOf(realDetail.buyAmount, 'g'): fn:indexOf(realDetail.buyAmount, 'kg')}"/>
                        <td>${fn:substring(realDetail.buyAmount, 0, unit_index)}</td>
                        <td>${fn:substring(realDetail.buyAmount, unit_index, fn:length(realDetail.buyAmount))}</td>
                        <td>
                            <div class="input-group">
                                <input id="callprice1" type="number" class="input-sm form-control">
                                <span class="input-group-addon">元</span>
                            </div>
                        </td>
                        <td><input type="text" id="purity1" class="form-control"/></td>
                        <td>
                            <select class="form-control express">
                                <option>送货上门</option>
                                <option>物流自提</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control bill1">
                                <option>不开票</option>
                                <option>增值税发票(普通)</option>
                                <option>增值税发票(17%)</option>
                            </select>
                        </td>
                        <td id="deadline"></td>
                    </tr>
                </tbody>
            </table>
            <div class="remark" >
                <span>报价备注:</span>
                <textarea id="remark1" class="form-control" style="display: block;margin-top:10px;width: 100%;height:100px"></textarea>
            </div>
        </div>

        <div class="sumbit_area" style="margin-top: 50px">
            <div class="left_button col-md-6">
                <button id="back" class="btn btn-default pull-right col-md-4">返回</button>
            </div>
            <div class="right_button col-md-6">
                <button id="sub" class="btn btn-warning pull-left col-md-4">提交</button>
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
</body>


<script>

    $(function(){
        $('#collapseOne').collapse('hide');
        $(".diagram").select2({
            minimumResultsForSearch: -1
        });
        var diagrams = "${realDetail.diagramRequire}";
        var diagramArr = diagrams.split(",");
        $('.diagram').val(diagramArr).trigger('change');
        $(".weight").select2({
            minimumResultsForSearch: -1
        });
        $(".bill").select2({
            minimumResultsForSearch: -1
        });

    });


      $("#submit").click(function () {
          var prepayed = $("#item1").is(':checked');
          var vilation = $("#item2").is(':checked')
          var prepayedMoney;
          var vilationMoney;
          if(prepayed == true && $("#content1").val() != ""){
              prepayedMoney = $("#content1").val();
          }else if(prepayed == true && $("#content1").val() == ""){
              prepayedMoney = "1";
          }else{
              prepayedMoney = "";
          }
          if(vilation == true && $("#content2").val() != ""){
              vilationMoney = $("#content2").val();
          }else if(vilation == true && $("#content2").val() == ""){
              vilationMoney = "1";
          }else{
              vilationMoney = "";
          }
          if($("#callprice").val() == ""){
              layer.msg("报价不得为空!");
              return;
          }
          if($("#beginWeek").val() == "" || $("#endWeek").val() == ""){
              layer.msg("期限不得为空");
              return;
          }
          $("#callprice1").val($("#callprice").val());
          $("#purity1").val($("#purity").val());
          $("#deadline").html($("#beginWeek").val() + "-" + $("#endWeek").val() + "周");
          $("#remark1").val($("#remark").val());
          $("#top").hide(100);
          $("#bottom").show(500);

          $("#back").click(function () {
              window.location.reload();
          });
          $("#sub").click(function () {
              $.ajax({
                  url: '/real/publishRealCallprice',
                  dataType: "json",
                  data:{
                      userId: ${currentUser.userId},
                      realOrderId: ${realDetail.realOrderId},
                      buyerId: ${realDetail.userId},
                      callPriceMoney: $("#callprice1").val() + "元",
                      callPriceAmount: '${realDetail.buyAmount}',
                      callPurity: $("#purity1").val(),
                      callSubmitDeadline: $("#deadline").text(),
                      offerDiagram:$(".diagram").val().join(','),
                      makeBill: $(".bill1").val(),
                      prepayedMoneyAmount: prepayedMoney,
                      vilationMoneyAmount: vilationMoney,
                      otherRequire: $("#remark1").val(),
                      expressType: $(".express").val(),
                      shape: $(".shape").val(),
                      color: $(".color").val()
                  },
                  success: function (result)  //服务器成功响应处理函数
                  {
                      if(result.code == 200){
                          layer.msg("实单报价成功!");
                          setTimeout(function () {
                              window.location.href = "real/realDetailPage?realOrderId" + ${realDetail.realOrderId};
                          },2000)
                      }
                  },
                  error: function (result)//服务器响应失败处理函数
                  {
                      alert("系统出错");
                  }
              })
          })

      })






</script>
</html>
