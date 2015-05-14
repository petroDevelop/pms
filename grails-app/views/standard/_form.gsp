<%@ page import="com.petrodata.pms.equipment.Standard" %>



<div class="form-group fieldcontain ${hasErrors(bean: standardInstance, field: 'attention', 'error')} required">
	<label class="col-sm-2  control-label" for="attention">
		<g:message code="standard.attention.label" default="Attention" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="attention" required="" value="${standardInstance?.attention}"/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: standardInstance, field: 'equipmentCatagory', 'error')} required">
	<label class="col-sm-2  control-label" for="equipmentCatagory">
		<g:message code="standard.equipmentCatagory.label" default="Equipment Catagory" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select id="equipmentCatagory" name="equipmentCatagory.id" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" optionKey="id" required="" value="${standardInstance?.equipmentCatagory?.id}" class="form-control input-lg m-b-10"/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: standardInstance, field: 'name', 'error')} required">
	<label class="col-sm-2  control-label" for="name">
		<g:message code="standard.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="name" required="" value="${standardInstance?.name}"/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: standardInstance, field: 'reference', 'error')} required">
	<label class="col-sm-2  control-label" for="reference">
		<g:message code="standard.reference.label" default="Reference" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control input-sm m-b-10"  name="reference" required="" value="${standardInstance?.reference}"/>

	</div>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: standardInstance, field: 'standardItems', 'error')} ">
	<label class="col-sm-2  control-label" for="standardItems">
		<g:message code="standard.standardItems.label" default="Standard Items" />
		
	</label>
	<div class="col-sm-10">
		
<ul class="one-to-many">
<g:each in="${standardInstance?.standardItems?}" var="s">
    <li><g:link controller="standardItem" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="standardItem" action="create" params="['standard.id': standardInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'standardItem.label', default: 'StandardItem')])}</g:link>
</li>
</ul>


	</div>
</div>

