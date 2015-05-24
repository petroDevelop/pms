
<%@ page import="com.petrodata.pms.team.Rotation" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="luminoPro">
	<g:set var="entityName" value="${message(code: 'rotation.label', default: 'Rotation')}" />
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


					<tr><th>	<span id="name-label" class="property-label"><g:message code="rotation.name.label" default="Name" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${rotationInstance}" field="name"/></span>
						</td>

					</tr>



					<tr><th>	<span id="description-label" class="property-label"><g:message code="rotation.description.label" default="Description" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${rotationInstance}" field="description"/></span>
						</td>

					</tr>



					<tr><th>	<span id="baseDepartment-label" class="property-label"><g:message code="rotation.baseDepartment.label" default="Base Department" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${rotationInstance?.baseDepartment?.id}">${rotationInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>
						</td>

					</tr>



					<tr><th>	<span id="baseUsers-label" class="property-label"><g:message code="rotation.baseUsers.label" default="Base Users" /></span></th>
						<td>
							<g:each in="${rotationInstance.baseUsers}" var="b">
								<span class="property-value" aria-labelledby="baseUsers-label"><g:link controller="baseUser" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
							</g:each>
						</td>

					</tr>



					<tr><th>	<span id="beginTime-label" class="property-label"><g:message code="rotation.beginTime.label" default="Begin Time" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="beginTime-label"><g:fieldValue bean="${rotationInstance}" field="beginTime"/></span>
						</td>

					</tr>



					<tr><th>	<span id="chargeDailyCheck-label" class="property-label"><g:message code="rotation.chargeDailyCheck.label" default="Charge Daily Check" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="chargeDailyCheck-label"><g:formatBoolean boolean="${rotationInstance?.chargeDailyCheck}" /></span>
						</td>

					</tr>



					<tr><th>	<span id="checkTime-label" class="property-label"><g:message code="rotation.checkTime.label" default="Check Time" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="checkTime-label"><g:fieldValue bean="${rotationInstance}" field="checkTime"/></span>
						</td>

					</tr>



					<tr><th>	<span id="creator-label" class="property-label"><g:message code="rotation.creater.label" default="Creator" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="creator-label"><g:link controller="baseUser" action="show" id="${rotationInstance?.creator?.id}">${rotationInstance?.creator?.encodeAsHTML()}</g:link></span>
						</td>

					</tr>



					<tr><th>	<span id="endTime-label" class="property-label"><g:message code="rotation.endTime.label" default="End Time" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="endTime-label"><g:fieldValue bean="${rotationInstance}" field="endTime"/></span>
						</td>

					</tr>



					<tr><th>	<span id="timeZone-label" class="property-label"><g:message code="rotation.timeZone.label" default="Time Zone" /></span></th>
						<td>
							<span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${rotationInstance}" field="timeZone"/></span>
						</td>

					</tr>

				</table>
				<g:form url="[resource:rotationInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${rotationInstance?.id}" />
						<g:link class="btn btn-default margin" action="edit"  id="${rotationInstance?.id}" resource="${rotationInstance}">
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
