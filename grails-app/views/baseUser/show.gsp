
<%@ page import="com.petrodata.pms.core.BaseUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'baseUser.label', default: 'BaseUser')}" />
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
		

		<tr><th>	<span id="username-label" class="property-label"><g:message code="baseUser.username.label" default="Username" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${baseUserInstance}" field="username"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="password-label" class="property-label"><g:message code="baseUser.password.label" default="Password" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${baseUserInstance}" field="password"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="email-label" class="property-label"><g:message code="baseUser.email.label" default="Email" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${baseUserInstance}" field="email"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="firstName-label" class="property-label"><g:message code="baseUser.firstName.label" default="First Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${baseUserInstance}" field="firstName"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="lastName-label" class="property-label"><g:message code="baseUser.lastName.label" default="Last Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${baseUserInstance}" field="lastName"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="baseDepartment-label" class="property-label"><g:message code="baseUser.baseDepartment.label" default="Base Department" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${baseUserInstance?.baseDepartment?.id}">${baseUserInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="position-label" class="property-label"><g:message code="baseUser.position.label" default="Position" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="position-label"><g:link controller="position" action="show" id="${baseUserInstance?.position?.id}">${baseUserInstance?.position?.encodeAsHTML()}</g:link></span>
				</td>

		</tr>

		

		<tr><th>	<span id="accountExpired-label" class="property-label"><g:message code="baseUser.accountExpired.label" default="Account Expired" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${baseUserInstance?.accountExpired}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="accountLocked-label" class="property-label"><g:message code="baseUser.accountLocked.label" default="Account Locked" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${baseUserInstance?.accountLocked}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="enabled-label" class="property-label"><g:message code="baseUser.enabled.label" default="Enabled" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${baseUserInstance?.enabled}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="passwordExpired-label" class="property-label"><g:message code="baseUser.passwordExpired.label" default="Password Expired" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${baseUserInstance?.passwordExpired}" /></span>
				</td>

		</tr>

		   </table>


	<g:form url="[resource:baseUserInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:hiddenField name="id" value="${baseUserInstance?.id}" />
			<g:link class="btn btn-default margin" action="edit"  id="${baseUserInstance?.id}" resource="${baseUserInstance}">
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
