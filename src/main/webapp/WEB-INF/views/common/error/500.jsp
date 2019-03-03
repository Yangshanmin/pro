<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>500 - 系统内部错误</title>
<link href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="alert alert-warning alert-dismissible fade in" role="alert">
		<strong> 系统异常，请稍候再试 </strong>
	</div>
</body>
</html>