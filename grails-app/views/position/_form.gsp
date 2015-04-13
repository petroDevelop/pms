<%@ page import="com.petrodata.pms.team.Position" %>



<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="position.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" maxlength="100" required="" value="${positionInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: positionInstance, field: 'equipmentCatagory', 'error')} required">
	<label for="equipmentCatagory">
		<g:message code="position.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipmentCatagory" name="equipmentCatagory.id" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" optionKey="id" required="" value="${positionInstance?.equipmentCatagory?.id}" class="form-control input-lg m-b-10"/>

</div>

