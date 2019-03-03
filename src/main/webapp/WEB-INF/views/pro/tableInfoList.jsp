<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>表格管理</title>
<link href="${ctx}/static/jquery-treegrid/css/jquery.treegrid.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery-treegrid/js/jquery.treegrid.js" type="text/javascript"></script>
<style type="text/css">
table.tree {
	width: 100%;
	border-collapse: collapse;
}

table.tree td {
	text-align: left;
	padding: 5px 10px;
	border-bottom: 1px solid #e5e5e5;
}

table.tree th {
	text-align: center;
    font-weight: bold;
}
</style>
</head>
<body>

	<div class="container-fluid">
	
		<div class="row" id="divSearch">
			<div class="col-md-3 col-lg-3">
				<c:if test="${organId==null }">
				<!-- <button type="button" class="btn btn-default btn-md add">添加</button> --><!-- data-toggle="modal" data-target="#myModal" -->
				</c:if>
			</div>
			<div class="col-md-9 col-lg-9 text-right">
				<form class="form-search form-inline" action="#">
					<div class="form-group">
						<label for="search_tableName">名称：</label> 
						<input type="text" class="form-control" id="search_tableName" placeholder="请输入名称" />
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				<div class="modal-body" style="text-overflow:ellipsis">
					<form id="formSave" class="form-save form-horizontal" method="post" action="#">
						<input type="hidden" id="id" name="id"/>
						<div class="form-group">
							<label for="tableName" class="col-sm-2 control-label">表格名称：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="tableName" name="tableName" maxlength="50" disabled>
								<!-- <div class="help-inline"><font color="red">*</font></div> -->
							</div>
						</div>
						<div class="form-group">
							<label for="submitDate" class="col-sm-2 control-label">填写日期：</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="submitDate" name="submitDate"  >
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
	
	<!-- Modal 提交情况-->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="detailModalLabel">表格提交明细</h4>
				</div>
				<div class="modal-body" style="height: 350px; overflow-y: auto;">
					<table class="tree">
						<!-- <tbody>
						</tbody> -->
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
				url : '${ctx}/tableInfo/queryPage',
				height : getTableHeight(),
				columns : [ {
					field : 'tableName',
					title : '表格名称',
					width : '25%',
					align : 'center'
				}, {
					field : 'submitTypeDesc',
					title : '类型',
					width : '8%',
					align : 'center'
				}, {
					field : 'submitCycleDesc',
					title : '提交周期',
					width : '8%',
					align : 'center'
				}, {
					field : 'submitDate',
					title : '提交截止日期',
					width : '12%',
					align : 'center',
					formatter : function operateFormatter(value, row, index) { 
						return  '每'+row.submitCycleDesc+row.submitDate+'日';
					}
				}, {
					title : '提交情况',
					formatter : function operateFormatter(value, row, index) { 
						return  '<a class="detail" href="javascript:void(0)">查看</a>';
						},
					events : operateEvents,
					width : '12%',
					align : 'center'
				}, {
					field : 'id',
					title : '操作',
					formatter : operateFormatter,
					events : operateEvents,
					width : '12%',
					align : 'center'
				} ]
			});
			
			$table.on('load-success.bs.table', function (data) {
				//console.log("load-success...");
			});
			
			validator = $("#formSave").validate({
				rules: {
					tableName: {required:true,maxlength:50},
					tableMonth: {required:true}
				}
			});

			// 新增
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
					$.ajaxPostJson("${ctx}/tableInfo/saveOrUpdate", obj, function(result) {
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
		
		// 修改、删除
		function operateFormatter(value, row, index) {
			var html = '';
			html+= '<a class="edit" href="javascript:void(0)">修改</a> &nbsp;&nbsp;';
			//html+= '<a class="remove" href="javascript:void(0)">删除</a> &nbsp;&nbsp;';
			//html+= '<a class="export" href="javascript:void(0)">导出</a> &nbsp;&nbsp;';
			return html;
		}

		window.operateEvents = {
			'click .edit' : function(e, value, row, index) {
				validator.resetForm();//清除验证错误的显示
				$('#myModal').modal('show');
				$('#myModalLabel').html('修改');
				$.ajaxPostJson("${ctx}/tableInfo/getById/" + row.id, {}, function(result) {
					if (result) {
						$(".form-save").setFormObject(result);
					}
				});
			},
			'click .remove' : function(e, value, row, index) {
				$.ajaxPostJson("${ctx}/tableInfo/delete/" + row.id, {}, function(result) {
					$('#table').bootstrapTable("refresh");
					showMessage("操作成功!");
				});
			},
			//'click .export' : function(e, value, row, index) {
			//	jQuery.download("${ctx}/tableInfo/export/" + row.id, {});
			//},
			'click .detail' : function(e, value, row, index) {
			    $('#detailModal').modal('show');
			    $('#detailModalLabel').html(row.tableName);
			    $(".tree").empty();
			    $("#detailPanel").html("数据查询中...");
			    var tableAlias = row.alias;
			    var submitType = row.submitType;
			    var exportMode = row.exportMode;
			    console.log("导出方式" + exportMode)
			    if (tableAlias == "TAB071") {
                    $.ajaxPostJson("${ctx}/tableInfo/querySubmitMonth/" + tableAlias, {},
                        function(result) {
                            if (result && result.length > 0) {
                                var html = '';
                                for (var i = 0; i < result.length; i++) {
                                    html += '<tr>';
                                    html += '	<td>' + result[i] + '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-xs" onclick="exportXls(\'' + tableAlias + '\',' + result[i] + ',null)">导出</button></td>';
                                    html += '</tr>';
                                }
                                $(".tree").append(html);
                            } else {
                                $(".tree").html("暂无提交记录");
                            }
                        });
                } else if (tableAlias == "TAB061") {
			        $.ajaxPostJson("${ctx}/tableInfo/submitInfo/" + tableAlias, {},
			        function(result) {
			            if (result && result.length > 0) {
			                var html = '';
							for (var i = 0; i < result.length; i++) {
							    row = result[i];
								html += '<tr nid='+row.month+' pid="0" class="treegrid-collapsed">';
								html += '	<td colspan="4"> <span class="treegrid-expander treegrid-expander-collapsed"></span> ' + (row.month+"").slice(0,4) + '季度'+row.month%100+' &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-xs" onclick="exportXls(\'' + tableAlias + '\',' + row.month + ',null)">导出</button></td>';
								html += '</tr>';
								for (var j = 0; j < row.list.length; j++) {
									html += '<tr nid="' + row.month + '-' + row.list[j].projectId + '" pid="' + row.month + '" style="display:none;">';
									html += '	<td style="max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;><span class="treegrid-indent"></span><span class="treegrid-expander"></span>' + row.list[j].projectName + '</td>';
									html += '	<td>' + Utils.notNull(row.list[j].userName) + '</td>';
									html += '	<td>' + Utils.notNull(row.list[j].mobile) + '</td>';
									html += '	<td>' + Utils.notNull(row.list[j].createTime, '<font color="red">未提交</font>') + '</td>';
									html += '</tr>';
								}
			                }
			                $(".tree").append(html);
			            } else {
			                $(".tree").html("暂无提交记录");
			            }
			        });
				} else if(exportMode == 1) {//周期展示
					$.ajaxPostJson("${ctx}/tableInfo/submitInfo/" + tableAlias, {},
			        function(result) {
			            if (result && result.length > 0) {
			                var html = '';
			                for (var i = 0; i < result.length; i++) {
			                    row = result[i];
			                    html += '<tr nid="' + row.month + '" pid="0" class="treegrid-collapsed">';
			                    html += '	<td colspan="4"><span class="treegrid-expander treegrid-expander-collapsed"></span>' + row.month + '&nbsp;&nbsp;&nbsp;(' + row.submitted + '/' + row.total + ')&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-xs" onclick="exportXls(\'' + tableAlias + '\',' + row.month + ',null)">导出</button></td>';
			                    html += '</tr>';
			                    if (row.list && row.list.length > 0) {
			                        for (var j = 0; j < row.list.length; j++) {
			                            html += '<tr nid="' + row.month + '-' + row.list[j].projectId + '" pid="' + row.month + '" style="display:none;">';
			                            html += '	<td style="max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><span class="treegrid-indent"></span><span class="treegrid-expander"></span>' + row.list[j].projectName + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].userName) + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].mobile) + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].createTime, '<font color="red">未提交</font>') + '</td>';
			                            html += '</tr>';
			                        }
			                    }
			                }
			                $(".tree").append(html);
			            } else {
			                $(".tree").html("暂无提交记录");
			            }
			        });
				} else if (exportMode == 2) {//周期&项目 展示
					$.ajaxPostJson("${ctx}/tableInfo/submitInfo/" + tableAlias, {},
			        function(result) {
			            if (result && result.length > 0) {
			                var html = '';
			                for (var i = 0; i < result.length; i++) {
			                    row = result[i];
			                    html += '<tr nid="' + row.month + '" pid="0" class="treegrid-collapsed">';
			                    html += '	<td colspan="5"><span class="treegrid-expander treegrid-expander-collapsed"></span>' + row.month + '&nbsp;&nbsp;&nbsp;(' + row.submitted + '/' + row.total + ')&nbsp;&nbsp;&nbsp;</td>';
			                    html += '</tr>';
			                    if (row.list && row.list.length > 0) {
			                        for (var j = 0; j < row.list.length; j++) {
			                            html += '<tr nid="' + row.month + '-' + row.list[j].projectId + '" pid="' + row.month + '" style="display:none;">';
			                            html += '	<td style="max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><span class="treegrid-indent"></span><span class="treegrid-expander"></span>' + row.list[j].projectName + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].userName) + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].mobile) + '</td>';
			                            html += '	<td>' + Utils.notNull(row.list[j].createTime, '<font color="red">未提交</font>') + '</td>';
			                            html += '   <td>' + Utils.hasSubmit(row.list[j].createTime, '<button type="button" class="btn btn-primary btn-xs" onclick="exportXls(\'' + tableAlias + '\',' + row.month + ','+ row.list[j].projectId +')">导出</button>') + '</td>';
			                            html += '</tr>';
			                        }
			                    }
			                }
			                $(".tree").append(html);
			            } else {
			                $(".tree").html("暂无提交记录");
			            }
			        });
				} else if (exportMode ==3 ) { //周期&台账 展示
					$.ajaxPostJson("${ctx}/tableInfo/submitInfo/" + tableAlias + "/" + row.id, {},
			        function(result) {
			            if (result && result.length > 0) {
			                var html = '';
							// html += '<tr' + '" style=" text-align: center">';
							// html += '   <th> </th><th> </th><th>项目</th><th>提交数量</th><th>更新时间</th><th>操作</th>';
							// html += '</tr>';
			                for (var i = 0; i < result.length; i++) {
			                    row = result[i];
			                    html += '<tr nid="' + row.month + '" pid="0" class="treegrid-collapsed">';
			                    html += '	<td colspan="4"><span class="treegrid-expander treegrid-expander-collapsed"></span>' + row.month + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
			                    html += '</tr>';
			                    if (row.projectDetailSummaryList && row.projectDetailSummaryList.length > 0) {
			                        for (var j = 0; j < row.projectDetailSummaryList.length; j++) {
			                            if (row.projectDetailSummaryList[j].cnt > 0) {
                                            html += '<tr nid="' + row.month + '-' + row.projectDetailSummaryList[j].projectId + '" pid="' + row.month + '" style="display:none;">';
                                            html += '<td> </td>';
                                            html += '<td> </td>';
                                            html += '	<td style="text-align: center;max-width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">' + row.projectDetailSummaryList[j].projectName + '</td>';
                                            html += '	<td style="text-align: center">' + Utils.notNull(row.projectDetailSummaryList[j].cnt) + '</td>';
                                            html += '	<td style="text-align: center">' + Utils.notNull(row.projectDetailSummaryList[j].createTime, '<font color="red">未提交</font>') + '</td>';html += '	<td  style="text-align: center"><button type="button" class="btn btn-primary btn-xs" onclick="exportXls(\'' + tableAlias + '\','+row.projectDetailSummaryList[j].month+',' + row.projectDetailSummaryList[j].projectId + ')">导出</button></td>';
                                        }
			                            html += '</tr>';
			                        }
			                    }
			                }
			                $(".tree").append(html);
			            } else {
			                $(".tree").html("暂无提交记录");
			            }
			        });
				} else {
			        console.log("没有编写此表前台展示")
				}
			}
		};
		
		$('.tree').delegate(".treegrid-expander-collapsed", 'click', function() {//展开
			var $this = $(this);
			var $tr = $this.parent().parent();
			$tr.removeClass('treegrid-collapsed').addClass('treegrid-expanded');
			$this.removeClass('treegrid-expander-collapsed').addClass('treegrid-expander-expanded');
			var nid = $tr.attr("nid");
			$(".tree tr[pid='" + nid + "']").show();
		}).delegate(".treegrid-expander-expanded", 'click', function() {//折叠
			var $this = $(this);
			var $tr = $this.parent().parent();
			$tr.removeClass('treegrid-expanded').addClass('treegrid-collapsed');
			$this.removeClass('treegrid-expander-expanded').addClass('treegrid-expander-collapsed');
			var nid = $tr.attr("nid");
			$(".tree tr[pid='" + nid + "']").hide();
		});
		
		function exportXls(alias, month, projectId) {
			//alert(alias + '-'+month);
			if(month){
			    if(projectId) {
			        jQuery.download("${ctx}/tableInfo/export/" + alias+"?month=" + month +"&projectId="+projectId, {});
				} else {
			        jQuery.download("${ctx}/tableInfo/export/" + alias+"?month="+month, {});
				}
			}else if(projectId){
				jQuery.download("${ctx}/tableInfo/export/" + alias+"?projectId="+projectId, {});
			}
		}
		
	</script>
</body>
</html>
