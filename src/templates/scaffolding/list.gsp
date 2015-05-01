<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="luminoPro">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script>
			//$('#table').bootstrapTable('method', parameter);
			function deleteFormatter(value, row) {
				var str='<a href="\${request.contextPath}/${domainClass.propertyName}/delete/'+row.id+'"><button class="btn btn-default margin" type="button"><span class="glyphicon glyphicon-trash"></span> &nbsp;<g:message code="default.button.delete.label" default="Delete" /></button></a>';
				return str;
			}
			function editFormatter(value, row) {
				var str='<a href="\${request.contextPath}/${domainClass.propertyName}/edit/'+row.id+'"><button class="btn btn-default margin" type="button"><span class="glyphicon glyphicon-edit"></span> &nbsp;<g:message code="default.button.edit.label" default="Edit" /></button></a>';
				return str;
			}
			function nameFormatter(value, row) {
				var str='<a href="\${request.contextPath}/${domainClass.propertyName}/show/'+row.id+'">'+row.name+'</a>';
				return str;
			}
			function queryParams(params) {
				//params.your_param1 = 1;
				return params;
			}
			function deleteAll(){
				var selects=\$('#${domainClass.propertyName}Table').bootstrapTable('getSelections');
				if(selects.length>0){
					var ids=new Array();
					for(var i=0;i<selects.length;i++){
						ids.push(selects[i].id);
					}
					var obj=new Object();
					obj.ids=ids.join(",");
					if(confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}')) {
						\$.post("\${request.contextPath}/${domainClass.propertyName}/deleteAll", obj,
								function (data, textStatus) {
									if (data.result) {
										\$('#alertSucess').removeClass('hide');
										\$('#${domainClass.propertyName}Table').bootstrapTable('refresh',[]);
									} else {
										\$('#alertFault').removeClass('hide');
									}
								}, "json");
					}
				}
			}

			function importExcel(){
				\$('#excelForm').form('submit', {
					url:'\${request.contextPath}/${domainClass.propertyName}/importExel',
					success: function(data){
						var data = eval('(' + data + ')'); // change the JSON string to javascript object
						\$('#myModal').modal('hide');
						if (data.result){
							\$('#alertSucess').removeClass('hide');
							\$('#${domainClass.propertyName}Table').bootstrapTable('refresh',[]);
						}else{
							\$('#alertFault').removeClass('hide');
						}
					}
				});
			}
		</script>
	</head>
	<body>
	<div class="modal fade panel" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close"
							data-dismiss="modal" aria-hidden="true">
					&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
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
				<li><a href="\${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active" ><g:message code="${domainClass.propertyName}.label" default="${className}" /></li>
			</ol>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><g:message code="${domainClass.propertyName}.label" default="${className}" /></h1>
			</div>
		</div><!--/.row-->
		<div class="alert bg-success hide" id="alertSucess" role="alert">
			<span class="glyphicon glyphicon-check"></span>
			<g:message code="default.sucess.label" default="Sucess" />    <!--  data-dismiss="alert" -->
			<a href="#" class="pull-right" onclick="\$('#alertSucess').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
		</div>

		<div class="alert bg-danger hide" id="alertFault" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign"> </span>
			<g:message code="default.fault.label" default="Fault" />

			<a href="#" class="pull-right" onclick="\$('#alertFault').addClass('hide');"><span class="glyphicon glyphicon-remove"></span></a>
		</div>

		<div class="row box animated tile active" id="box-list">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<g:form method="post">
						<div class="panel-heading">
							<g:message code="default.list.label" args="[entityName]" />
							<div style="float: right">
								<button class="btn btn-default margin" data-toggle="modal"
										data-target="#myModal" type="button"> <!--\$('#myModal').modal('show');-->
									<span class="glyphicon glyphicon-new-window"></span>
									<g:message code="default.import.label" args="[entityName]" />
								</button>

								<button class="btn btn-default margin box-switcher" onclick="newWindow()" type="button" data-switch="box-edit">
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
							<table id="${domainClass.propertyName}Table" data-toggle="table" data-url="\${request.contextPath}/${domainClass.propertyName}/json"
								   data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true"
								   data-side-pagination="server" data-pagination="true" data-query-params="queryParams"
								   data-select-item-name="checkIds" data-sort-name="name" data-sort-order="desc">
								<thead>
								<tr>
									<th data-field="nofield" data-checkbox="true"></th>
									<th data-field="id"  data-sortable="true" ></th>
									<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
									allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
									props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
									Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
									props.eachWithIndex { p, i ->
										if (i < 6) {
											if (p.isAssociation()) { %>

									<th>
									<th data-field="${p.name}" <%if (p.name=='name'){%>data-formatter="nameFormatter"<%}%> >\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>
								    </th>
									<%      } else { %>
									<th data-field="${p.name}"  data-sortable="true"  <%if (p.name=='name'){%>data-formatter="nameFormatter"<%}%> >\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>
									<%  }   }   } %>
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



	</div>




		<div >

				<a  href="\${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>

						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />

					<%  }   }   } %>
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="\${${propertyName}.id }"  style="vertical-align: middle;"/></td>
                        <%  props.eachWithIndex { p, i ->
							if (i == 0) { %>

						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>

					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                        <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>

					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                        <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%          } else { %>

                        <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%  }   }   } %>
                        <td><g:link action="edit" id="\${${propertyName}.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='\${request.getContextPath()}/${domainClass.propertyName}/delete/\${${propertyName}.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="\${${propertyName}Count ?: 0}" />
			</div>
		</div>
	</body>
</html>
