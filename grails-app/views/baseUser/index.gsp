
<%@ page import="com.petrodata.pms.core.BaseUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseUser.label', default: 'BaseUser')}" />
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
		<div id="list-baseUser" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="username" title="${message(code: 'baseUser.username.label', default: 'Username')}" />

					
						<g:sortableColumn property="password" title="${message(code: 'baseUser.password.label', default: 'Password')}" />

					
						<g:sortableColumn property="email" title="${message(code: 'baseUser.email.label', default: 'Email')}" />

					
						<g:sortableColumn property="firstName" title="${message(code: 'baseUser.firstName.label', default: 'First Name')}" />

					
						<g:sortableColumn property="lastName" title="${message(code: 'baseUser.lastName.label', default: 'Last Name')}" />

					

						<th><g:message code="baseUser.baseDepartment.label" default="Base Department" /></th>
					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${baseUserInstanceList}" status="i" var="baseUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${baseUserInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "username")}</g:link></td>

					

                        <td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "password")}</g:link></td>
					

                        <td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "email")}</g:link></td>
					

                        <td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "firstName")}</g:link></td>
					

                        <td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "lastName")}</g:link></td>
					

                        <td><g:link action="show" id="${baseUserInstance.id}">${fieldValue(bean: baseUserInstance, field: "baseDepartment")}</g:link></td>
					
                        <td><g:link action="edit" id="${baseUserInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/baseUser/delete/${baseUserInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${baseUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
