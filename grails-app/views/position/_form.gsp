<%@ page import="com.petrodata.pms.team.Position" %>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="position.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="100" required="" value="${positionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'eptCatas', 'error')} required">
	<label for="eptCatas">
		<g:message code="position.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eptCatas" name="eptCatas" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" multiple="multiple" optionKey="id" required="" value="${positionInstance?.eptCatas*.id}" class="form-control input-lg m-b-10"/>
</div>

