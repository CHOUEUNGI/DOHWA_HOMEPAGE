<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
		<div class="intro csr-tipline" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>

			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
								</ul>
							</div>
						</div>
						<div class="contents clfix">
							<span class="page-decs">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont">
								<!-- s: 20200814 추가 -->
								<div class="tab-menu-type02">
									<ul class="tab-list tab-list-3depth">
										<li><a class="item" href="/aboutus/csr_01"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.003" text="나눔경영" /></span></a></li>
										<li><a class="item" href="/aboutus/csr_02"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.004" text="안전품질경영" /></span></a></li>
										<li class="active"><a class="item" href="#" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.005" text="윤리준법경영" /></span></a></li>
									</ul>
								</div>
								<!-- e: 20200814 추가 -->
								<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.008" text="윤리경영제보라인" /></h2>
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.009" text="결과확인" /></h3>
								<div class="tipline-view">
									<div class="tipline-view-head">
										<em class="tipline-view-sup"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.010" text="접수제목" /></em>
										<p class="head-tit"><c:out value="${result.title }" /></p>
									</div>
									<div class="tipline-view-cont">
										<em class="tipline-view-sup"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.011" text="처리내용" /></em>
										<div class="cont-answer">
											<c:out value="${empty result.result ? result.state : result.result }" />
										</div>
									</div>
									<div class="bttn-area center">
										<a class="bttn type01 style01" href="/speak" role="button"><span class="txt01"><spring:message code="FRONT.COMMON.MENU.SPEAK.003.001.012" text="확인" /></span></a>
									</div>
								</div>
							</div>
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

			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
	</body>
</html>