<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="intro-link-wrap">
	<div class="intro-link-box">
		<c:choose>
			<c:when test="${'ko' eq _lang}">
				<!-- <a class="intro-link" href="#" onclick="alert('현재 채용사이트 작업중입니다.')"> -->
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." />
					</p>
				</a>
			</c:when>
			<c:when test="${'en' eq _lang}">
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." /></p>
				</a>
			</c:when>
			<c:otherwise>
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." /></p>
				</a>
			</c:otherwise>
		</c:choose>
		<!-- 
		<a class="intro-link" href="http://recruiter.dohwa.co.kr" target="_blank">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007" text="CAREER" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
			<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." />
			</p>
		</a>
		 -->
	</div>
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
</div>