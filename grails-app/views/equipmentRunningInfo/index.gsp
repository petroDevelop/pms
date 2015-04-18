
<%@ page import="com.petrodata.pms.equipment.EquipmentRunningInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentRunningInfo.label', default: 'EquipmentRunningInfo')}" />
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
		<div id="list-equipmentRunningInfo" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="jobOrderInitDate" title="${message(code: 'equipmentRunningInfo.jobOrderInitDate.label', default: 'Check Init Date')}" />

					

						<th><g:message code="equipmentRunningInfo.equipment.label" default="Equipment" /></th>
					
						<g:sortableColumn property="lastOverhaulTime" title="${message(code: 'equipmentRunningInfo.lastOverhaulTime.label', default: 'Last Overhaul Time')}" />

					
						<g:sortableColumn property="maintenanceInitTime" title="${message(code: 'equipmentRunningInfo.maintenanceInitTime.label', default: 'Maintenance Init Time')}" />

					
						<g:sortableColumn property="totalTime" title="${message(code: 'equipmentRunningInfo.totalTime.label', default: 'Total Time')}" />

					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${equipmentRunningInfoInstanceList}" status="i" var="equipmentRunningInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${equipmentRunningInfoInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${equipmentRunningInfoInstance.id}">${fieldValue(bean: equipmentRunningInfoInstance, field: "jobOrderInitDate")}</g:link></td>

					

                        <td><g:link action="show" id="${equipmentRunningInfoInstance.id}">${fieldValue(bean: equipmentRunningInfoInstance, field: "equipment")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentRunningInfoInstance.id}">${fieldValue(bean: equipmentRunningInfoInstance, field: "lastOverhaulTime")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentRunningInfoInstance.id}">${fieldValue(bean: equipmentRunningInfoInstance, field: "maintenanceInitTime")}</g:link></td>
					

                        <td><g:link action="show" id="${equipmentRunningInfoInstance.id}">${fieldValue(bean: equipmentRunningInfoInstance, field: "totalTime")}</g:link></td>
					
                        <td><g:link action="edit" id="${equipmentRunningInfoInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/equipmentRunningInfo/delete/${equipmentRunningInfoInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${equipmentRunningInfoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
