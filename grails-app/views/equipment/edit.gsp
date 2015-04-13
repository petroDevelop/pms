<%@ page import="com.petrodata.pms.equipment.Equipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>
			<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="edit-equipment" class="content scaffold-edit" role="main">
			<h1 class="block-title"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${equipmentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${equipmentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:equipmentInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${equipmentInstance?.version}" />
            <g:hiddenField name="id" value="${equipmentInstance?.id}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="update" value="更新" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
