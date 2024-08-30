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
		<%@ include file="/WEB-INF/views/front/layout/head.jsp" %>
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
		<div class="intro" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro02 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.001" text="DOWHA NEW VISION 2030" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.002" text="Create the Value, Shape the Future<br />2030 World Top-Tier" /></h2>
						</div>
						<!-- 20200813 비디오 태그 추가 Start-->
						<div class="sub-video">
							<video autoplay muted loop>
								<source src="/images/video/visual_vision.mp4" />
							</video>
						</div>
						<!-- 20200813 비디오 태그 추가 End-->
						<!-- 20200804 스크롤 수정 start-->
						<div class="noti-scroll">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.003" text="Scroll" /></span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<!-- 20200804 스크롤 수정 end-->
						<!-- 20200803 그리드 추가 start-->
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
						<!-- 20200803 그리드 추가 end-->
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<!--s: 20200904 depth2 추가-->
						<div class="page-tab-section bg">
							<div class="tab-menu-type01 center">
								<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
							</div>
						</div>
						<!--e: 20200904 depth2 추가-->
						<div class="contents no-btm-type full-type clfix">
							<span class="page-decs page-decs-reverse">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="vision-wrap">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.006" text="DOHWA NEW VISION 2030" /></h3>
								<div class="vision-list">
									<!-- <div class="hover-item mission">
										<span class="item-inner">
											<em class="ico" aria-hidden="true"></em>
											<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.007" text="Mission" /></em>
											<span class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.008" text="<strong>자연</strong> 과 <strong>사람</strong> 을 생각합니다." /></span>
										</span>
									</div> -->
									
									<div class="hover-item mission">
										<span class="item-inner">
											<em aria-hidden="true"></em>
											<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.007" text="Mission" /></em>
											<span class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.008" text="<strong>자연</strong> 과 <strong>사람</strong> 을 생각합니다." /></span>
											<span class="ani-txt-btm"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.013" text="안전하고 행복한 삶을 위한 미래를 창조합니다." /></span>
										</span>
									</div>
									
									<div class="hover-item value">
										<span class="item-inner">
											<em aria-hidden="true"></em>
											<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.009" text="Core Value" /></em>
											<span class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.010" text="사람이 먼저인 <strong>인본</strong><br />마음이 모으는 <strong>화합</strong><br />새로운 시각의 <strong>창의</strong>" />
											</span>
										</span>
									</div>
									
									<!-- <div class="hover-item value">
										<span class="item-inner">
											<em class="ico" aria-hidden="true"></em>
											<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.009" text="Core Value" /></em>
											<span class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.010" text="사람이 먼저인 <strong>인본</strong><br />마음이 모으는 <strong>화합</strong><br />새로운 시각의 <strong>창의</strong>" />
											</span>
										</span>
									</div> -->
									
									<!-- <div class="hover-item vision">
										<span class="item-inner">
											<em class="ico" aria-hidden="true"></em>
											<em class="ani-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.011" text="Vision" /></em>
											<span class="ani-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.002.001.012" text="Shape The Future" /></span>
										</span>
									</div> -->
								</div>
							</div>
						</div>
						<div class="btm-full-banner sp-type-02">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
						<!-- s : 20200813 grid mixin 추가-->
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
						<!-- e : 20200813 grid mixin 추가-->
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
	</body>
	<script type="text/javascript">

	</script>
</html>