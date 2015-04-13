<%@ page import="com.petrodata.pms.equipment.Equipment" %>



<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'alias', 'error')} ">
	<label for="alias">
		<g:message code="equipment.alias.label" default="Alias" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="alias" value="${equipmentInstance?.alias}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'standard', 'error')} ">
	<label for="standard">
		<g:message code="equipment.standard.label" default="Standard" />
		
	</label>
	<g:select id="standard" name="standard.id" from="${com.petrodata.pms.equipment.Standard.list()}" optionKey="id" value="${equipmentInstance?.standard?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'equipmentRunningInfo', 'error')} ">
	<label for="equipmentRunningInfo">
		<g:message code="equipment.equipmentRunningInfo.label" default="Equipment Running Info" />
		
	</label>
	<g:select id="equipmentRunningInfo" name="equipmentRunningInfo.id" from="${com.petrodata.pms.equipment.EquipmentRunningInfo.list()}" optionKey="id" value="${equipmentInstance?.equipmentRunningInfo?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'techState', 'error')} ">
	<label for="techState">
		<g:message code="equipment.techState.label" default="Tech State" />
		
	</label>
	<g:select name="techState" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.techState.inList}" value="${equipmentInstance?.techState}" valueMessagePrefix="equipment.techState" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'serviceState', 'error')} ">
	<label for="serviceState">
		<g:message code="equipment.serviceState.label" default="Service State" />
		
	</label>
	<g:select name="serviceState" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.serviceState.inList}" value="${equipmentInstance?.serviceState}" valueMessagePrefix="equipment.serviceState" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'feature', 'error')} ">
	<label for="feature">
		<g:message code="equipment.feature.label" default="Feature" />
		
	</label>
	<g:select name="feature" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.feature.inList}" value="${equipmentInstance?.feature}" valueMessagePrefix="equipment.feature" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'series', 'error')} ">
	<label for="series">
		<g:message code="equipment.series.label" default="Series" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="series" maxlength="100" value="${equipmentInstance?.series}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'factoryCode', 'error')} required">
	<label for="factoryCode">
		<g:message code="equipment.factoryCode.label" default="Factory Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="factoryCode" maxlength="100" required="" value="${equipmentInstance?.factoryCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'factoryDate', 'error')} ">
	<label for="factoryDate">
		<g:message code="equipment.factoryDate.label" default="Factory Date" />
		
	</label>
	<g:datePicker name="factoryDate" precision="day"  value="${equipmentInstance?.factoryDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'arrivalDate', 'error')} ">
	<label for="arrivalDate">
		<g:message code="equipment.arrivalDate.label" default="Arrival Date" />
		
	</label>
	<g:datePicker name="arrivalDate" precision="day"  value="${equipmentInstance?.arrivalDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'acceptDate', 'error')} ">
	<label for="acceptDate">
		<g:message code="equipment.acceptDate.label" default="Accept Date" />
		
	</label>
	<g:datePicker name="acceptDate" precision="day"  value="${equipmentInstance?.acceptDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'assetsType', 'error')} ">
	<label for="assetsType">
		<g:message code="equipment.assetsType.label" default="Assets Type" />
		
	</label>
	<g:select name="assetsType" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.assetsType.inList}" value="${equipmentInstance?.assetsType}" valueMessagePrefix="equipment.assetsType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'purchaseContractNo', 'error')} ">
	<label for="purchaseContractNo">
		<g:message code="equipment.purchaseContractNo.label" default="Purchase Contract No" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="purchaseContractNo" maxlength="100" value="${equipmentInstance?.purchaseContractNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'baseDepartment', 'error')} required">
	<label for="baseDepartment">
		<g:message code="equipment.baseDepartment.label" default="Base Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="baseDepartment" name="baseDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.baseDepartment?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'belongDepartment', 'error')} required">
	<label for="belongDepartment">
		<g:message code="equipment.belongDepartment.label" default="Belong Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="belongDepartment" name="belongDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.belongDepartment?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="equipment.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="code" required="" value="${equipmentInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="equipment.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="country" required="" value="${equipmentInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'creater', 'error')} required">
	<label for="creater">
		<g:message code="equipment.creater.label" default="Creater" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creater" name="creater.id" from="${com.petrodata.pms.core.BaseUser.list()}" optionKey="id" required="" value="${equipmentInstance?.creater?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'equipmentCatagory', 'error')} required">
	<label for="equipmentCatagory">
		<g:message code="equipment.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipmentCatagory" name="equipmentCatagory.id" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" optionKey="id" required="" value="${equipmentInstance?.equipmentCatagory?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'inDepartment', 'error')} required">
	<label for="inDepartment">
		<g:message code="equipment.inDepartment.label" default="In Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="inDepartment" name="inDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.inDepartment?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isHSE', 'error')} ">
	<label for="isHSE">
		<g:message code="equipment.isHSE.label" default="Is HSE" />
		
	</label>
	<g:checkBox name="isHSE" value="${equipmentInstance?.isHSE}" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isKey', 'error')} ">
	<label for="isKey">
		<g:message code="equipment.isKey.label" default="Is Key" />
		
	</label>
	<g:checkBox name="isKey" value="${equipmentInstance?.isKey}" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isSecurity', 'error')} ">
	<label for="isSecurity">
		<g:message code="equipment.isSecurity.label" default="Is Security" />
		
	</label>
	<g:checkBox name="isSecurity" value="${equipmentInstance?.isSecurity}" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isWorking', 'error')} ">
	<label for="isWorking">
		<g:message code="equipment.isWorking.label" default="Is Working" />
		
	</label>
	<g:checkBox name="isWorking" value="${equipmentInstance?.isWorking}" />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="equipment.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" required="" value="${equipmentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentInstance, field: 'operationDate', 'error')} required">
	<label for="operationDate">
		<g:message code="equipment.operationDate.label" default="Operation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="operationDate" precision="day"  value="${equipmentInstance?.operationDate}"  />

</div>

