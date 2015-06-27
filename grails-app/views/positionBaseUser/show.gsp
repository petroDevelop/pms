
<%@ page import="com.petrodata.pms.team.PositionBaseUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'positionBaseUser.label', default: 'PositionBaseUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a  href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			<li class="active" ><g:link  action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="default.show.label" args="[entityName]" />
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
				</div>
				<div class="panel-body">
					<table class="table tile">
						

						<tr><th>	<span id="baseUser-label" class="property-label"><g:message code="positionBaseUser.baseUser.label" default="Base User" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="baseUser-label"><g:link controller="baseUser" action="show" id="${positionBaseUserInstance?.baseUser?.id}">${positionBaseUserInstance?.baseUser?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						

						<tr><th>	<span id="position-label" class="property-label"><g:message code="positionBaseUser.position.label" default="Position" /></span></th>
							<td>
								<span class="property-value" aria-labelledby="position-label"><g:link controller="position" action="show" id="${positionBaseUserInstance?.position?.id}">${positionBaseUserInstance?.position?.encodeAsHTML()}</g:link></span>
								</td>

						</tr>

						   </table>
					<g:form url="[resource:positionBaseUserInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${positionBaseUserInstance?.id}" />
							<g:link class="btn btn-default margin" action="edit"  id="${positionBaseUserInstance?.id}" resource="${positionBaseUserInstance}">
								<span class="glyphicon glyphicon-edit"></span>
								<g:message code="default.button.edit.label" default="Edit" /></g:link>
							<button type="submit" name="_action_delete"
									class="btn btn-default margin"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
								<span class="glyphicon glyphicon-trash"></span>${message(code: 'default.button.delete.label', default: 'Delete')}</button>

						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div><!--/.row-->



	</body>
</html>
