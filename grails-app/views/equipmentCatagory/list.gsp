<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script>
			function deleteFormatter(value, row) {
				var str='<button class="btn btn-default margin" onclick="deleteOne('+row.id+')" type="button"><span class="glyphicon glyphicon-trash"></span> &nbsp;<g:message code="default.button.delete.label" default="Delete" /></button></a>';
				return str;
			}
			function editFormatter(value, row,index) {
				var str='<button class="btn btn-default margin box-switcher" data-switch="box-edit" onclick="editOne('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
				return str;
			}
			function nameFormatter(value, row,index) {
				var str='<a href="javascript:void(0);" class="box-switcher" data-switch="box-edit" onclick="showOne('+index+','+row.id+')" >'+row.name+'</a>';
				return str;
			}
			function queryParams(params) {
				//params.your_param1 = 1;
				return params;
			}
			function deleteAll(){
				var selects=$('#equipmentCatagoryTable').bootstrapTable('getSelections');
				if(selects.length>0){
					var ids=new Array();
					for(var i=0;i<selects.length;i++){
						ids.push(selects[i].id);
					}
					var obj=new Object();
					obj.ids=ids.join(",");
					if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
						$.post("${request.contextPath}/equipmentCatagory/deleteAll", obj,
								function (data, textStatus) {
									if (data.result) {
										$('#alertSucess').removeClass('hide');
										$('#equipmentCatagoryTable').bootstrapTable('refresh',[]);
									} else {
										$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}
			function newOne(){
				$('#equipmentCatagoryForm').form('clear');
			}
			function deleteOne(id){

			}
			function editOne(index,id){
				$('#equipmentCatagoryForm').form('clear');
				var data=$('#equipmentCatagoryTable').bootstrapTable('getData');
				$('#equipmentCatagoryForm').form('load',data[index]);
			}
			function showOne(index,id){
				editOne(index,id);
			}
			function formSubmitAction(){
				$('#equipmentCatagoryForm').form('validate');
				//$('#equipmentCatagoryForm').validator('validate');
				$('#equipmentCatagoryForm').form('submit', {
					url:'${request.contextPath}/equipmentCatagory/serverSave',
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						if (data.result){
							$('#alertSucess').removeClass('hide');
							$('#box-edit').closest('.box').toggleClass('active');
							$('#box-list').closest('.box').addClass('active');
							$('#equipmentCatagoryTable').bootstrapTable('refresh',[]);
						}else{
							$('#alertFault').removeClass('hide');
						}
					}
				});

				return false;
			}
			function importExcel(){
				$('#excelForm').form('submit', {
					url:'${request.contextPath}/equipmentCatagory/importExel',
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						$('#importModal').modal('hide');
						if (data.result){
							$('#alertSucess').removeClass('hide');
							$('#equipmentCatagoryTable').bootstrapTable('refresh',[]);
						}else{
							$('#alertFault').removeClass('hide');
						}
					}
				});
			}
		</script>
	</head>
	<body>

	<div class="modal fade panel" id="importModal" tabindex="-1" role="dialog" aria-labelledby="importModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close"
							data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="importModalLabel">
						<g:message code="default.import.label" args="[entityName]" />
					</h4>
				</div>
				<div class="modal-body">
					<form  role="form" id="excelForm"  class="easyui-form"
						   enctype="multipart/form-data" method="post" >
					<input type="file" name="file" class="form-control input-sm m-b-10" required="" />
						</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default margin" onclick="importExcel()" type="button">
						<span class="glyphicon glyphicon-check"></span>
						<g:message code="default.submit.label" default="Submit"/>
					</button>

					<button class="btn btn-default margin" data-dismiss="modal" type="button">
						<span class="glyphicon glyphicon-circle-arrow-down"></span>
						<g:message code="default.close.label" default="Close"/>
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
		<div >

			<div class="row">
				<ol class="breadcrumb">
					<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
					<li class="active" ><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></li>
				</ol>
			</div><!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></h1>
				</div>
			</div><!--/.row-->
			<div class="alert bg-success hide" id="alertSucess" role="alert">
				<span class="glyphicon glyphicon-check"></span>
				<g:message code="default.sucess.label" default="Sucess" />    <!--  data-dismiss="alert" -->
				<a href="#" class="pull-right" onclick="$('#alertSucess').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
			</div>

			<div class="alert bg-danger hide" id="alertFault" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"> </span>
					<g:message code="default.fault.label" default="Fault" />

				<a href="#" class="pull-right" onclick="$('#alertFault').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
			</div>

			<div class="row box animated tile active" id="box-list">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<g:form method="post">
						<div class="panel-heading">
							<g:message code="default.list.label" args="[entityName]" />
							<div style="float: right">
							<button class="btn btn-default margin" data-toggle="modal"
									data-target="#importModal" type="button">
								<span class="glyphicon glyphicon-new-window"></span>
								<g:message code="default.import.label" args="[entityName]" />
							</button>

								<button class="btn btn-default margin box-switcher" onclick="newOne()" type="button" data-switch="box-edit">
									<span class="glyphicon glyphicon-plus"></span>
									<g:message code="default.new.label" args="[entityName]" />
								</button>

								<button class="btn btn-default margin" type="button"  onclick="deleteAll()" >
									<span class="glyphicon glyphicon-trash"></span>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>

							</div>
						</div>
						<div class="panel-body">
							                   <!--	sidePagination="client"
							                    data-method="post"
								                data-query-params="postQueryParams"
							                   	data-height="400"  data-page-list="[5, 10, 20, 50, 100, 200]"-->
							<table id="equipmentCatagoryTable" data-toggle="table" data-url="${request.contextPath}/equipmentCatagory/json"
								   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
								   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
								   data-select-item-name="checkIds" data-sort-name="name" data-sort-order="desc">
								<thead>
								<tr>
									<th data-field="nofield" data-checkbox="true"></th>
									<th data-field="name" data-sortable="true"  data-formatter="nameFormatter" >${message(code: 'equipmentCatagory.name.label', default: 'Name')}</th>

									<th data-field="code" data-sortable="true" >${message(code: 'equipmentCatagory.code.label', default: 'Code')}</th>

									<th data-field="parent" data-sortable="true" ><g:message code="equipmentCatagory.parent.label" default="Parent" /></th>

									<th data-field="isSpecial" data-sortable="true" >${message(code: 'equipmentCatagory.isSpecial.label', default: 'Is Special')}</th>

									<th data-field="specification" data-sortable="true" >${message(code: 'equipmentCatagory.specification.label', default: 'Specification')}</th>

									<th data-field="name" data-formatter="editFormatter"><g:message code="default.button.edit.label" default="Edit" /></th>
									<!--<th data-field="name" data-formatter="deleteFormatter"><g:message code="default.button.delete.label" default="Delete" /></th>-->

								</tr>
								</thead>
							</table>

						</div>
						</g:form>
					</div>
				</div>
			</div><!--/.row-->

			<div class="row box animated tile"  id="box-edit">
				<div class="col-lg-12 form-group">
					<form  role="form" id="equipmentCatagoryForm"
						   enctype="multipart/form-data" method="post" >
						<g:hiddenField name="version" value="${equipmentCatagoryInstance?.version}" />
						<g:hiddenField name="id" value="${equipmentCatagoryInstance?.id}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<button class="btn btn-default margin" type="submit"  ><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.button.edit.label', default: 'Edit')}</button>
							<button class="btn btn-default margin  box-switcher"  data-switch="box-list"  type="button"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;${message(code: 'default.button.back.label', default: 'Back')}</button>
						</fieldset>
					</form>
				</div>
			</div><!--/.row-->

		</div>
	    <script>
			$("#equipmentCatagoryForm").submit(function(e){
				e.preventDefault();
				formSubmitAction();
			});
	    </script>
	</body>
</html>