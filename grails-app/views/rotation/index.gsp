
<%@ page import="com.petrodata.pms.team.Rotation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'rotation.label', default: 'Rotation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <script >


           $(function(){
                $('#ckAll').on('ifChecked', function(event) {
                    $('.listcheckone').iCheck('check');
                });
                $('#ckAll').on('ifUnchecked', function(event) {
                    $('.listcheckone').iCheck('uncheck');
                });
            });
        </script>


	</head>
	<body>

		<div >

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="list-rotation" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'rotation.name.label', default: 'Name')}" />

					
						<g:sortableColumn property="description" title="${message(code: 'rotation.description.label', default: 'Description')}" />

					

						<th><g:message code="rotation.baseDepartment.label" default="Base Department" /></th>
					
						<g:sortableColumn property="beginTime" title="${message(code: 'rotation.beginTime.label', default: 'Begin Time')}" />

					
						<g:sortableColumn property="checkTime" title="${message(code: 'rotation.checkTime.label', default: 'Check Time')}" />

					

						<th><g:message code="rotation.creater.label" default="Creater" /></th>
					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${rotationInstanceList}" status="i" var="rotationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${rotationInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "name")}</g:link></td>

					

                        <td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "description")}</g:link></td>
					

                        <td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "baseDepartment")}</g:link></td>
					

                        <td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "beginTime")}</g:link></td>
					

                        <td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "checkTime")}</g:link></td>
					

                        <td><g:link action="show" id="${rotationInstance.id}">${fieldValue(bean: rotationInstance, field: "creater")}</g:link></td>
					
                        <td><g:link action="edit" id="${rotationInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/rotation/delete/${rotationInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${rotationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
