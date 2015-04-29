
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'equipmentCatagory.label', default: 'EquipmentCatagory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script>
			//$('#table').bootstrapTable('method', parameter);
			function deleteFormatter(value, row) {
				var str='<a href="${request.contextPath}/equipmentCatagory/delete/'+row.id+'"><button class="btn btn-default margin" type="button"><span class="glyphicon glyphicon-trash"></span> &nbsp;<g:message code="default.button.delete.label" default="Delete" /></button></a>';
				return str;
			}
			function editFormatter(value, row) {
				var str='<a href="${request.contextPath}/equipmentCatagory/edit/'+row.id+'"><button class="btn btn-default margin" type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
				return str;
			}
			function nameFormatter(value, row) {
				var str='<a href="${request.contextPath}/equipmentCatagory/show/'+row.id+'">'+row.name+'</a>';
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
										//$('#alertSucess').show();
										$('#alertSucess').removeClass('hide');
										$('#equipmentCatagoryTable').bootstrapTable('refresh',[]);
									} else {
										//$('#alertFault').show();
										$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}
		</script>
	</head>
	<body>

	<div class="modal fade panel" id="myModal" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close"
							data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						标题
					</h4>
				</div>
				<div class="modal-body">
					文本
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
							data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
		<div >

			<div class="row">
				<ol class="breadcrumb">
					<li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
					<li class="active" data-toggle="modal"
						data-target="#myModal"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></li>
				</ol>
			</div><!--/.row-->

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"><g:message code="equipmentCatagory.label" default="EquipmentCatagory" /></h1>
				</div>
			</div><!--/.row-->
			<div class="alert bg-success hide" id="alertSucess" role="alert">
				<span class="glyphicon glyphicon-check"></span>
				操作成功！    <!--  data-dismiss="alert" -->
				<a href="#" class="pull-right" onclick="$('#alertSucess').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
			</div>

			<div class="alert bg-danger hide" id="alertFault" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign">操作失败！</span>
				<a href="#" class="pull-right" onclick="$('#alertFault').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
			</div>

			<div class="row box animated tile active" id="box-list">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<g:form method="post">
						<div class="panel-heading">
							<g:message code="default.list.label" args="[entityName]" />
							<div style="float: right">
							<g:link  class="box-switcher" data-switch="box-edit" >
								<button class="btn btn-default margin" type="button">
									<span class="glyphicon glyphicon-plus"></span>
									<g:message code="default.new.label" args="[entityName]" />
								</button>
							</g:link>

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
				<div class="col-lg-12">
					<g:form url="[resource:equipmentCatagoryInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${equipmentCatagoryInstance?.version}" />
						<g:hiddenField name="id" value="${equipmentCatagoryInstance?.id}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<button class="btn btn-default margin" name="create" type="submit"><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.button.edit.label', default: 'Edit')}</button>

						</fieldset>
					</g:form>
				</div>
			</div><!--/.row-->

		</div>
	</body>
</html>