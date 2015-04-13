
<%@ page import="com.petrodata.pms.equipment.Equipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
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
		<div id="list-equipment" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="alias" title="${message(code: 'equipment.alias.label', default: 'Alias')}" />

					

						<th><g:message code="equipment.standard.label" default="Standard" /></th>
					

						<th><g:message code="equipment.equipmentRunningInfo.label" default="Equipment Running Info" /></th>
					
						<g:sortableColumn property="techState" title="${message(code: 'equipment.techState.label', default: 'Tech State')}" />

					
						<g:sortableColumn property="serviceState" title="${message(code: 'equipment.serviceState.label', default: 'Service State')}" />

					
						<g:sortableColumn property="feature" title="${message(code: 'equipment.feature.label', default: 'Feature')}" />

					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${equipmentInstanceList}" status="i" var="equipmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${equipmentInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "alias")}</g:link></td>

					

                        <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "standard")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "equipmentRunningInfo")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "techState")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "serviceState")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentInstance.id}">${fieldValue(bean: equipmentInstance, field: "feature")}</g:link></td>
					
                        <td><g:link action="edit" id="${equipmentInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/equipment/delete/${equipmentInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${equipmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
