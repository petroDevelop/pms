<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>


	<div class="row">
		<ol class="breadcrumb">
			<li><a href="\${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>

		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12" style="height: 30px">
			<!--<h1 class="page-header">
				<g:message code="default.create.label" args="[entityName]" /></h1>-->
			<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
				<ul class="errors" role="alert">
					<g:eachError bean="\${${propertyName}}" var="error">
						<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
		</div>
	</div><!--/.row-->
		<g:form url="[resource:${propertyName},controller:'${domainClass.propertyName}', action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
			<fieldset class="form">
				<g:render template="form"/>
			</fieldset>
			<fieldset class="buttons">
				<button class="btn btn-default margin" name="create" type="submit"><span class="glyphicon glyphicon-check"></span> &nbsp;\${message(code: 'default.button.create.label', default: 'Create')}</button>

			</fieldset>
		</g:form>

	</body>
</html>
