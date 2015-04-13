
<%@ page import="com.petrodata.pms.team.Position" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'position.label', default: 'Position')}" />
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
		<div id="list-position" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'position.name.label', default: 'Name')}" />

					

						<th><g:message code="position.equipmentCatagory.label" default="Equipment Catagory" /></th>
					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${positionInstanceList}" status="i" var="positionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${positionInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${positionInstance.id}">${fieldValue(bean: positionInstance, field: "name")}</g:link></td>

					

                        <td><g:link action="show" id="${positionInstance.id}">${fieldValue(bean: positionInstance, field: "equipmentCatagory")}</g:link></td>
					
                        <td><g:link action="edit" id="${positionInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/position/delete/${positionInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${positionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
