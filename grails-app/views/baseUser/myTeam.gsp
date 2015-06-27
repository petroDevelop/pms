<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="luminoPro">
    <g:set var="entityName" value="${message(code: 'baseUser.label', default: 'BaseUser')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script>
        function changeInfo(){
            var obj = {};
            obj.isWorking = $("#isWorking").val();
            obj.reason = $("#reason").val();
            $.post("${request.contextPath}/baseUser/changeMyTeamInfo", obj,
                    function (data, textStatus) {
                        if (data.result) {
                            $('#alertSucess').removeClass('hide');
                            setTimeout(function(){
                                $('#alertSucess').addClass('hide');
                            }, 2000);
                        } else {
                            $('#alertFault').removeClass('hide');
                        }
                    }, "json");
        }
    </script>
</head>
<body>
<div class="row">
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>

    </ol>
</div><!--/.row-->

<div class="alert bg-success hide" id="alertSucess" role="alert">
    <span class="glyphicon glyphicon-check"></span>
    <g:message code="default.sucess.label" default="Sucess" />    <!--  data-dismiss="alert" -->
    <a href="#" class="pull-right" onclick="$('#alertSucess').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
</div>

<div class="alert bg-danger hide" id="alertFault" role="alert">
    <span class="glyphicon glyphicon-exclamation-sign"> </span>
    <span id="faultMessage">
        <g:message code="default.fault.label" default="Fault" />
    </span>

    <a href="#" class="pull-right" onclick="$('#alertFault').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
</div>

<div class="row">
    <div class="col-lg-12 form-group">
        <div class="panel panel-default">
            <div class="panel-heading">
                小队信息
            </div>
            <div class="panel-body">
<g:form url="[resource:baseDepartment,controller:'baseUser',  action:'myTeam']" method="post" >
                <div class="fieldcontain">
                    <label for="name">
                        <g:message code="baseDepartment.name.label" default="Name" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField class="form-control input-sm m-b-10"   readonly="readonly" disabled="disabled"
                                 name="name" required="" value="${baseDepartment?.name}" />
                </div>

                <div class="fieldcontain ">
                    <label for="parentShow">
                        <g:message code="baseDepartment.parent.label" default="Parent" />

                    </label>

                    <input type="text"  class="form-control input-sm m-b-10" name="parentShow"
                           value="${baseDepartment?.parent?.name}" readonly disabled/>

                </div>


                <div class="fieldcontain   ">
                    <label for="isWorking">
                        <g:message code="baseDepartment.isWorking.label" default="Is Working" />

                    </label>
                    <g:checkBox name="isWorking" id="isWorking" value="${baseDepartment?.isWorking}" />
                </div>

                <div class="fieldcontain  ">
                    <label for="reason">
                        <g:message code="baseDepartment.reason.label" default="Reason" />

                    </label>
                    <g:textField class="form-control input-sm m-b-10"  id="reason" name="reason" maxlength="100" value="${baseDepartment?.reason}"/>
                </div>

                <fieldset class="buttons">
                    <button class="btn btn-default margin" name="create" type="button" onclick="changeInfo()">
                        <span class="glyphicon glyphicon-check"></span> &nbsp;修改</button>

                </fieldset>
    </g:form>
            </div>
        </div>
    </div><!--/.row-->
</div>

</body>
</html>
