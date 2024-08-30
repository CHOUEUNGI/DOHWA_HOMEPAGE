<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프론트 [모바일]</title>
</head>
<body>
	<h3>* 다국어 테스트</h3>
	<div style="border: 4px dashed #bcbcbc;">
		<div><a href="<c:url value="/?lang=ko"/>">대한민국</a></div>
		<div><a href="<c:url value="/?lang=en"/>">미국</a></div>
		<div><a href="<c:url value="/?lang=es"/>">스페인</a></div>
		여기는 프론트 [모바일] 첫 페이지 입니다.
		다국어 메시지 : <spring:message code="TEST.001" text="해당 문자 없음" />
	</div>
	<br><br><br><br>
	<h3>* 페이징 테스트</h3>
	<div style="border: thick dotted #f44336;">
		<div>조회된 건수 : <c:out value="${page.totalCount}"/> 건</div>
		<%@ include file="/WEB-INF/views/front/layout/pagination.jsp" %>
		<c:if test="${null eq page || 0 == page.totalCount}">조회된 데이터가 없습니다.</c:if>
	</div>
</body>
</html>