
<%@ page import="com.petrodata.pms.equipment.Equipment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'equipment.label', default: 'Equipment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<div>

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="index"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.list.label" args="[entityName]" /></button></g:link>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="show-equipment" class="content scaffold-show" role="main">
			<h1 class="block-title"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipment">  <table class="table tile">
			

                    <tr><th>	<span id="alias-label" class="property-label"><g:message code="equipment.alias.label" default="Alias" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${equipmentInstance}" field="alias"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.alias}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="alias-label" class="property-label"><g:message code="equipment.alias.label" default="Alias" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${equipmentInstance}" field="alias"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="standard-label" class="property-label"><g:message code="equipment.standard.label" default="Standard" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${equipmentInstance?.standard?.id}">${equipmentInstance?.standard?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.standard}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="standard-label" class="property-label"><g:message code="equipment.standard.label" default="Standard" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="standard-label"><g:link controller="standard" action="show" id="${equipmentInstance?.standard?.id}">${equipmentInstance?.standard?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipmentRunningInfo-label" class="property-label"><g:message code="equipment.equipmentRunningInfo.label" default="Equipment Running Info" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipmentRunningInfo-label"><g:link controller="equipmentRunningInfo" action="show" id="${equipmentInstance?.equipmentRunningInfo?.id}">${equipmentInstance?.equipmentRunningInfo?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.equipmentRunningInfo}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipmentRunningInfo-label" class="property-label"><g:message code="equipment.equipmentRunningInfo.label" default="Equipment Running Info" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipmentRunningInfo-label"><g:link controller="equipmentRunningInfo" action="show" id="${equipmentInstance?.equipmentRunningInfo?.id}">${equipmentInstance?.equipmentRunningInfo?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="techState-label" class="property-label"><g:message code="equipment.techState.label" default="Tech State" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="techState-label"><g:fieldValue bean="${equipmentInstance}" field="techState"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.techState}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="techState-label" class="property-label"><g:message code="equipment.techState.label" default="Tech State" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="techState-label"><g:fieldValue bean="${equipmentInstance}" field="techState"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="serviceState-label" class="property-label"><g:message code="equipment.serviceState.label" default="Service State" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="serviceState-label"><g:fieldValue bean="${equipmentInstance}" field="serviceState"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.serviceState}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="serviceState-label" class="property-label"><g:message code="equipment.serviceState.label" default="Service State" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="serviceState-label"><g:fieldValue bean="${equipmentInstance}" field="serviceState"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="feature-label" class="property-label"><g:message code="equipment.feature.label" default="Feature" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="feature-label"><g:fieldValue bean="${equipmentInstance}" field="feature"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.feature}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="feature-label" class="property-label"><g:message code="equipment.feature.label" default="Feature" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="feature-label"><g:fieldValue bean="${equipmentInstance}" field="feature"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="series-label" class="property-label"><g:message code="equipment.series.label" default="Series" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="series-label"><g:fieldValue bean="${equipmentInstance}" field="series"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.series}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="series-label" class="property-label"><g:message code="equipment.series.label" default="Series" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="series-label"><g:fieldValue bean="${equipmentInstance}" field="series"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="factoryCode-label" class="property-label"><g:message code="equipment.factoryCode.label" default="Factory Code" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="factoryCode-label"><g:fieldValue bean="${equipmentInstance}" field="factoryCode"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.factoryCode}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="factoryCode-label" class="property-label"><g:message code="equipment.factoryCode.label" default="Factory Code" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="factoryCode-label"><g:fieldValue bean="${equipmentInstance}" field="factoryCode"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="factoryDate-label" class="property-label"><g:message code="equipment.factoryDate.label" default="Factory Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="factoryDate-label"><g:formatDate date="${equipmentInstance?.factoryDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.factoryDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="factoryDate-label" class="property-label"><g:message code="equipment.factoryDate.label" default="Factory Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="factoryDate-label"><g:formatDate date="${equipmentInstance?.factoryDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="arrivalDate-label" class="property-label"><g:message code="equipment.arrivalDate.label" default="Arrival Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="arrivalDate-label"><g:formatDate date="${equipmentInstance?.arrivalDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.arrivalDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="arrivalDate-label" class="property-label"><g:message code="equipment.arrivalDate.label" default="Arrival Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="arrivalDate-label"><g:formatDate date="${equipmentInstance?.arrivalDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="acceptDate-label" class="property-label"><g:message code="equipment.acceptDate.label" default="Accept Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="acceptDate-label"><g:formatDate date="${equipmentInstance?.acceptDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.acceptDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="acceptDate-label" class="property-label"><g:message code="equipment.acceptDate.label" default="Accept Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="acceptDate-label"><g:formatDate date="${equipmentInstance?.acceptDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="assetsType-label" class="property-label"><g:message code="equipment.assetsType.label" default="Assets Type" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="assetsType-label"><g:fieldValue bean="${equipmentInstance}" field="assetsType"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.assetsType}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="assetsType-label" class="property-label"><g:message code="equipment.assetsType.label" default="Assets Type" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="assetsType-label"><g:fieldValue bean="${equipmentInstance}" field="assetsType"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="purchaseContractNo-label" class="property-label"><g:message code="equipment.purchaseContractNo.label" default="Purchase Contract No" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="purchaseContractNo-label"><g:fieldValue bean="${equipmentInstance}" field="purchaseContractNo"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.purchaseContractNo}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="purchaseContractNo-label" class="property-label"><g:message code="equipment.purchaseContractNo.label" default="Purchase Contract No" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="purchaseContractNo-label"><g:fieldValue bean="${equipmentInstance}" field="purchaseContractNo"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="baseDepartment-label" class="property-label"><g:message code="equipment.baseDepartment.label" default="Base Department" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.baseDepartment?.id}">${equipmentInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.baseDepartment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="baseDepartment-label" class="property-label"><g:message code="equipment.baseDepartment.label" default="Base Department" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="baseDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.baseDepartment?.id}">${equipmentInstance?.baseDepartment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="belongDepartment-label" class="property-label"><g:message code="equipment.belongDepartment.label" default="Belong Department" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="belongDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.belongDepartment?.id}">${equipmentInstance?.belongDepartment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.belongDepartment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="belongDepartment-label" class="property-label"><g:message code="equipment.belongDepartment.label" default="Belong Department" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="belongDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.belongDepartment?.id}">${equipmentInstance?.belongDepartment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="code-label" class="property-label"><g:message code="equipment.code.label" default="Code" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentInstance}" field="code"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.code}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="code-label" class="property-label"><g:message code="equipment.code.label" default="Code" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${equipmentInstance}" field="code"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="country-label" class="property-label"><g:message code="equipment.country.label" default="Country" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${equipmentInstance}" field="country"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.country}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="country-label" class="property-label"><g:message code="equipment.country.label" default="Country" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${equipmentInstance}" field="country"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="creater-label" class="property-label"><g:message code="equipment.creater.label" default="Creater" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="creater-label"><g:link controller="baseUser" action="show" id="${equipmentInstance?.creater?.id}">${equipmentInstance?.creater?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.creater}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="creater-label" class="property-label"><g:message code="equipment.creater.label" default="Creater" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="creater-label"><g:link controller="baseUser" action="show" id="${equipmentInstance?.creater?.id}">${equipmentInstance?.creater?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="equipmentCatagory-label" class="property-label"><g:message code="equipment.equipmentCatagory.label" default="Equipment Catagory" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${equipmentInstance?.equipmentCatagory?.id}">${equipmentInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.equipmentCatagory}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="equipmentCatagory-label" class="property-label"><g:message code="equipment.equipmentCatagory.label" default="Equipment Catagory" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="equipmentCatagory-label"><g:link controller="equipmentCatagory" action="show" id="${equipmentInstance?.equipmentCatagory?.id}">${equipmentInstance?.equipmentCatagory?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="inDepartment-label" class="property-label"><g:message code="equipment.inDepartment.label" default="In Department" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="inDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.inDepartment?.id}">${equipmentInstance?.inDepartment?.encodeAsHTML()}</g:link></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.inDepartment}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="inDepartment-label" class="property-label"><g:message code="equipment.inDepartment.label" default="In Department" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="inDepartment-label"><g:link controller="baseDepartment" action="show" id="${equipmentInstance?.inDepartment?.id}">${equipmentInstance?.inDepartment?.encodeAsHTML()}</g:link></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isHSE-label" class="property-label"><g:message code="equipment.isHSE.label" default="Is HSE" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isHSE-label"><g:formatBoolean boolean="${equipmentInstance?.isHSE}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.isHSE}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isHSE-label" class="property-label"><g:message code="equipment.isHSE.label" default="Is HSE" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isHSE-label"><g:formatBoolean boolean="${equipmentInstance?.isHSE}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isKey-label" class="property-label"><g:message code="equipment.isKey.label" default="Is Key" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isKey-label"><g:formatBoolean boolean="${equipmentInstance?.isKey}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.isKey}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isKey-label" class="property-label"><g:message code="equipment.isKey.label" default="Is Key" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isKey-label"><g:formatBoolean boolean="${equipmentInstance?.isKey}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isSecurity-label" class="property-label"><g:message code="equipment.isSecurity.label" default="Is Security" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isSecurity-label"><g:formatBoolean boolean="${equipmentInstance?.isSecurity}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.isSecurity}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isSecurity-label" class="property-label"><g:message code="equipment.isSecurity.label" default="Is Security" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isSecurity-label"><g:formatBoolean boolean="${equipmentInstance?.isSecurity}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="isWorking-label" class="property-label"><g:message code="equipment.isWorking.label" default="Is Working" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="isWorking-label"><g:formatBoolean boolean="${equipmentInstance?.isWorking}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.isWorking}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isWorking-label" class="property-label"><g:message code="equipment.isWorking.label" default="Is Working" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isWorking-label"><g:formatBoolean boolean="${equipmentInstance?.isWorking}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="name-label" class="property-label"><g:message code="equipment.name.label" default="Name" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentInstance}" field="name"/></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.name}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="name-label" class="property-label"><g:message code="equipment.name.label" default="Name" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${equipmentInstance}" field="name"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			

                    <tr><th>	<span id="operationDate-label" class="property-label"><g:message code="equipment.operationDate.label" default="Operation Date" /></span></th>
                <td>
                    <span class="property-value" aria-labelledby="operationDate-label"><g:formatDate date="${equipmentInstance?.operationDate}" /></span>
                    </td>

                    </tr>






				%{--<g:if test="${equipmentInstance?.operationDate}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="operationDate-label" class="property-label"><g:message code="equipment.operationDate.label" default="Operation Date" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="operationDate-label"><g:formatDate date="${equipmentInstance?.operationDate}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			   </table>
			</ol>
			<g:form url="[resource:equipmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${equipmentInstance?.id}" />
					<g:link class="btn btn-info btn-sm m-t-10" action="edit"  id="${equipmentInstance?.id}" resource="${equipmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-info btn-sm m-t-10" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
