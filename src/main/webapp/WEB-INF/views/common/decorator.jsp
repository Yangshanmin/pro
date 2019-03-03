<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Web</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/font-awesome/4.4.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap-table/1.8.1/bootstrap-table.min.css" rel="stylesheet">
<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/css/reset.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/jquery-plugins/jquery-confirm/jquery-confirm.min.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
   <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
   <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
 <![endif]-->
<script type="text/javascript">
	var ctx = '${ctx}';
</script>
<sitemesh:write property="head" />
</head>
<body>
	<sitemesh:write property="body" />
	<script src="${ctx}/static/bootstrap/3.3.5/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap-table/1.8.1/bootstrap-table.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap-table/1.8.1/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/jquery.validate.extend.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/third/json2.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-plugins/jquery-confirm/jquery-confirm.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-plugins/jquery-form-utils.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/common/Utils.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/common/BizUtils.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/common/Default.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/common/Array.js" type="text/javascript"></script>
</body>
</html>