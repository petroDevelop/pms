<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'rotation.label', default: 'Rotation')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>


	<div class="row">
		<ol class="breadcrumb">
			<li>
				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
			</li>
			<li class="active" >

				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
			</li>

		</ol>
	</div><!--/.row-->

	<div class="row" >
		<div class="col-lg-12 form-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="default.create.label" args="[entityName]" />
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${rotationInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${rotationInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
				</div>
				<div class="panel-body">
					<g:form url="[resource:rotationInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-info btn-sm m-t-10" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div><!--/.row-->
	</body>
</html>
