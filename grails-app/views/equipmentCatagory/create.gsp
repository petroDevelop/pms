<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>

	<div class="row">
		<ol class="breadcrumb">
			<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active" ><a href="${request.contextPath}/equipmentCatagory/list"><g:message code="default.list.label" args="[entityName]" /></a></li>

		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${equipmentCatagoryInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${equipmentCatagoryInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
		</div>
	</div><!--/.row-->
	<link rel="stylesheet" href="${request.contextPath}/js/EasyTree/css/easyTree.css">
	<script src="${request.contextPath}/js/EasyTree/src/easyTree.js"></script>
	<div class="modal fade" id="show" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">select EquipmentCatagory</h4>
				</div>
				<div class="modal-body">
					${EquipmentCatagory.generatorTreeDiv()}
				</div>
				<div class="modal-footer">
					<button type="button" onclick="changeSelect();"  class="btn btn-default margin" data-dismiss="modal">Change</button>
					<button type="button"  class="btn btn-default margin"  data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<script>
		function changeSelect(){
			$('#parent').val($('.easy-tree').find('li.li_selected').first().attr('value'));
		}
		function changeTree(obj){
			$('.easy-tree').EasyTree({
				selectable: true,
				deletable: false,
				editable: false,
				addable: false,
				i18n:{}
			});
			$('#show').show();
		}

	</script>
    <g:form url="[resource:equipmentCatagoryInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<button class="btn btn-default margin" name="create" type="submit"><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.button.create.label', default: 'Create')}</button>

				</fieldset>
			</g:form>

	</body>
</html>
