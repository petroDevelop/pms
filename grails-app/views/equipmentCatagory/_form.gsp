
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="equipmentCatagory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="name" required="" value="${equipmentCatagoryInstance?.name}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="equipmentCatagory.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="code" required="" value="${equipmentCatagoryInstance?.code?.trim()}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="equipmentCatagory.parent.label" default="Parent" />
	</label>
	<g:select id="parent" data-toggle="modal" href="#show" name="parent.id"  onclick="changeTree(this);"
			  noSelection="${['':'Select One...']}"
			  from="${[]}" optionKey="id"  value="${equipmentCatagoryInstance?.parent?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'specification', 'error')} ">
	<label for="specification">
		<g:message code="equipmentCatagory.specification.label" default="Specification" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="specification" maxlength="50" value="${equipmentCatagoryInstance?.specification}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'isSpecial', 'error')} ">
	<label for="isSpecial">
		<g:message code="equipmentCatagory.isSpecial.label" default="Is Special" />
		
	</label>
	<g:checkBox name="isSpecial" value="${equipmentCatagoryInstance?.isSpecial}" />

</div>




