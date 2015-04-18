<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>

<div>
				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
</div>
			<h1 class="block-title"><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${equipmentCatagoryInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${equipmentCatagoryInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

	<link rel="stylesheet" href="${request.contextPath}/js/EasyTree/css/easyTree.css">
	<script src="${request.contextPath}/js/EasyTree/src/easyTree.js"></script>
	<div class="modal fade" id="show" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<g:form  id="upload"  action="deploy" method="post" enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">select EquipmentCatagory</h4>
					</div>
					<div class="modal-body">
						${EquipmentCatagory.generatorTreeDiv()}
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm">Change</button>
						<button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
					</div>
				</div>
			</g:form>
		</div>
	</div>
	<script>
		function changeTree(obj){
			alert();
			$('#show').show();
		}
	</script>
			<g:form url="[resource:equipmentCatagoryInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-info btn-sm m-t-10" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>


	</body>
</html>
