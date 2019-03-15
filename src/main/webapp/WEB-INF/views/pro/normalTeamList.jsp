<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<jsp:include page="../common/decorator.jsp"></jsp:include>
<jsp:include page="../common/taglib.jsp"></jsp:include>
<html>
<head>
<title>项目管理</title>
</head>

<body>

	<div class="container-fluid">
	
		<div class="row" id="divSearch">
			<%--<div class="col-md-3 col-lg-3">--%>
				<%--<button type="button" class="btn btn-default btn-md add">添加</button><!-- data-toggle="modal" data-target="#myModal" -->--%>
			<%--</div>--%>
			<div class="col-md-9 col-lg-9 text-right">
				<form class="form-search form-inline" action="#">
					<div class="form-group">
						<label for="search_teamName">球队名称：</label>
						<input type="text" class="form-control" id="search_teamName" placeholder="" />
					</div>
					<div class="form-group">
						<label for="search_teamBoss">球队老板：</label>
						<input type="text" class="form-control" id="search_teamBoss" placeholder="" />
					</div>
					<button type="button" class="btn btn-default" id="btnSearch">查询</button>
				</form>
			</div>
		</div>

		<div class="row">
			<table id="table"
				class="table  table-condensed table-hover">
			</table>
		</div>

	</div>

	<!-- Modal 新增修改-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">球队信息</h4>
				</div>
				<div class="modal-body">
					<form id="formSave" class="form-save form-horizontal" method="post" action="#">
						<input type="hidden" id="id" name="id"/>
						<div class="form-group">
							<label for="projectName" class="col-sm-2 control-label">球队名称：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="teamName" name="teamName" maxlength="50" >
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div>
						<div class="form-group">
							<label for="projectName" class="col-sm-2 control-label">球队历史：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="teamHistory" name="teamHistory" maxlength="50" >
								<div class="help-inline"><font color="red">*</font></div>
							</div>
						</div><div class="form-group">
						<label for="projectName" class="col-sm-2 control-label">球队经理：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="teamManager" name="teamManager" maxlength="50" >
							<div class="help-inline"><font color="red">*</font></div>
						</div>
					</div><div class="form-group">
						<label for="projectName" class="col-sm-2 control-label">球队老板：</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="teamBoss" name="teamBoss" maxlength="50" >
							<div class="help-inline"><font color="red">*</font></div>
						</div>
					</div><div class="form-group">
						<label for="projectName" class="col-sm-2 control-label">球队头像：</label>
						<input type="text" class="form-control" id="teamPhoto" name="teamPhoto" maxlength="500" style="display: none!important">
						<div class="col-sm-10">
								<form id="upload-file-form" enctype="multipart/form-data">
									<input id="upload-file-input" type="file" name="uploadImage" accept="*" />
								</form>
							<div class="help-inline"><font color="red">*</font></div>
						</div>
					</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnSave">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal 基础信息-->
	<div class="modal fade" id="myModalView" tabindex="-1" role="dialog" aria-labelledby="myModalViewLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalViewLabel">球队信息</h4>
				</div>
				<div class="modal-body">
					<form id="formView" class="form-view form-horizontal" method="post" action="#">
						<input type="hidden" id="id" name="id"/>
						<div class="form-group">
							<label for="teamName" class="col-sm-3 control-label">球队名字：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="teamName" name="teamName" maxlength="50"  disabled="disabled">
								<!-- <div class="help-inline"><font color="red">*</font></div> -->
							</div>
						</div>
						<div class="form-group">
							<label for="teamHistory" class="col-sm-3 control-label">球队历史：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="teamHistory" name="teamHistory" maxlength="50"  disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label for="teamManager" class="col-sm-3 control-label">球队经理：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="teamManager" name="teamManager"  disabled="disabled"></input>
							</div>
						</div>
						<div class="form-group">
							<label for="teamBoss" class="col-sm-3 control-label">球队老板：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="teamBoss" name="teamBoss"  disabled="disabled"></input>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary" id="btnSave">保存</button> -->
				</div>
			</div>
		</div>
	</div>
	
	<script src="${ctx}/static/jquery-plugins/jquery.download.js" type="text/javascript"></script>
	<script type="text/javascript">
		var validator;
		$(function() {

			var $table = $('#table');
			$table.bootstrapTable({
				url : '${ctx}/teamInfo/list',
				height : getTableHeight(),
				columns : [ {
					field : 'id',
					title : '球队ID',
					width : '20%',
					align : 'center'
				}, {
					field : 'teamName',
					title : '球队名字',
					cellStyle : ellipsis,
					width : '15%',
					align : 'center'
				}, {
					field : 'teamPhoto',
					title : '球队图片',
					width : '15%',
					align : 'center',
					formatter: function(value, row, index) {
						return '<img src='+ value +' style="width:50px;height50px">'
					}
				}, {
					field : 'teamHistory',
					title : '球队历史',
					width : '15%',
					align : 'center'
				}, {
					field : 'teamManager',
					title : '球队经理',
					width : '15%',
					align : 'center'
				},  {
					field : 'teamBoss',
					title : '球队老板',
					width : '15%',
					align : 'center'
				} ]
			});

			$table.on('load-success.bs.table', function (data) {
				//console.log("load-success...");
			});
			
			validator = $("#formSave").validate({
				rules: {
					projectName: {required:true,maxlength:50},
					bizMgr: {required:true}
				}
			});

			// 新增,弹框
			$(".add").click(function() {
				$(".form-save").clearForm();
				$('#myModalLabel').html('新增');
				$('#myModal').modal('show');
				validator.resetForm();//清除验证错误的显示
			});

			// 保存
			$("#btnSave").click(function() {
				if($("#formSave").valid()){
					var obj = $(".form-save").getFormObject();
					$.ajaxPostJson("${ctx}/teamInfo/saveOrUpdate", obj, function(result) {
						$('#table').bootstrapTable("refresh");
						$('#myModal').modal('hide');
						showMessage("操作成功!");
					});
				}
			});
			
			//查询
			$("#btnSearch").click(function() {
				$table.bootstrapTable("refresh");
			});
			
			$("#btnExport").click(function(){
				
			});

			$(window).resize(function() {
				// 表格
				$table.bootstrapTable('resetView', {
					height : getTableHeight()
				});
			});

		});

		//表格配置全选框实现


        $("#all").on('click',function() {
            $("input[name='tableIds']").prop("checked", this.checked);
        });

        $("input[name='tableIds']").on('click',function() {
            var $subs = $("input[name='tableIds']");
            $("#all").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
        });

        // 修改、删除
		function operateFormatter(value, row, index) {
			var html = '';
			html+= '<a class="edit" href="javascript:void(0)">修改</a> &nbsp;&nbsp;';
			html+= '<a class="detail" href="javascript:void(0)">基础信息</a> &nbsp;&nbsp;';
			html+= '<a class="remove" href="javascript:void(0)">删除</a> &nbsp;&nbsp;';
			/* html+= '<a class="export" href="javascript:void(0)">导出</a> &nbsp;&nbsp;'; */
			return html;
		}

		window.operateEvents = {
			'click .edit' : function(e, value, row, index) {
				validator.resetForm();//清除验证错误的显示
				$('#myModal').modal('show');
				$('#myModalLabel').html('修改');
				$.ajaxPostJson("${ctx}/teamInfo/getById/" + row.id, {}, function(result) {
					if (result) {
						$(".form-save").setFormObject(result);
					}
				});
			},
			'click .remove' : function(e, value, row, index) {
				$.ajaxPostJson("${ctx}/teamInfo/delete/" + row.id, {}, function(result) {
					$('#table').bootstrapTable("refresh");
					showMessage("操作成功!");
				});
			},
			'click .export' : function(e, value, row, index) {
				jQuery.download("${ctx}/projectInfo/export/" + row.id, {});
			},
			'click .detail' : function(e, value, row, index) {
				$.ajaxPostJson("${ctx}/teamInfo/getById/" + row.id, {}, function(result) {
					if (result) {
						$('#myModalView').modal('show');
						$(".form-view").setFormObject(result);
					}
				});
			}
		};


		//图片上传

		<%--$('.upload-file').on('change', function(){--%>
			<%--var formData = new FormData();--%>
			<%--formData.append('image', $('.upload-file')[0].files[0]);--%>
			<%--console.log( $('.upload-file'))--%>
			<%--console.log("图片上传")--%>
			<%--$.ajax({--%>
				<%--url: "${ctx}/image/images",--%>
				<%--async:false,--%>
				<%--type: "POST",--%>
				<%--enctype: 'multipart/form-data',--%>
				<%--data: formData,--%>
				<%--processData:false,--%>
				<%--success: function (res) {--%>
					<%--console.log("ok")--%>
				<%--},--%>
				<%--error: function (err) {--%>
					<%--console.log(err)--%>
				<%--}--%>

			<%--})--%>
		<%--});--%>

		$("#upload-file-input").on("change", uploadFile);

		function uploadFile() {
			console.log($("#upload-file-input"))
			var f = new FormData();
			f.append("image", $("#upload-file-input")[0].files[0])
			$.ajax({
				url: "${ctx}/image/uploadImage",
				type: "POST",
				data: f,
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				success: function (res) {
					console.log(res)
					$("#teamPhoto").val(res);
				},
				error: function () {
					console.log(2)
				}
			});
		}

	</script>
</body>
</html>