
<%@ page import="com.petrodata.pms.equipment.StandardItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'standardItem.label', default: 'StandardItem')}" />
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
		<div id="list-standardItem" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="type" title="${message(code: 'standardItem.type.label', default: 'Type')}" />

					
						<g:sortableColumn property="aim" title="${message(code: 'standardItem.aim.label', default: 'Aim')}" />

					
						<g:sortableColumn property="name" title="${message(code: 'standardItem.name.label', default: 'Name')}" />

					
						<g:sortableColumn property="range" title="${message(code: 'standardItem.range.label', default: 'Range')}" />

					
						<g:sortableColumn property="sop" title="${message(code: 'standardItem.sop.label', default: 'Sop')}" />

					
						<g:sortableColumn property="sopCode" title="${message(code: 'standardItem.sopCode.label', default: 'Sop Code')}" />

					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${standardItemInstanceList}" status="i" var="standardItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${standardItemInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "type")}</g:link></td>

					

                        <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "aim")}</g:link></td>
					

                        <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "name")}</g:link></td>
					

                        <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "range")}</g:link></td>
					

                        <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "sop")}</g:link></td>
					

                        <td><g:link action="show" id="${standardItemInstance.id}">${fieldValue(bean: standardItemInstance, field: "sopCode")}</g:link></td>
					
                        <td><g:link action="edit" id="${standardItemInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/standardItem/delete/${standardItemInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${standardItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
