<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="intro-link-wrap">
	<div class="intro-link-box">
		<c:choose>
			<c:when test="${'ko' eq _lang}">
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007.MOB" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009.MOB" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." />
					</p>
				</a>
			</c:when>
			<c:when test="${'en' eq _lang}">
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007.MOB" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009.MOB" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." />
					</p>
				</a>
			</c:when>
			<c:otherwise>
				<a class="intro-link" href="" target="_blank">
					<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007.MOB" text="CAREER" /></span>
					<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
					<p><spring:message code="FRONT.COMMON.MENU.INTROLINK.009.MOB" text="도화와 함께 세계인의 미래를 디자인할 여러분의 도전을 기다리고 있습니다." /></p>
				</a>
			</c:otherwise>
		</c:choose>
		<!-- 
		<a class="intro-link" href="<c:url value="http://recruiter.dohwa.co.kr" />" target="_blank">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.007.MOB" text="Career" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.008" text="채용지원" /></strong>
		</a>
		 -->
	</div>
	<div class="intro-link-box">
		<a class="intro-link" href="<c:url value="${mobileStartPath}business" />">
			<span class="intro-menu"><spring:message code="FRONT.COMMON.MENU.INTROLINK.013.MOB" text="Business" /></span>
			<strong class="intro-name"><spring:message code="FRONT.COMMON.MENU.INTROLINK.011" text="사업소개" /></strong>
		</a>
	</div>
</div>