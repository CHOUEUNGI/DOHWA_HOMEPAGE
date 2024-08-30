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
							<spring:message code="FRONT.COMMON.MENU.ERROR.MOB.003.001" text="서비스 이용에
							<br />
							불편을 드려 죄송합니다."/>
						</p>
						<p class="sub-txt">
							<spring:message code="FRONT.COMMON.MENU.ERROR.MOB.003.002" text="일시적인 서버장애로 인하여 요청하신 서비스를
							<br />
							진행하지 못하고 있습니다. 원활한 서비스를 제공하지
							<br />
							못해 대단히 죄송하며, 잠시 후 다시 서비스를
							<br />
							이용해 주시길 바랍니다. 빠른 시간 안에
							<br />
							정상 서비스하도록 하겠습니다. 감사합니다."/>
						</p>
						<a class="bttn type01 style03" href="<c:url value="${mobileStartPath}main" />" role="button">
							<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ERROR.MOB.003.003" text="메인으로 돌아가기"/></span>
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
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
	</body>
</html>