<%@ page import="com.petrodata.pms.equipment.EquipmentRunningInfo" %>



<div class="fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'jobOrderInitDate', 'error')} required">
	<label for="jobOrderInitDate">
		<g:message code="equipmentRunningInfo.jobOrderInitDate.label" default="Check Init Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="jobOrderInitDate" precision="day"  value="${equipmentRunningInfoInstance?.jobOrderInitDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'equipment', 'error')} required">
	<label for="equipment">
		<g:message code="equipmentRunningInfo.equipment.label" default="Equipment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipment" name="equipment.id" from="${com.petrodata.pms.equipment.Equipment.list()}" optionKey="id" required="" value="${equipmentRunningInfoInstance?.equipment?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'lastOverhaulTime', 'error')} required">
	<label for="lastOverhaulTime">
		<g:message code="equipmentRunningInfo.lastOverhaulTime.label" default="Last Overhaul Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastOverhaulTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance.lastOverhaulTime}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'maintenanceInitTime', 'error')} required">
	<label for="maintenanceInitTime">
		<g:message code="equipmentRunningInfo.maintenanceInitTime.label" default="Maintenance Init Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maintenanceInitTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance.maintenanceInitTime}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentRunningInfoInstance, field: 'totalTime', 'error')} required">
	<label for="totalTime">
		<g:message code="equipmentRunningInfo.totalTime.label" default="Total Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalTime" class="form-control input-sm m-b-10"  type="number" value="${equipmentRunningInfoInstance.totalTime}" required=""/>

</div>

