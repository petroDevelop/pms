
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
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
		<div id="list-equipmentCatagory" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="specification" title="${message(code: 'equipmentCatagory.specification.label', default: 'Specification')}" />


						<g:sortableColumn property="code" title="${message(code: 'equipmentCatagory.code.label', default: 'Code')}" />

					
						<g:sortableColumn property="isSpecial" title="${message(code: 'equipmentCatagory.isSpecial.label', default: 'Is Special')}" />


						<g:sortableColumn property="name" title="${message(code: 'equipmentCatagory.name.label', default: 'Name')}" />



						<th><g:message code="equipmentCatagory.parent.label" default="Parent" /></th>
					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${equipmentCatagoryInstanceList}" status="i" var="equipmentCatagoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${equipmentCatagoryInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${equipmentCatagoryInstance.id}">${fieldValue(bean: equipmentCatagoryInstance, field: "specification")}</g:link></td>



                        <td><g:link action="show" id="${equipmentCatagoryInstance.id}">${fieldValue(bean: equipmentCatagoryInstance, field: "code")}</g:link></td>
					
						<td><g:formatBoolean boolean="${equipmentCatagoryInstance.isSpecial}" /></td>
                        <td><g:link action="show" id="${equipmentCatagoryInstance.id}">${fieldValue(bean: equipmentCatagoryInstance, field: "isSpecial")}</g:link></td>



                        <td><g:link action="show" id="${equipmentCatagoryInstance.id}">${fieldValue(bean: equipmentCatagoryInstance, field: "name")}</g:link></td>


                        <td><g:link action="show" id="${equipmentCatagoryInstance.id}">${fieldValue(bean: equipmentCatagoryInstance, field: "parent")}</g:link></td>
					
                        <td><g:link action="edit" id="${equipmentCatagoryInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/equipmentCatagory/delete/${equipmentCatagoryInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${equipmentCatagoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
