
<%@ page import="com.petrodata.pms.equipment.EquipmentStandardHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentStandardHistory.label', default: 'EquipmentStandardHistory')}" />
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
		<div id="list-equipmentStandardHistory" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="beginDate" title="${message(code: 'equipmentStandardHistory.beginDate.label', default: 'Begin Date')}" />

					
						<g:sortableColumn property="endDate" title="${message(code: 'equipmentStandardHistory.endDate.label', default: 'End Date')}" />

					

						<th><g:message code="equipmentStandardHistory.equipment.label" default="Equipment" /></th>
					

						<th><g:message code="equipmentStandardHistory.standard.label" default="Standard" /></th>
					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${equipmentStandardHistoryInstanceList}" status="i" var="equipmentStandardHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${equipmentStandardHistoryInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${equipmentStandardHistoryInstance.id}">${fieldValue(bean: equipmentStandardHistoryInstance, field: "beginDate")}</g:link></td>

					
						<td><g:formatDate date="${equipmentStandardHistoryInstance.endDate}" /></td>
                        <td><g:link action="show" id="${equipmentStandardHistoryInstance.id}">${fieldValue(bean: equipmentStandardHistoryInstance, field: "endDate")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentStandardHistoryInstance.id}">${fieldValue(bean: equipmentStandardHistoryInstance, field: "equipment")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentStandardHistoryInstance.id}">${fieldValue(bean: equipmentStandardHistoryInstance, field: "standard")}</g:link></td>
					
                        <td><g:link action="edit" id="${equipmentStandardHistoryInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/equipmentStandardHistory/delete/${equipmentStandardHistoryInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${equipmentStandardHistoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
