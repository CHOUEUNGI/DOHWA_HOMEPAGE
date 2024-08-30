<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 지도-->
<!-- 영상-->
<!-- paging-->
<!-- location-->
<!DOCTYPE html>
<!--[if IE 7]><html lang="<%=response.getLocale().getLanguage()%>" class="ie7"><![endif]-->
<!--[if IE 8]><html lang="<%=response.getLocale().getLanguage()%>" class="ie8"><![endif]-->
<!--[if IE 9]><html lang="<%=response.getLocale().getLanguage()%>" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="<%=response.getLocale().getLanguage()%>">
	<!--<![endif]-->
	<head>
		<%@ include file="/WEB-INF/views/mobile/layout/head.jsp" %>
	</head>
	<body>
		<!--[if lte IE 8]>
			<p class="browserupgrade">
				You are using an
				<strong>outdated</strong>
				browser. Please
				<a href="https://browsehappy.com/">upgrade your browser</a>
				to improve your experience and security.
			</p>
		<![endif]-->
		<div class="etc etc-error" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="contents">
						<p class="main-title">
							<spring:message code="FRONT.COMMON.MENU.ERROR.MOB.002.001" text="서비스 이용에
							<br />
							불편을 드려 죄송합니다."/>
						</p>
						<p class="sub-txt">
							<spring:message code="FRONT.COMMON.MENU.ERROR.MOB.002.002" text="요청하신 페이지는 접근권한이 없거나,
							<br />
							사용이 중지된 페이지로 존재하지 않습니다.
							<br />
							다시 한번 URL을 확인하시고
							<br />
							접근을 시도해 주시기 바랍니다. 감사합니다."/>
						</p>
						<a class="bttn type01 style03" href="<c:url value="${mobileStartPath}main" />" role="button">
							<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ERROR.MOB.002.003" text="메인으로 돌아가기"/></span>
							<em class="ico01" aria-hidden="true"></em>
						</a>
						<div class="sub-page-grid">
							<div class="grid-wrap" aria-hidden="true">
								<div class="grid-ico-wrap" aria-hidden="true">
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
									<div class="grid-ico" aria-hidden="true"></div>
								</div>
								<div class="grid-line-wrap">
									<div class="grid-line" aria-hidden="true"></div>
									<div class="grid-line" aria-hidden="true"></div>
									<div class="grid-line" aria-hidden="true"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<div class="dimm"></div>
		<div class="cnt-grid-wrap" aria-hidden="true">
			<div class="grid-ico-wrap" aria-hidden="true">
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
			</div>
			<div class="grid-line-wrap" aria-hidden="true">
				<div class="grid-line" aria-hidden="true"></div>
				<div class="grid-line" aria-hidden="true"></div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
	</body>
</html>