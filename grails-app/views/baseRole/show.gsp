
<%@ page import="com.petrodata.pms.core.BaseRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'baseRole.label', default: 'BaseRole')}" />
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
		<div class="col-lg-12" style="height: 10px">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</div><!--/.row-->

	<table class="table tile">
		

		<tr><th>	<span id="authority-label" class="property-label"><g:message code="baseRole.authority.label" default="Authority" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${baseRoleInstance}" field="authority"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="name-label" class="property-label"><g:message code="baseRole.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseRoleInstance}" field="name"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="type-label" class="property-label"><g:message code="baseRole.type.label" default="Type" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${baseRoleInstance}" field="type"/></span>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:baseRoleInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${baseRoleInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${baseRoleInstance?.id}" resource="${baseRoleInstance}">
				<span class="glyphicon glyphicon-edit"></span>
				<g:message code="default.button.edit.label" default="Edit" /></g:link>
			<button type="submit" name="_action_delete"
					class="btn btn-default margin"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
				<span class="glyphicon glyphicon-trash"></span>${message(code: 'default.button.delete.label', default: 'Delete')}</button>

		</fieldset>
	</g:form>

	</body>
</html>
