
<%@ page import="com.petrodata.pms.team.Position" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'position.label', default: 'Position')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-position" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list position">  <table class="table tile">
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="position.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${positionInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${positionInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="position.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${positionInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipmentCatagory-label" class="property-label"><g:message code="position.equipmentCatagory.label" default="Equipment Catagory" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${positionInstance?.equipmentCatagory?.id}">${positionInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${positionInstance?.equipmentCatagory}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipmentCatagory-label" class="property-label"><g:message code="position.equipmentCatagory.label" default="Equipment Catagory" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${positionInstance?.equipmentCatagory?.id}">${positionInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:positionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${positionInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${positionInstance?.id}" resource="${positionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
