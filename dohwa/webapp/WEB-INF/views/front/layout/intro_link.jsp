<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="intro-link-wrap">
	<div class="intro-link-box">
		<a class="intro-link" href="<c:url value="/business" />">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.011" text="사업소개" /></strong>
			<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.012" text="국내 &middot; 외 토목건설 엔지니어링 분야의 선두주자,
				<br />
				도화엔지니어링의 다양한 프로젝트를 만나보세요." />
			</p>
		</a>
	</div>
	<div class="intro-link-box">
		<a class="intro-link" href="<c:url value="/aboutus/history" />">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.004" text="HISTORY" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.005" text="도화역사" /></strong>
			<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.006" text="1957년부터 끊임없는 성장과 혁신을 거듭해온<br />도화엔지니어링의 역사를 확인해보세요." /></p>
		</a>
	</div>
</div>
