<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>403 - 拒绝访问</title>
	<link href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<div class="alert alert-warning alert-dismissible fade in" role="alert">
      <strong>403 - 拒绝访问!</strong>
    </div>
</body>
</html>
