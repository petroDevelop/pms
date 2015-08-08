
<%@ page import="com.petrodata.pms.equipment.Equipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>

	<div class="row">
		<ol class="breadcrumb">
			<li><a  href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><g:link  action="teamList"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12" style="height: 10px">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
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

		<tr><th>	<span id="name-label" class="property-label"><g:message code="equipment.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentInstance}" field="name"/></span>
			</td>

		</tr>


		<tr><th>	<span id="alias-label" class="property-label"><g:message code="equipment.alias.label" default="Alias" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${equipmentInstance}" field="alias"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="standard-label" class="property-label"><g:message code="equipment.standard.label" default="Standard" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="standard-label">${equipmentInstance?.standard?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="equipmentRunningInfo-label" class="property-label"><g:message code="equipment.equipmentRunningInfo.label" default="Equipment Running Info" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="equipmentRunningInfo-label">${equipmentInstance?.equipmentRunningInfo?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="techState-label" class="property-label"><g:message code="equipment.techState.label" default="Tech State" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="techState-label"><g:fieldValue bean="${equipmentInstance}" field="techState"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="serviceState-label" class="property-label"><g:message code="equipment.serviceState.label" default="Service State" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="serviceState-label"><g:fieldValue bean="${equipmentInstance}" field="serviceState"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="feature-label" class="property-label"><g:message code="equipment.feature.label" default="Feature" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="feature-label"><g:fieldValue bean="${equipmentInstance}" field="feature"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="series-label" class="property-label"><g:message code="equipment.series.label" default="Series" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="series-label"><g:fieldValue bean="${equipmentInstance}" field="series"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="factoryCode-label" class="property-label"><g:message code="equipment.factoryCode.label" default="Factory Code" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="factoryCode-label"><g:fieldValue bean="${equipmentInstance}" field="factoryCode"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="factoryDate-label" class="property-label"><g:message code="equipment.factoryDate.label" default="Factory Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="factoryDate-label"><g:formatDate date="${equipmentInstance?.factoryDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="arrivalDate-label" class="property-label"><g:message code="equipment.arrivalDate.label" default="Arrival Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="arrivalDate-label"><g:formatDate date="${equipmentInstance?.arrivalDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="acceptDate-label" class="property-label"><g:message code="equipment.acceptDate.label" default="Accept Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="acceptDate-label"><g:formatDate date="${equipmentInstance?.acceptDate}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="assetsType-label" class="property-label"><g:message code="equipment.assetsType.label" default="Assets Type" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="assetsType-label"><g:fieldValue bean="${equipmentInstance}" field="assetsType"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="purchaseContractNo-label" class="property-label"><g:message code="equipment.purchaseContractNo.label" default="Purchase Contract No" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="purchaseContractNo-label"><g:fieldValue bean="${equipmentInstance}" field="purchaseContractNo"/></span>
				</td>

		</tr>



		<tr><th>	<span id="belongDepartment-label" class="property-label"><g:message code="equipment.belongDepartment.label" default="Belong Department" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="belongDepartment-label">${equipmentInstance?.belongDepartment?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="code-label" class="property-label"><g:message code="equipment.code.label" default="Code" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentInstance}" field="code"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="country-label" class="property-label"><g:message code="equipment.country.label" default="Country" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${equipmentInstance}" field="country"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="creater-label" class="property-label"><g:message code="equipment.creater.label" default="Creater" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="creater-label">${equipmentInstance?.creater?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="equipmentCatagory-label" class="property-label"><g:message code="equipment.equipmentCatagory.label" default="Equipment Catagory" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="equipmentCatagory-label">${equipmentInstance?.equipmentCatagory?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="inDepartment-label" class="property-label"><g:message code="equipment.inDepartment.label" default="In Department" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="inDepartment-label">${equipmentInstance?.inDepartment?.encodeAsHTML()}</span>
				</td>

		</tr>

		

		<tr><th>	<span id="isHSE-label" class="property-label"><g:message code="equipment.isHSE.label" default="Is HSE" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isHSE-label"><g:formatBoolean boolean="${equipmentInstance?.isHSE}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="isKey-label" class="property-label"><g:message code="equipment.isKey.label" default="Is Key" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isKey-label"><g:formatBoolean boolean="${equipmentInstance?.isKey}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="isSecurity-label" class="property-label"><g:message code="equipment.isSecurity.label" default="Is Security" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isSecurity-label"><g:formatBoolean boolean="${equipmentInstance?.isSecurity}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="isWorking-label" class="property-label"><g:message code="equipment.isWorking.label" default="Is Working" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="isWorking-label"><g:formatBoolean boolean="${equipmentInstance?.isWorking}" /></span>
				</td>

		</tr>

		

		<tr><th>	<span id="name-label" class="property-label"><g:message code="equipment.name.label" default="Name" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentInstance}" field="name"/></span>
				</td>

		</tr>

		

		<tr><th>	<span id="operationDate-label" class="property-label"><g:message code="equipment.operationDate.label" default="Operation Date" /></span></th>
			<td>
				<span class="property-value" aria-labelledby="operationDate-label"><g:formatDate date="${equipmentInstance?.operationDate}" /></span>
				</td>

		</tr>

		   </table>
			</div>
		</div>
	</body>
</html>
