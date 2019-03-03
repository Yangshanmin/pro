<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>404 - 页面不存在</title>
<style>
#pic404{
	margin-top:10% auto;
	height:500px;
	width:500px;
	background:url(${ctx}/static/images/404.jpg) no-repeat;
}
</style>
<link href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="alert alert-warning alert-dismissible fade in" role="alert">
      <strong>404 - 页面不存在!</strong>
    </div>
</body>
</html>