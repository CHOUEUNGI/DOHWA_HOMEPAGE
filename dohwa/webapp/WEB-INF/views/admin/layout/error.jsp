<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<div>
		에러페이지
		<c:out value="${errorMsg}"/>
	</div>
	<div>
		<button onclick="javascript:history.go(-1);">이전 페이지</button>
	</div>
</body>
</html>