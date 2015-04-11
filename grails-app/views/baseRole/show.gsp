
<%@ page import="com.petrodata.pms.core.BaseRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseRole.label', default: 'BaseRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-baseRole" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list baseRole">  <table class="table tile">
			

                    <tr><th>	<span id="authority-label" class="property-label"><g:message code="baseRole.authority.label" default="Authority" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${baseRoleInstance}" field="authority"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseRoleInstance?.authority}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="authority-label" class="property-label"><g:message code="baseRole.authority.label" default="Authority" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${baseRoleInstance}" field="authority"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="baseRole.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseRoleInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseRoleInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="baseRole.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseRoleInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="type-label" class="property-label"><g:message code="baseRole.type.label" default="Type" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${baseRoleInstance}" field="type"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseRoleInstance?.type}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="type-label" class="property-label"><g:message code="baseRole.type.label" default="Type" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${baseRoleInstance}" field="type"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:baseRoleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${baseRoleInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${baseRoleInstance?.id}" resource="${baseRoleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
