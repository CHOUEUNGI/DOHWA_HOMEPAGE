<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<div class="wrap-head">
	<div class="bx-head">
		<h1>도화 엔지니어링 관리자</h1>
	</div>
	<div class="bx-menu">
		<ul class="clfix">
			<li><a href="/admin/main/banner" <c:if test="${null ne path && fn:contains(path, '/admin/main')}">class="on"</c:if>>메인관리</a></li>
			<li><a href="/admin/contents/people" <c:if test="${null ne path && fn:contains(path, '/admin/contents')}">class="on"</c:if>>Contents 관리</a></li>
			<li><a href="/admin/invest/finance/main" <c:if test="${null ne path && fn:contains(path, '/admin/invest')}">class="on"</c:if>>투자정보 관리</a></li>
			<li><a href="/admin/project" <c:if test="${null ne path && fn:contains(path, '/admin/project')}">class="on"</c:if>>Project 관리</a></li>
			<li><a href="/admin/custInqr" <c:if test="${null ne path && fn:contains(path, '/admin/custInqr')}">class="on"</c:if>>문의 관리</a></li>
			<c:if test="${pageContext.request.serverName eq 'localhost'}">
			<li><a href="/admin/manage/msgProp" <c:if test="${null ne path && fn:contains(path, '/admin/manage')}">class="on"</c:if>>운영 관리</a></li> <%--기획에서 정의되지 않은 개발자/운영현업의 지원 기능 --%>
			</c:if>
		</ul>
	</div>
</div>
