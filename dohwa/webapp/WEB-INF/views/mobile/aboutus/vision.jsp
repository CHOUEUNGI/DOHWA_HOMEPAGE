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
		<div class="intro intro-vision" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro02 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.001" text="DOWHA NEW VISION 2030" /></span>
							<h2 class="title-main">
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.002" text="최초에서 최고의
								<br />
								종합엔지니어링 회사"/>
							</h2>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
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
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
							</div>
						</div>
					</div>
					<div class="page-tab-section">
						<div class="tab-menu-type01 center swiper-container">
							<%@ include file="/WEB-INF/views/mobile/layout/overview_tab_list.jsp" %>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont vision-wrap">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.006" text="DOHWA NEW VISION 2030" /></h3>
							<div class="vision-list">
								<div class="vision-item mission">
									<em class="ico" aria-hidden="true"></em>
									<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.007" text="Mission" /></em>
									<p class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.008" text="자연과 사람을 생각합니다."/></p>
									<p class="ani-txt-btm"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.013" text="안전하고 행복한 삶을 위한 미래를 창조합니다." /></p>
								</div>
								<div class="vision-item value">
									<em class="ico" aria-hidden="true"></em>
									<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.009" text="Core Value" /></em>
									<p class="ani-txt">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.010" text="사람이 먼저인 인본
										<br />
										마음이 모으는 화합
										<br />
										새로운 시각으로 보는 창의"/>
									</p>
								</div>
								<!-- <div class="vision-item vision">
									<em class="ico" aria-hidden="true"></em>
									<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.011" text="Vision" /></em>
									<p class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.012" text="Shape The Future" /></p>
								</div> -->
							</div>
						</div>
					</div>
					<div class="btm-full-banner">
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link.jsp" %>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script type="text/javascript">
		
		</script>
	</body>
</html>