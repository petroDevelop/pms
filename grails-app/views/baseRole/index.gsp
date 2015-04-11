
<%@ page import="com.petrodata.pms.core.BaseRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseRole.label', default: 'BaseRole')}" />
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
		<div id="list-baseRole" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="authority" title="${message(code: 'baseRole.authority.label', default: 'Authority')}" />

					
						<g:sortableColumn property="name" title="${message(code: 'baseRole.name.label', default: 'Name')}" />

					
						<g:sortableColumn property="type" title="${message(code: 'baseRole.type.label', default: 'Type')}" />

					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${baseRoleInstanceList}" status="i" var="baseRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${baseRoleInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${baseRoleInstance.id}">${fieldValue(bean: baseRoleInstance, field: "authority")}</g:link></td>

					

                        <td><g:link action="show" id="${baseRoleInstance.id}">${fieldValue(bean: baseRoleInstance, field: "name")}</g:link></td>
					

                        <td><g:link action="show" id="${baseRoleInstance.id}">${fieldValue(bean: baseRoleInstance, field: "type")}</g:link></td>
					
                        <td><g:link action="edit" id="${baseRoleInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/baseRole/delete/${baseRoleInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${baseRoleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
