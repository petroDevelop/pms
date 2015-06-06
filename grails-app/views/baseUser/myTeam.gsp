<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="luminoPro">
    <g:set var="entityName" value="${message(code: 'baseUser.label', default: 'BaseUser')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script>
        function changeInfo(){

        }
    </script>
</head>
<body>
<div class="row">
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>

    </ol>
</div><!--/.row-->


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
