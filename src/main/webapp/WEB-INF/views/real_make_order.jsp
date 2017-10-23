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
        .select2-hidden-accessible{display: none}
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
        Validation Wizard Form
    </h2>
    <p>
        This example show how to use Steps with jQuery Validation plugin.
    </p>

    <form id="form" action="#" class="wizard-big">
        <h1>Account</h1>
        <fieldset>
            <h2>Account Information</h2>
            <div class="row">
                <div class="col-lg-8">
                    <div class="form-group">
                        <label>Username *</label>
                        <input id="userName" name="userName" type="text" class="form-control required">
                    </div>
                    <div class="form-group">
                        <label>Password *</label>
                        <input id="password" name="password" type="text" class="form-control required">
                    </div>
                    <div class="form-group">
                        <label>Confirm Password *</label>
                        <input id="confirm" name="confirm" type="text" class="form-control required">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="text-center">
                        <div style="margin-top: 20px">
                            <i class="fa fa-sign-in" style="font-size: 180px;color: #e5e5e5 "></i>
                        </div>
                    </div>
                </div>
            </div>

        </fieldset>
        <h1>Profile</h1>
        <fieldset>
            <h2>Profile Information</h2>
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>First name *</label>
                        <input id="name" name="name" type="text" class="form-control required">
                    </div>
                    <div class="form-group">
                        <label>Last name *</label>
                        <input id="surname" name="surname" type="text" class="form-control required">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Email *</label>
                        <input id="email" name="email" type="text" class="form-control required email">
                    </div>
                    <div class="form-group">
                        <label>Address *</label>
                        <input id="address" name="address" type="text" class="form-control">
                    </div>
                </div>
            </div>
        </fieldset>

        <h1>Warning</h1>
        <fieldset>
            <div class="text-center" style="margin-top: 120px">
                <h2>You did it Man :-)</h2>
            </div>
        </fieldset>

        <h1>Finish</h1>
        <fieldset>
            <h2>Terms and Conditions</h2>
            <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required"> <label for="acceptTerms">I agree with the Terms and Conditions.</label>
        </fieldset>
    </form>
</div>
</div>
</div>

</div>

<script>
    $(document).ready(function(){
        $("#wizard").steps();
        $("#form").steps({
            bodyTag: "fieldset",
            onStepChanging: function (event, currentIndex, newIndex)
            {
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
