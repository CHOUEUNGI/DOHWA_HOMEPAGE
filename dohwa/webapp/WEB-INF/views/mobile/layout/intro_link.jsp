<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="intro-link-wrap">
	<div class="intro-link-box">
		<a class="intro-link" href="<c:url value="${mobileStartPath}business" />">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.013.MOB" text="Business" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.011" text="사업소개" /></strong>
		</a>
	</div>
	<div class="intro-link-box">
		<a class="intro-link" href="${mobileStartPath}aboutus/history">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.004.MOB" text="History" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.005" text="도화역사" /></strong>
		</a>
	</div>
</div>
