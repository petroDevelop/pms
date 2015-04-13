
<%@ page import="com.petrodata.pms.team.Rotation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'rotation.label', default: 'Rotation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-rotation" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rotation">  <table class="table tile">
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="rotation.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${rotationInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="rotation.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${rotationInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="description-label" class="property-label"><g:message code="rotation.description.label" default="Description" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${rotationInstance}" field="description"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.description}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="description-label" class="property-label"><g:message code="rotation.description.label" default="Description" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${rotationInstance}" field="description"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="baseDepartment-label" class="property-label"><g:message code="rotation.baseDepartment.label" default="Base Department" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${rotationInstance?.baseDepartment?.id}">${rotationInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.baseDepartment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="baseDepartment-label" class="property-label"><g:message code="rotation.baseDepartment.label" default="Base Department" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${rotationInstance?.baseDepartment?.id}">${rotationInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="baseUsers-label" class="property-label"><g:message code="rotation.baseUsers.label" default="Base Users" /></span></th>
                <td>
                    <g:each in="${rotationInstance.baseUsers}" var="b">
                        <span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.baseUsers}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="baseUsers-label" class="property-label"><g:message code="rotation.baseUsers.label" default="Base Users" /></span>--}%
					%{----}%
						%{--<g:each in="${rotationInstance.baseUsers}" var="b">--}%
						%{--<span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="beginTime-label" class="property-label"><g:message code="rotation.beginTime.label" default="Begin Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="beginTime-label"><g:fieldValue bean="${rotationInstance}" field="beginTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.beginTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="beginTime-label" class="property-label"><g:message code="rotation.beginTime.label" default="Begin Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="beginTime-label"><g:fieldValue bean="${rotationInstance}" field="beginTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="checkTime-label" class="property-label"><g:message code="rotation.checkTime.label" default="Check Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="checkTime-label"><g:fieldValue bean="${rotationInstance}" field="checkTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.checkTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="checkTime-label" class="property-label"><g:message code="rotation.checkTime.label" default="Check Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="checkTime-label"><g:fieldValue bean="${rotationInstance}" field="checkTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="creater-label" class="property-label"><g:message code="rotation.creater.label" default="Creater" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="creater-label"><g:link controller="baseUser" action="show" id="${rotationInstance?.creater?.id}">${rotationInstance?.creater?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.creater}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="creater-label" class="property-label"><g:message code="rotation.creater.label" default="Creater" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="creater-label"><g:link controller="baseUser" action="show" id="${rotationInstance?.creater?.id}">${rotationInstance?.creater?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="endTime-label" class="property-label"><g:message code="rotation.endTime.label" default="End Time" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="endTime-label"><g:fieldValue bean="${rotationInstance}" field="endTime"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.endTime}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="endTime-label" class="property-label"><g:message code="rotation.endTime.label" default="End Time" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="endTime-label"><g:fieldValue bean="${rotationInstance}" field="endTime"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="timeZone-label" class="property-label"><g:message code="rotation.timeZone.label" default="Time Zone" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${rotationInstance}" field="timeZone"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${rotationInstance?.timeZone}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="timeZone-label" class="property-label"><g:message code="rotation.timeZone.label" default="Time Zone" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${rotationInstance}" field="timeZone"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:rotationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${rotationInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${rotationInstance?.id}" resource="${rotationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
