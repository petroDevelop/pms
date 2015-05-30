<%@ page import="com.petrodata.pms.equipment.Equipment" %>

<g:if test="${!equipmentInstance}">
	<g:set var="equipmentInstance" value="${new com.petrodata.pms.equipment.Equipment()}"/>
</g:if>


<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'name', 'error')} required">
	<label class="col-sm-2  control-label"  for="name">
		<g:message code="equipment.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="name" required="" value="${equipmentInstance?.name}"/>
	</div>
</div>
<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'alias', 'error')} ">
	<label class="col-sm-2  control-label"  for="alias">
		<g:message code="equipment.alias.label" default="Alias" />

	</label>
	<div class="col-sm-10">
		<g:textField class="form-control "  name="alias" value="${equipmentInstance?.alias}"/>
	</div>
</div>
<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'standard', 'error')} ">
	<label class="col-sm-2  control-label"  for="standard" >
		<g:message code="equipment.standard.label" default="Standard" />

	</label>
	<div class="col-sm-10">
		<g:select id="standard" name="standard.id" from="${com.petrodata.pms.equipment.Standard.list()}" optionKey="id" value="${equipmentInstance?.standard?.id}" class="form-control input-lg m-b-10" noSelection="['null': '']"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'operationDate', 'error')} required">
	<label class="col-sm-2  control-label"  for="operationDate">
		<g:message code="equipment.operationDate.label" default="Operation Date" />
		<span class="required-indicator">*</span>
	</label>
	<div class="input-group date form_date col-md-5" data-date=""
		 data-date-format="yyyy-mm-dd" >
		<input class="form-control" size="16" type="text"  id="operationDate" name="operationDate" value="${equipmentInstance?.operationDate?.format('yyyy-MM-dd')}"  readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>


<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'factoryDate', 'error')} ">
	<label class="col-sm-2  control-label"  for="factoryDate">
		<g:message code="equipment.factoryDate.label" default="Factory Date" />

	</label>

	<div class="input-group date form_date col-md-5" data-date=""
		 data-date-format="yyyy-mm-dd" >
		<input class="form-control" size="16" type="text"  id="factoryDate" name="factoryDate" value="${equipmentInstance?.factoryDate?.format('yyyy-MM-dd')}"  readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'arrivalDate', 'error')} ">
	<label class="col-sm-2  control-label"  for="arrivalDate">
		<g:message code="equipment.arrivalDate.label" default="Arrival Date" />

	</label>

	<div class="input-group date form_date col-md-5" data-date=""
		 data-date-format="yyyy-mm-dd" >
		<input class="form-control" size="16" type="text"  id="arrivalDate" name="arrivalDate" value="${equipmentInstance?.arrivalDate?.format('yyyy-MM-dd')}"  readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'acceptDate', 'error')} ">
	<label class="col-sm-2  control-label"  for="acceptDate">
		<g:message code="equipment.acceptDate.label" default="Accept Date" />

	</label>

	<div class="input-group date form_date col-md-5" data-date=""
		 data-date-format="yyyy-mm-dd" >
		<input class="form-control" size="16" type="text"  id="acceptDate" name="acceptDate" value="${equipmentInstance?.acceptDate?.format('yyyy-MM-dd')}"  readonly>
		<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>


<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'factoryCode', 'error')} required">
	<label class="col-sm-2  control-label"  for="factoryCode">
		<g:message code="equipment.factoryCode.label" default="Factory Code" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="factoryCode" maxlength="100" required="" value="${equipmentInstance?.factoryCode}"/>
	</div>
</div>
<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'baseDepartment', 'error')} required">
	<label class="col-sm-2  control-label"  for="baseDepartment">
		<g:message code="equipment.baseDepartment.label" default="Base Department" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="baseDepartment" name="baseDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.baseDepartment?.id}" class="form-control input-lg m-b-10"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'belongDepartment', 'error')} required">
	<label class="col-sm-2  control-label"  for="belongDepartment">
		<g:message code="equipment.belongDepartment.label" default="Belong Department" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="belongDepartment" name="belongDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.belongDepartment?.id}" class="form-control input-lg m-b-10"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'code', 'error')} required">
	<label class="col-sm-2  control-label"  for="code">
		<g:message code="equipment.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="code" required="" value="${equipmentInstance?.code}"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'country', 'error')} required">
	<label class="col-sm-2  control-label"  for="country">
		<g:message code="equipment.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="country" required="" value="${equipmentInstance?.country}"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'equipmentCatagory', 'error')} required">
	<label class="col-sm-2  control-label"  for="equipmentCatagory">
		<g:message code="equipment.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="equipmentCatagory" name="equipmentCatagory.id" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" optionKey="id" required="" value="${equipmentInstance?.equipmentCatagory?.id}" class="form-control input-lg m-b-10"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'inDepartment', 'error')} required">
	<label class="col-sm-2  control-label"  for="inDepartment">
		<g:message code="equipment.inDepartment.label" default="In Department" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="inDepartment" name="inDepartment.id" from="${com.petrodata.pms.core.BaseDepartment.list()}" optionKey="id" required="" value="${equipmentInstance?.inDepartment?.id}" class="form-control input-lg m-b-10"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'techState', 'error')} ">
	<label class="col-sm-2  control-label"  for="techState">
		<g:message code="equipment.techState.label" default="Tech State" />

	</label>
	<div class="col-sm-10">
		<g:select name="techState" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.techState.inList}" value="${equipmentInstance?.techState}" valueMessagePrefix="equipment.techState" noSelection="['': '']"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'serviceState', 'error')} ">
	<label class="col-sm-2  control-label"  for="serviceState">
		<g:message code="equipment.serviceState.label" default="Service State" />

	</label>
	<div class="col-sm-10">
		<g:select name="serviceState" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.serviceState.inList}" value="${equipmentInstance?.serviceState}" valueMessagePrefix="equipment.serviceState" noSelection="['': '']"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'feature', 'error')} ">
	<label class="col-sm-2  control-label"  for="feature">
		<g:message code="equipment.feature.label" default="Feature" />

	</label>
	<div class="col-sm-10">
		<g:select name="feature" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.feature.inList}" value="${equipmentInstance?.feature}" valueMessagePrefix="equipment.feature" noSelection="['': '']"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'series', 'error')} ">
	<label class="col-sm-2  control-label"  for="series">
		<g:message code="equipment.series.label" default="Series" />

	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="series" maxlength="100" value="${equipmentInstance?.series}"/>
	</div>
</div>





<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'assetsType', 'error')} ">
	<label class="col-sm-2  control-label"  for="assetsType">
		<g:message code="equipment.assetsType.label" default="Assets Type" />

	</label>
	<div class="col-sm-10">
		<g:select name="assetsType" class="form-control input-lg m-b-10"  from="${equipmentInstance.constraints.assetsType.inList}" value="${equipmentInstance?.assetsType}" valueMessagePrefix="equipment.assetsType" noSelection="['': '']"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'purchaseContractNo', 'error')} ">
	<label class="col-sm-2  control-label"  for="purchaseContractNo">
		<g:message code="equipment.purchaseContractNo.label" default="Purchase Contract No" />

	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="purchaseContractNo" maxlength="100" value="${equipmentInstance?.purchaseContractNo}"/>
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isHSE', 'error')} ">
	<label class="col-sm-2  control-label"  for="isHSE">
		<g:message code="equipment.isHSE.label" default="Is HSE" />

	</label>
	<div class="col-sm-10">
		<g:checkBox name="isHSE" value="${equipmentInstance?.isHSE}" />
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isKey', 'error')} ">
	<label class="col-sm-2  control-label"  for="isKey">
		<g:message code="equipment.isKey.label" default="Is Key" />

	</label>
	<div class="col-sm-10">
		<g:checkBox name="isKey" value="${equipmentInstance?.isKey}" />
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isSecurity', 'error')} ">
	<label class="col-sm-2  control-label"  for="isSecurity">
		<g:message code="equipment.isSecurity.label" default="Is Security" />

	</label>
	<div class="col-sm-10">
		<g:checkBox name="isSecurity" value="${equipmentInstance?.isSecurity}" />
	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: equipmentInstance, field: 'isWorking', 'error')} ">
	<label class="col-sm-2  control-label"  for="isWorking">
		<g:message code="equipment.isWorking.label" default="Is Working" />

	</label>
	<div class="col-sm-10">
		<g:checkBox name="isWorking" value="${equipmentInstance?.isWorking}" />
	</div>
</div>

<script>
	$('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
</script>