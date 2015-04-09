
<%@ page import="com.petrodata.pms.core.BaseUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseUser.label', default: 'BaseUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-baseUser" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list baseUser">  <table class="table tile">
			

                    <tr><th>	<span id="username-label" class="property-label"><g:message code="baseUser.username.label" default="Username" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${baseUserInstance}" field="username"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.username}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="username-label" class="property-label"><g:message code="baseUser.username.label" default="Username" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${baseUserInstance}" field="username"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="password-label" class="property-label"><g:message code="baseUser.password.label" default="Password" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${baseUserInstance}" field="password"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.password}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="password-label" class="property-label"><g:message code="baseUser.password.label" default="Password" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${baseUserInstance}" field="password"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="email-label" class="property-label"><g:message code="baseUser.email.label" default="Email" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${baseUserInstance}" field="email"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.email}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="email-label" class="property-label"><g:message code="baseUser.email.label" default="Email" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${baseUserInstance}" field="email"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="firstName-label" class="property-label"><g:message code="baseUser.firstName.label" default="First Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${baseUserInstance}" field="firstName"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.firstName}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="firstName-label" class="property-label"><g:message code="baseUser.firstName.label" default="First Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${baseUserInstance}" field="firstName"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="lastName-label" class="property-label"><g:message code="baseUser.lastName.label" default="Last Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${baseUserInstance}" field="lastName"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.lastName}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="lastName-label" class="property-label"><g:message code="baseUser.lastName.label" default="Last Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${baseUserInstance}" field="lastName"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%


                    <tr><th>	<span id="baseDepartment-label" class="property-label"><g:message code="baseUser.baseDepartment.label" default="Base Department" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${baseUserInstance?.baseDepartment?.id}">${baseUserInstance?.baseDepartment.name?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>





				%{--<g:if test="${baseUserInstance?.baseDepartment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="baseDepartment-label" class="property-label"><g:message code="baseUser.baseDepartment.label" default="Base Department" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${baseUserInstance?.baseDepartment?.id}">${baseUserInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="position-label" class="property-label"><g:message code="baseUser.position.label" default="Position" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="position-label"><g:link controller="position" action="show" id="${baseUserInstance?.position?.id}">${baseUserInstance?.position?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.position}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="position-label" class="property-label"><g:message code="baseUser.position.label" default="Position" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="position-label"><g:link controller="position" action="show" id="${baseUserInstance?.position?.id}">${baseUserInstance?.position?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="accountExpired-label" class="property-label"><g:message code="baseUser.accountExpired.label" default="Account Expired" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${baseUserInstance?.accountExpired}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.accountExpired}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="accountExpired-label" class="property-label"><g:message code="baseUser.accountExpired.label" default="Account Expired" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${baseUserInstance?.accountExpired}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="accountLocked-label" class="property-label"><g:message code="baseUser.accountLocked.label" default="Account Locked" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${baseUserInstance?.accountLocked}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.accountLocked}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="accountLocked-label" class="property-label"><g:message code="baseUser.accountLocked.label" default="Account Locked" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${baseUserInstance?.accountLocked}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="enabled-label" class="property-label"><g:message code="baseUser.enabled.label" default="Enabled" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${baseUserInstance?.enabled}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.enabled}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="enabled-label" class="property-label"><g:message code="baseUser.enabled.label" default="Enabled" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${baseUserInstance?.enabled}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="passwordExpired-label" class="property-label"><g:message code="baseUser.passwordExpired.label" default="Password Expired" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${baseUserInstance?.passwordExpired}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseUserInstance?.passwordExpired}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="passwordExpired-label" class="property-label"><g:message code="baseUser.passwordExpired.label" default="Password Expired" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${baseUserInstance?.passwordExpired}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:baseUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${baseUserInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${baseUserInstance?.id}" resource="${baseUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
