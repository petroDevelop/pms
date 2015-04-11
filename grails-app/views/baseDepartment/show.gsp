
<%@ page import="com.petrodata.pms.core.BaseDepartment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseDepartment.label', default: 'BaseDepartment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-baseDepartment" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list baseDepartment">  <table class="table tile">
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="baseDepartment.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseDepartmentInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="baseDepartment.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${baseDepartmentInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="parent-label" class="property-label"><g:message code="baseDepartment.parent.label" default="Parent" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="parent-label"><g:link controller="baseDepartment" action="show" id="${baseDepartmentInstance?.parent?.id}">${baseDepartmentInstance?.parent?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.parent}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="parent-label" class="property-label"><g:message code="baseDepartment.parent.label" default="Parent" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="parent-label"><g:link controller="baseDepartment" action="show" id="${baseDepartmentInstance?.parent?.id}">${baseDepartmentInstance?.parent?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="baseUsers-label" class="property-label"><g:message code="baseDepartment.baseUsers.label" default="Base Users" /></span></th>
                <td>
                    <g:each in="${baseDepartmentInstance.baseUsers}" var="b">
                        <span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.baseUsers}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="baseUsers-label" class="property-label"><g:message code="baseDepartment.baseUsers.label" default="Base Users" /></span>--}%
					%{----}%
						%{--<g:each in="${baseDepartmentInstance.baseUsers}" var="b">--}%
						%{--<span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="children-label" class="property-label"><g:message code="baseDepartment.children.label" default="Children" /></span></th>
                <td>
                    <g:each in="${baseDepartmentInstance.children}" var="c">
                        <span class="property-value" aria-labelledby="children-label"><g:link controller="baseDepartment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.children}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="children-label" class="property-label"><g:message code="baseDepartment.children.label" default="Children" /></span>--}%
					%{----}%
						%{--<g:each in="${baseDepartmentInstance.children}" var="c">--}%
						%{--<span class="property-value" aria-labelledby="children-label"><g:link controller="baseDepartment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isContainer-label" class="property-label"><g:message code="baseDepartment.isContainer.label" default="Is Container" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isContainer-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isContainer}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.isContainer}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isContainer-label" class="property-label"><g:message code="baseDepartment.isContainer.label" default="Is Container" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isContainer-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isContainer}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isTeam-label" class="property-label"><g:message code="baseDepartment.isTeam.label" default="Is Team" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isTeam-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isTeam}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${baseDepartmentInstance?.isTeam}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isTeam-label" class="property-label"><g:message code="baseDepartment.isTeam.label" default="Is Team" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isTeam-label"><g:formatBoolean boolean="${baseDepartmentInstance?.isTeam}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:baseDepartmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${baseDepartmentInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${baseDepartmentInstance?.id}" resource="${baseDepartmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
