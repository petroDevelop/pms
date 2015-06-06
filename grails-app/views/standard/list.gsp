
<%@ page import="com.petrodata.pms.equipment.EquipmentCatagory; com.petrodata.pms.equipment.Standard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="${message(code: 'standard.label', default: 'Standard')}" />
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
			function editItemFormatter(value, row,index) {
				var str='<button class="btn btn-default margin box-switcher" data-switch="box-itemedit" onclick="editItemOne('+index+','+row.id+')"  type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
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
				var selects=$('#standardTable').bootstrapTable('getSelections');
				if(selects.length>0){
					var ids=new Array();
					for(var i=0;i<selects.length;i++){
						ids.push(selects[i].id);
					}
					var obj=new Object();
					obj.ids=ids.join(",");
					if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
						$.post("${request.contextPath}/standard/deleteAll", obj,
								function (data, textStatus) {
									if (data.result) {
										$('#alertSucess').removeClass('hide');
										$('#standardTable').bootstrapTable('refresh',[]);
									} else {
										$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}
			function deleteAllItem(i){
				var selects=$('#standardItemTable'+i).bootstrapTable('getSelections');
				if(selects.length>0){
					var ids=new Array();
					for(var i=0;i<selects.length;i++){
						ids.push(selects[i].id);
					}
					var obj=new Object();
					obj.ids=ids.join(",");
					if(confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
						$.post("${request.contextPath}/standard/deleteAllItem", obj,
								function (data, textStatus) {
									if (data.result) {
										$('#alertSucess').removeClass('hide');
										$('#standardItemTable'+i).bootstrapTable('refresh',[]);
									} else {
										$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}
			function newOne(){
				$('#standardItemDiv').hide();
				$('#standardForm').form('clear');
			}
			function deleteOne(id){

			}
			function editOne(index,id){
				$('#standardForm').form('clear');
				var data=$('#standardTable').bootstrapTable('getData');
				$('#standardForm').form('load',data[index]);
				//show standard item table
				$('#standardItemDiv').show();
				<g:each in="${['运行检查标准','保养标准','大修标准']}" status="i" var="tabOne">
				$('#standardItemTable${i}').bootstrapTable('refresh', {url: '${request.contextPath}/standard/itemjson/'+id+'?type=${tabOne}'});
				</g:each>
			}
			function editItemOne(index,id){
				$('#standardItemForm').form('clear');
				var array=new Array('运行检查标准','保养标准','大修标准');
				for(var i=0;i<array.length;i++){
					$('#'+array[i]).hide();
					var data=$('#standardItemTable'+i).bootstrapTable('getData');
					if(data.length>=(index+1)){
						if(data[index].id==id){
							$('#standardItemForm').form('load',data[index]);
							$('#'+array[i]).show();
							//break;
						}
					}
				}


			}
			function showOne(index,id){
				editOne(index,id);
			}
			function importExcel(){
				$('#excelForm').form('submit', {
					url:'${request.contextPath}/standard/importExel',
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						$('#myModal').modal('hide');
						if (data.result){
							$('#alertSucess').removeClass('hide');
							$('#standardTable').bootstrapTable('refresh',[]);
						}else{
							$('#alertFault').removeClass('hide');
						}
					}
				});
			}
			$(function(){
				$('#standardForm').form({
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						if (data.result){
						    $('#alertSucess').removeClass('hide');
							$('#box-edit').closest('.box').toggleClass('active');
							$('#box-list').closest('.box').addClass('active');
							$('#standardTable').bootstrapTable('refresh',[]);
						}else{
						   $('#alertFault').removeClass('hide');
						}
					}
				});
				$('#standardItemForm').form({
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						if (data.result){
							$('#box-itemedit').closest('.box').toggleClass('active');
							$('#box-edit').closest('.box').addClass('active');
							$('#standardItemTable0').bootstrapTable('refresh',[]);
							$('#standardItemTable1').bootstrapTable('refresh',[]);
							$('#standardItemTable2').bootstrapTable('refresh',[]);
							$('#standardItemTable3').bootstrapTable('refresh',[]);
						}else{

						}
					}
				});
			});
			function changeSelect(){
				var value=$('.easy-tree').find('li.li_selected').first().attr('value');
				var text=$('.easy-tree').find('li.li_selected').first().text();
				if(value && value!=null){
					$("#equipmentCatagory option[value='"+value+"']").remove();
					$("#equipmentCatagory").prepend("<option value='"+value+"'>"+text+"</option>");
					$("#equipmentCatagory").val(value);
				}
				$('#catagoryShow').modal('hide');
			}
			function changeTree(obj){
				$('.easy-tree').EasyTree({
					selectable: true,
					deletable: false,
					editable: false,
					addable: false,
					i18n:{}
				});
				$('#catagoryShow').modal('show');
			}
			function newStandItem(type){
				var array=new Array('运行检查标准','保养标准','大修标准');
				for(var i=0;i<array.length;i++){
					$('#'+array[i]).hide();
					if(type==array[i]){
						$('#'+array[i]).show();
					}
				}
				$('#standardItemForm').form('clear');
				$('#standardItemType').val(type);
				$('#standard').val($('#standardId').val());
				$('#box-edit').closest('.box').toggleClass('active');
				$('#box-itemedit').closest('.box').addClass('active');
			}
		</script>
	</head>
	<body>
	<div class="modal fade" id="catagoryShow" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">select EquipmentCatagory</h4>
				</div>
				<div class="modal-body" style="max-height: 500px;overflow: auto">
					${com.petrodata.pms.equipment.EquipmentCatagory.generatorTreeDiv()}
				</div>
				<div class="modal-footer">
					<button type="button" onclick="changeSelect();"  class="btn btn-default margin" data-dismiss="modal">Change</button>
					<button type="button"  class="btn btn-default margin"  data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
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
				<li class="active" ><g:message code="standard.label" default="Standard" /></li>
			</ol>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><g:message code="standard.label" default="Standard" /></h1>
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
						</div>
						<div class="panel-body">
							<div  id="toolbar">
								<button class="btn btn-default margin" data-toggle="modal" data-target="#importModal" type="button">
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
							<table id="standardTable" data-toggle="table"   data-toolbar="#toolbar"
								   data-url="${request.contextPath}/standard/json"   data-cache="false"
								   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
								   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
								   data-select-item-name="checkIds" data-sort-name="name" data-sort-order="desc">
								<thead>
								<tr>
									<th data-field="nofield" data-checkbox="true"></th>
									<th data-field="id"  data-sortable="true" ></th>
									

									<th data-field="name"  data-sortable="true"  data-formatter="nameFormatter" >${message(code: 'standard.name.label', default: 'Name')}</th>

									<th data-field="equipmentCatagory.text"  >${message(code: 'standard.equipmentCatagory.label', default: 'Equipment Catagory')}</th>

									

									<th data-field="reference"  data-sortable="true"   >${message(code: 'standard.reference.label', default: 'Reference')}</th>

									<th data-field="attention"  data-sortable="true"   >${message(code: 'standard.attention.label', default: 'Attention')}</th>


									<th data-field="id" data-formatter="editFormatter"><g:message code="default.button.edit.label" default="Edit" /></th>
									<!--<th data-field="id" data-formatter="deleteFormatter"><g:message code="default.button.delete.label" default="Delete" /></th>-->

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
						<div class="panel panel-default">
							<div class="panel-heading">Info</div>
							<div class="panel-body">
				<form  role="form"  action='${request.contextPath}/standard/serverSave'  class="form-horizontal" id="standardForm" enctype="multipart/form-data" method="post" >
					<g:hiddenField name="version" value="${standardInstance?.version}" />
					<g:hiddenField name="id" id="standardId" value="${standardInstance?.id}" />
					<fieldset class="form">
						<g:render template="form"/>

					</fieldset>
					<div class="row" id="standardItemDiv">
						<div class="col-lg-12">
							<div class="form-group">
								<div class="panel panel-default">
									<div class="panel-body tabs">
										<input type="hidden" id="selectType"/>
										<ul class="nav nav-tabs">
											<g:each in="${['运行检查标准','保养标准','大修标准']}" status="i" var="tabOne">
												<li <g:if test="${i==0}">class="active"</g:if>><a href="#tab${i}" data-toggle="tab">${tabOne}</a></li>
											</g:each>
										</ul>

										<div class="tab-content">
											<g:each in="${['运行检查标准','保养标准','大修标准']}" status="i" var="tabOne">
												<div class="tab-pane fade <g:if test="${i==0}">in active</g:if>" id="tab${i}">
													<div  id="toolbar${i}">
														<button class="btn btn-default margin " onclick="newStandItem('${tabOne}')" type="button" >
															<span class="glyphicon glyphicon-plus"></span>
															<g:message code="default.new.label" args="[g.message(code: 'standardItem.label', default: 'StandardItem')]" />
														</button>
														<button class="btn btn-default margin" type="button"  onclick="deleteAllItem(${i})" >
															<span class="glyphicon glyphicon-trash"></span>
															<g:message code="default.button.delete.label" default="Delete" />
														</button>
													</div>
												<table id="standardItemTable${i}" data-toggle="table"
													    data-cache="false"     data-toolbar="#toolbar${i}"
													   data-show-refresh="false" data-show-toggle="false" data-show-columns="false" data-search="false"
													   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
													   data-select-item-name="checkIds" data-sort-name="name" data-sort-order="desc">
													<thead>
													<tr>
														<th data-field="nofield" data-checkbox="true"></th>
														<th data-field="id"  data-sortable="true" ></th>
														<th data-field="name"  data-sortable="true"  data-formatter="nameFormatter" >${message(code: 'standardItem.name.label', default: 'Name')}</th>

														<th data-field="aim"  data-sortable="true"   >${message(code: 'standardItem.aim.label', default: 'Aim')}</th>

														<th data-field="checkType"  data-sortable="true"   >${message(code: 'standardItem.checkType.label', default: 'Check Type')}</th>

														<th data-field="checkDays"  data-sortable="true"   >${message(code: 'standardItem.checkDays.label', default: 'Check Days')}</th>


														<th data-field="range"  data-sortable="true"   >${message(code: 'standardItem.range.label', default: 'Range')}</th>

														<th data-field="id" data-formatter="editItemFormatter"><g:message code="default.button.edit.label" default="Edit" /></th>
													</tr>
													</thead>
												</table>

												</div>
											</g:each>

										</div>
									</div>
								</div><!--/.panel-->
							</div>
						</div>
					</div>
					<fieldset class="buttons">
						<button class="btn btn-default margin" type="submit"  ><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.submit.label', default: 'Submit')}</button>
						<button class="btn btn-default margin  box-switcher"  data-switch="box-list"  type="button"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;${message(code: 'default.button.back.label', default: 'Back')}</button>
					</fieldset>
				</form>
							</div>
						</div>
			</div>
	</div><!--/.row-->

		<div class="row box animated tile"  id="box-itemedit">
			<div class="col-lg-12 form-group">
				<div class="panel panel-default">
					<div class="panel-heading">Item Info</div>
					<div class="panel-body">
						<form  role="form"  action='${request.contextPath}/standardItem/serverSave'  class="form-horizontal ac-custom ac-radio ac-circle" id="standardItemForm" enctype="multipart/form-data" method="post" >
							<g:hiddenField name="version" value="" />
							<g:hiddenField name="id" value="" />
							<fieldset class="form">
								<g:render template="/standardItem/form"/>

							</fieldset>
							<fieldset class="buttons">
								<button class="btn btn-default margin" type="submit"  ><span class="glyphicon glyphicon-check"></span> &nbsp;${message(code: 'default.submit.label', default: 'Submit')}</button>
								<button class="btn btn-default margin  box-switcher"  data-switch="box-edit"  type="button"><span class="glyphicon glyphicon-list-alt"></span> &nbsp;${message(code: 'default.button.back.label', default: 'Back')}</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div><!--/.row-->

	</div>

	</body>
</html>
