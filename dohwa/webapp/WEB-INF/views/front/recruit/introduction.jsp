<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="recruit" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual recruit01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.040" text="RECRUIT" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.RECRUIT.003" text="직무소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
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
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<c:choose>
									<c:when test="${'ko' eq _lang}">
										<ul class="tab-list">
											<li><a class="item" href="<c:url value="/recruit/procedure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></a></li>
											<li class="active"><a class="item" href="<c:url value="/recruit/introduction" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.057" text="직무소개" /></a></li>
											<li>
												<c:choose>
													<c:when test="${'ko' eq _lang}">
														<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:when>
													<c:when test="${'en' eq _lang}">
														<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:when>
													<c:otherwise>
														<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:otherwise>		
												</c:choose>
											</li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="tab-list">
											<li class="active"><a class="item" href="<c:url value="/recruit/procedure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></a></li>
											<li>
												<c:choose>
													<c:when test="${'ko' eq _lang}">
														<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:when>
													<c:when test="${'en' eq _lang}">
														<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:when>
													<c:otherwise>
														<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
															<spring:message code="FRONT.COMMON.MENU.RECRUIT.002" text="채용지원" />
														</a>
													</c:otherwise>		
												</c:choose>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="contents full-type no-btm-type clfix">
							<span class="page-decs page-decs-type02">
								<strong>05 RECRUIT</strong>
								DOHWA ENGINEERING
							</span>
							<c:choose>
								<c:when test="${'ko' eq _lang}">
									<div class="section-cont recruit-step">
									<div class="content-inner">
										<!-- s: 20200814 추가 -->
										<div class="tab-menu-type02">
											<ul class="tab-list tab-list-3depth">
												<li>
													<a class="item" href="/recruit/procedure"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001" text="채용절차" /></span></a>
												</li>		
												<li class="active">
													<a class="item" href="#" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.003" text="직무소개" /></span></a>
												</li>
												<li>
													<a class="item" href="<c:url value="/recruit/benefit" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002" text="복리후생" /></span></a>
												</li>
											</ul>
										</div>
										<!-- e: 20200814 추가 -->
										<p class="title-main">
											<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.003.002" text="꿈을 함께 할 최고의 인재를 모집합니다.<br />최고의 능률과 최대의 성과를 창출할 수 있도록 원하는 다양한 직무에 지원하실 수 있습니다." />
										</p>
										<div class="bttn-area">
											<a class="bttn type01 style01" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/callSubPage?code1=1000&code2=1200" />" data-id="" target="_blank">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.003" text="직무소개 바로가기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
										</div>
									</div>
									<div class="sub-visual">
										<span><img  style="width:1920px;height:640px;margin:0 auto; display: block;" src="/images/pc/recruit_introduction.jpg"/></span>
									</div>
									<!-- 
									<div class="sub-visual">
										<div id="bg3"></div>
									</div>
									 -->
									<div class="content-inner">
										<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.003.001" text="직무소개" /></h3>
										<span class="img"><img src="/images/pc/recruit_introduction_detail.jpg"/></span>
									</div>
								</div>
								</c:when>
								<c:otherwise>
									<!-- 채용절차로 바로 이동 -->
									<meta http-equiv="refresh" content="0;URL='<c:url value="/recruit/procedure" />'">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %>
						</div>
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
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
	</body>
</html>