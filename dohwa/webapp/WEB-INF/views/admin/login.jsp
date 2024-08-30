<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
</head>
<body>
	<div class="wrap bx-login">
		<div class="wrap-login">
			<h1><span style="padding: 0px">도화 엔지니어링 관리자 로그인 </span></h1>
			<div class="bx-loginbx" style="border-bottom:1px solid #cccccc; padding:30px 318px 30px 160px;">
				<form class="form-signin" method="post" action="/admin/loginProc">
					<div class="ip-area w100"><input name="id" class="ip-text" type="text" title="아이디" placeholder="아이디"></div>
					<div class="ip-area w100"><input name="password" class="ip-text" type="password" title="비밀번호" autocomplete="off" placeholder="비밀번호"></div>
					<button class="btns btn-login" type="submit">로그인</button>
					<c:if test="${not empty message}">
				        <font color="red">
				        <p><c:out value="${message}"/></p>
				        </font>
				    </c:if>
				</form>
			</div>
			<p>*&nbsp;일반 사용자의 접근을 허용하지 않습니다.</p>
			<p>*&nbsp;도화엔지니어링 관리자 사이트는 크롬(Chrome) 브라우저에 최적화 되어 있습니다.</p>
		</div>
	</div>
</body>
</html>