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
		<div class="intro csr" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
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
						<div class="section-cont csr-quality">
							<div class="tab-menu-type02">
								<ul class="tab-list">
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/csr_01" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.003" text="나눔경영" /></span></a>
									</li>
									<li class="active">
										<a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.004" text="안전품질경영" /></span></a>
									</li>
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/csr_03" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.005" text="윤리준법경영" /></span></a>
									</li>
								</ul>
							</div>
							<div class="inner-tab-cont active">
								<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.008" text="안전품질경영" /></h3>
								<p class="title-main">
									<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.009.MOB" text="기술력과 인본을 중시하는 도화의
									<br />
									비전을 바탕으로 인류 번영과
									<br />
									최고의 가치를 위한 안전, 품질
									<br />
									경영을 추구합니다."/>
								</p>
								<p class="cont-desc">
									<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.010" text="축적된 기술력과 인재, 경험과 노하우를 바탕으로 EPC 사업 고도화에 따라 빠른 초기 대응과 안전사고 예방 등 다양한 위험상황에 대처할 수 있는 수행능력을 갖추었습니다.
									<br />
									사업분야 전반에 걸쳐 품질경영을 통한 고객만족과 안전성을 자랑하는 기술력을 통해 프로젝트의 성공적 성과를 창출하고 있습니다."/>
								</p>
								<div class="sub-visual"><img src="/images/mobile/img_intro_csr02.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.011" text="Technology Human" />" /></div>
								<div class="csr-cont">
									<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.012" text="안전/품질경영 체계" /></h4>
									<div class="csr-diagram"><img src="/images/mobile/img_csr_diagram.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.012" text="안전/품질경영 체계" />" /></div>
								</div>
								<div class="csr-cont">
									<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.014" text="안전/품질경영 방침" /></h4>
									<ul class="csr-policy">
										<li class="csr-policy-item">
											<em class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.015" text="안전을 우선으로 검토하여 인본 중시" /></em>
											<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.016" text="프로젝트 수행과 수행 완료 이후에 발생할 수 있는 다양한 안전 사고 위험요소들을 도출해내고 실무 중심의 전문가들을 통해 사고발생을 사전에 철저히 차단하고 있습니다."/></p>
										</li>
										<li class="csr-policy-item">
											<em class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.017" text="EPC(설계-구매-시공)을 통한 기술 및 품질 경쟁력 확보" /></em>
											<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.018.MOB" text="급변하는 글로벌 시장에 발맞추어 꾸준한 변화와 혁신을 통해 Global Top에 걸맞는 기술 경쟁력을 확보하고, 고객만족을 우선시하는 품질경영을<br />철저히 수행하고 있습니다." /></p>
										</li>
										<li class="csr-policy-item">
											<em class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.019" text="지식경영 고도화를 통한 핵심역량 강화" /></em>
											<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.020" text="오랜 경험을 바탕으로 축적된 프로젝트 경험 사례와 사업 수행 자료의 활용을 통해<br />사업분야 전체의 핵심역량을 강화하고 있습니다." /></p>
										</li>
									</ul>
								</div>
								<div class="license-status">
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.021" text="안전/품질경영 대표 인증서" /></h3>
									<div class="license-wrap">
										<div class="inner">
											<a class="license-item" href="#none" role="button">
												<c:choose>
													<c:when test="${'ko' eq _lang}">
														<div class="img-box"><img src="/images/pc/img_csr_license01.jpg" alt="OHSAS인증서 (안전보건경영시스템)" /></div>
													</c:when>
													<c:otherwise>
														<div class="img-box"><img src="/images/pc/img_csr_license01_en.jpg" alt="OHSAS인증서 (안전보건경영시스템)" /></div>
													</c:otherwise>
												</c:choose>
												<em class="info-name"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.022.MOB" text="OHSAS인증서 (안전보건경영시스템)"/></em>
											</a>
											<a class="license-item" href="#none" role="button">
												<c:choose>
													<c:when test="${'ko' eq _lang}">
														<div class="img-box"><img src="/images/pc/img_csr_license02.jpg" alt="ISO 인증서 9001 (품질 및 환경)" /></div>
													</c:when>
													<c:otherwise>
														<div class="img-box"><img src="/images/pc/img_csr_license02_en.jpg" alt="ISO 인증서 9001 (품질 및 환경)" /></div>
													</c:otherwise>
												</c:choose>	
												<em class="info-name"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.023.MOB" text="ISO 9001 인증서<br>(품질경영시스템)"/></em>
											</a>
											<a class="license-item" href="#none" role="button">
												<c:choose>
													<c:when test="${'ko' eq _lang}">
														<div class="img-box"><img src="/images/pc/img_csr_license03.jpg" alt="ISO 인증서 14001 (품질 및 환경)" /></div>
													</c:when>
													<c:otherwise>
														<div class="img-box"><img src="/images/pc/img_csr_license03_en.jpg" alt="ISO 인증서 14001 (품질 및 환경)" /></div>
													</c:otherwise>
												</c:choose>
												<em class="info-name"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.024.MOB" text="ISO 14001 인증서<br>(환경경영시스템)"/></em>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="dim-pop-wrap">
							<!-- popup 제어 클래스 : active -->
							<div class="dim-pop">
								<div class="dim-header">
									<h1 class="dim-title"><div class="line-clamp"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.022.MOB" text="OHSAS인증서 (안전보건경영시스템)"/></div></h1>
								</div>
								<div class="dim-content">
									<div class="img-box"><img src="/images/pc/img_csr_license01.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.002.022.MOB" text="OHSAS인증서 (안전보건경영시스템)"/>" /></div>
								</div>
								<button class="layer-close" type="button">
									<i class="ico"></i>
									<span class="hide-txt">닫기</span>
								</button>
							</div>
						</div>
					</div>
					<div class="btm-full-banner sp-type-02">
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link2.jsp" %>
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