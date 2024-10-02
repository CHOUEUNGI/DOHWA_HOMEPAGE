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
		<div class="recruit" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual recruit01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.040" text="RECRUIT" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></h2>
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
						<div class="tab-menu-type01 center">
						<c:choose>
							<c:when test="${'ko' eq _lang}">
								<ul class="tab-list">
									<li class="active"><a class="item" href="<c:url value="${mobileStartPath}recruit/procedure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></a></li>
									<li><a class="item" href="<c:url value="${mobileStartPath}recruit/introduction" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.057" text="직무소개" /></a></li>
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
									<li class="active"><a class="item" href="<c:url value="${mobileStartPath}recruit/procedure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></a></li>
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
					<div class="contents no-btm-type">
						<div class="section-cont recruit-welfare">
							<div class="tab-menu-type02">
								<c:choose>
									<c:when test="${'ko' eq _lang}">
										<ul class="tab-list tab-list-2depth">
											<li class="active">
												<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001" text="채용절차" /></span></a>
											</li>
											<li>
												<a class="item" href="<c:url value="${mobileStartPath }recruit/introduction" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.003" text="직무소개" /></span></a>
											</li>
											<li>
												<a class="item" href="<c:url value="${mobileStartPath }recruit/benefit" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002" text="복리후생" /></span></a>
											</li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="tab-list tab-list-2depth">
											<li class="active">
												<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001" text="채용절차" /></span></a>
											</li>
											<li>
												<a class="item" href="<c:url value="${mobileStartPath }recruit/benefit" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002" text="복리후생" /></span></a>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
							<p class="title-main">
								<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.001.MOB" text="도전하기를 두려워하지 않는
								<br />
								열정과 패기가 넘치는
								<br />
								최고의 전문가를 모십니다." />
							</p>
							<div class="bttn-area">
								<c:choose>
									<c:when test="${'ko' eq _lang}">
										<a class="bttn type01 style01" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</c:when>
									<c:when test="${'en' eq _lang}">
										<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</c:when>
									<c:otherwise>
										<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="sub-visual"><img src="/images/mobile/img_recruit_step.jpg" alt="<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.002" text="Supremacy Specialist" />" /></div>
							<div class="content-inner">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001" text="채용절차" /></h3>
								<ul class="recruit-step">
									<!--s: 20200904 텍스트 수정 및 태그 수정-->
									<li>
										<p class="num">01</p>
										<p class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.003" /></p>
										<p class="desc">
											- <spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.004" />
											<br />
											- <spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.004.1" /><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.004.2" />
										</p>
									</li>
									<li>
										<p class="num">02</p>
										<p class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.006" /></p>
										<p class="desc">
											- <spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.008" />
											<br />
											- <spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.008.1" />
										</p>
									</li>
									<li>
										<p class="num">03</p>
										<p class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.009" /></p>
									</li>
									<li>
										<p class="num">04</p>
										<p class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.012" /></p>
									</li>
									<!--e: 20200904 텍스트 수정 및 태그 수정-->
								</ul>
								<div class="caution">
									<em>*</em>
									<span><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001.013" text="지원부서나 지원 시기에 따라 세부 절차는 변동이 있을 수 있으니 자세한 내용은 각 채용 공고를 통해 확인하여 주시기 바랍니다." /></span>
								</div>
							</div>
						</div>
					</div>
					<div class="btm-full-banner">
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link2.jsp" %>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>

	</body>
</html>