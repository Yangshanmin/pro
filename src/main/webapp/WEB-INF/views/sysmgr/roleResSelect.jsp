<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>树选择管理</title>
<link href="${ctx}/static/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-plugins/jquery-form-utils.js" type="text/javascript"></script>
<script type="text/javascript">
var roleId = '${roleId}';
</script>
</head>
<body>

<div class="container">
	<ul id="treeUl" class="ztree"></ul>
</div>

<script type="text/javascript">
	$(function() {
		
		var setting = {
				check: {
					enable: true
				},
				view: {
					showLine: false
				}
		};
		
		$.ajaxPostJson("${ctx}/sysmgr/roleResSelect/"+roleId, {}, function(result) {
			$.fn.zTree.init($("#treeUl"), setting, result);
			var treeObj = $.fn.zTree.getZTreeObj("treeUl");
			treeObj.expandAll(true);
		});

	});
	
	//获取所有选中节点
	function getRoleCheckedNodes(){
		var ids = [];
		var treeObj = $.fn.zTree.getZTreeObj("treeUl");
		var nodes = treeObj.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			ids.push(nodes[i].id);
		}
		return {roleId:roleId,resIds:ids};
	}

</script>
</body>
</html>
