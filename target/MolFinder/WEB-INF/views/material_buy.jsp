<%--
  Created by IntelliJ IDEA.
  User: usher
  Date: 2017/8/17
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>原料采购</title>
    <%@include file="/WEB-INF/views/common/resource_css.jsp"%>
    <%@include file="/WEB-INF/views/common/resource_js.jsp"%>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
    <div class="row">
        <div class="span6">
            <ul class="breadcrumb">
                <li>
                    <a href="#">首页</a> <span class="divider"></span>
                </li>
                <li>
                    快速发布求购
                </li>
            </ul>
        </div>
    </div>
    <div class="col-md-8 col-md-offset-2" style="height:44px; line-height: 44px; background-color:green;border-radius: 10px;">
        <div>
        <i style="color: white" class="fa fa-tasks"></i><span style="margin-left: 20px;color: white">快速发布求购</span>
        </div>
    </div>
    <div class="col-md-8 col-md-offset-2" style="margin-top:40px;">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-md-3 control-label">CAS号:</label>
                <div class="col-md-6">
                    <input id="cas" type="text" class="form-control" placeholder="请输入cas号"/>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-md-3 control-label">求购数量:</label>
                <div class="col-md-6">
                    <div class="col-md-8">
                    <input id="amount1" type="text" class="form-control" placeholder="数量1"/>
                    </div>
                    <div class="col-md-4">
                        <select class="col-md-12 form-control" id="unit1">
                            <option value="g">g</option>
                            <option value="mg">mg</option>
                            <option value="kg">kg</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-6">
                    <div class="col-md-8">
                        <input id="amount2" type="text" class="form-control" placeholder="数量2"/>
                    </div>
                    <div class="col-md-4">
                        <select class="col-md-12 form-control" id="unit2">
                            <option value="g">g</option>
                            <option value="mg">mg</option>
                            <option value="kg">kg</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-md-3 control-label">收货区域:</label>
                <div class="col-md-6">
                    <input id="area" type="text" class="form-control" placeholder="请输入收货区域"/>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-md-3 control-label">备注:</label>
                <div class="col-md-6">
                    <textarea id="remark" class="col-md-12 form-control" style="height:150px" placeholder="产品纯度要求,开票类型,运输中有何特殊要求等."></textarea>
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-6 text-center">
                   <input id="submit" type="button" class="btn btn-success" value="发布求购"/>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
    //发布求购
    $("#submit").click(function () {
        var buyAmount;
        if($("#amount2").val() == ''){
            buyAmount = $("#amount1").val() + $("#unit1").val();
        }else{
            buyAmount = $("#amount1").val() + $("#unit1").val() + "," + $("#amount2").val() + $("#unit2").val();
        }
        $.ajax({
            url: "/material/publishMaterialBuy",
            data: {
                casNo: $("#cas").val(),
                userId: ${currentUser.userId},
                purchaseAmount: buyAmount,
                acceptGoodsPlace: $("#area").val(),
                remark: $("#remark").val()
            },
            success:function (result) {
                if(result.code == 200){
                    swal("成功！", "发布求购成功", "success");
                    setTimeout(function () {
                        window.location.reload();
                    },2000)
                }
            },
            error:function(result){
                alert("系统出错")
            }
        })
    })
</script>
</html>
