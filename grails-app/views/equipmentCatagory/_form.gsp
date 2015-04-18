<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<div class="modal fade" id="show" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<g:form  id="upload"  action="deploy" method="post" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">deploy new processDefine</h4>
				</div>
				<div class="modal-body">



				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-sm">Change</button>
					<button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
				</div>
			</div>
		</g:form>
	</div>
</div>
 <script>
	 function changeTree(obj){

	 }
 </script>
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
	<g:textField class="form-control input-sm m-b-10"  name="code" required="" value="${equipmentCatagoryInstance?.code}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="equipmentCatagory.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" onclick="changeTree(this);" from="${com.petrodata.pms.equipment.EquipmentCatagory.list()}" optionKey="id" required="" value="${equipmentCatagoryInstance?.parent?.id}" class="form-control input-lg m-b-10"/>

</div>

<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'specification', 'error')} ">
	<label for="specification">
		<g:message code="equipmentCatagory.specification.label" default="Specification" />
		
	</label>
	<g:textField class="form-control input-sm m-b-10"  name="specification" maxlength="50" value="${equipmentCatagoryInstance?.specification}"/>

</div>
 <!---
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="equipmentCatagory.children.label" default="Children" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${equipmentCatagoryInstance?.children?}" var="c">
    <li><g:link controller="equipmentCatagory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="equipmentCatagory" action="create" params="['equipmentCatagory.id': equipmentCatagoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')])}</g:link>
</li>
</ul>
</div>
-->


   <!--
<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'equipments', 'error')} ">
	<label for="equipments">
		<g:message code="equipmentCatagory.equipments.label" default="Equipments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${equipmentCatagoryInstance?.equipments?}" var="e">
    <li><g:link controller="equipment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="equipment" action="create" params="['equipmentCatagory.id': equipmentCatagoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'equipment.label', default: 'Equipment')])}</g:link>
</li>
</ul>


</div>

-->

<div class="fieldcontain ${hasErrors(bean: equipmentCatagoryInstance, field: 'isSpecial', 'error')} ">
	<label for="isSpecial">
		<g:message code="equipmentCatagory.isSpecial.label" default="Is Special" />
		
	</label>
	<g:checkBox name="isSpecial" value="${equipmentCatagoryInstance?.isSpecial}" />

</div>



