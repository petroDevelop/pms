<%@ page import="com.petrodata.pms.equipment.Standard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'standard.label', default: 'Standard')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>

	</head>
	<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			<li class="active" ><g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${standardInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${standardInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
		</div>
	</div><!--/.row-->

	<g:form url="[resource:standardInstance, action:'update']" method="PUT" >
	<g:hiddenField name="version" value="${standardInstance?.version}" />
	<g:hiddenField name="id" value="${standardInstance?.id}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<fieldset class="buttons">
			<button class="btn btn-default margin" name="edit" type="submit"><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.button.edit.label', default: 'Edit')}</button>

		</fieldset>
	</g:form>

	</body>
</html>
