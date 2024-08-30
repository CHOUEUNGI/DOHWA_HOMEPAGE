<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="pr ci-introduce" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.002" text="홍보센터" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.003" text="Scroll" /></span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
							<div class="grid-ico-wrap" aria-hidden="true">
								<div class="grid-ico" aria-hidden="true"></div>
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
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
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
								<ul class="tab-list">
									<li class="active"><a class="item" href="<c:url value="/prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.001.004" text="CI소개" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.001.005" text="최신뉴스" /></a></li>
									<!--<c:if test="${'ko' eq _lang}">
										<li><a class="item" href="<c:url value="/prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.001.037" text="보도자료" /></a></li>
									</c:if>-->
									<li><a class="item" href="<c:url value="/prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.001.006" text="기업브로슈어" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.001.007" text="홍보영상" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents full-type clfix">
							<span class="page-decs page-decs-type02">
								<strong>04 <spring:message code="FRONT.COMMON.MENU.PRROOM.001.001" text="PR ROOM" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="symbol-keyword">
								<div class="inner">
									<div class="symbol-keyword-desc">
										 <c:choose>
									         <c:when test="${'es' eq _lang}">
									            <p>Identidad Corporativa :</p>
									         </c:when>
									         <c:otherwise>
									            <p>Brand Visual Concept :</p>
									         </c:otherwise>
									      </c:choose>
										<h3 class="desc-tit"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.009" text="심볼 디자인 키워드" /></h3>
										<div class="desc-txt">
										<spring:message code="FRONT.COMMON.MENU.PRROOM.001.010" text="<p>도화엔지니어링의 CI는 </p>
											<p>‘자연과 사람을 생각하는, 미래를 창조하는 기업’ 으로서</p>
											<p>변화의 의지를 담고 있습니다.</p>" />
										</div>
									</div>
									<div class="symbol-keyword-item">
										<ul class="clfix">
											<li class="item-circle"><span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.011" text="신뢰기반의 전문성 Trustworthy Solution" /></span></li>
											<li class="item-circle"><span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.012" text="지속가능한 미래 Sustainable Tomorrow" /></span></li>
											<li class="item-circle"><span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.013" text="끊임없는 혁신 Infinite Challenge" /></span></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="section-cont">
								<div class="content-inner">
									<div class="ci-cont">
										<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.014" text="컬러 정의" /></h3>
										<div class="color-define-box">
											<div class="inner-txt">
												<strong class="color-define-tit"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.015" text="DOHWA DEEP GREEN" /></strong>
												<p class="color-define-txt">
													<em><spring:message code="FRONT.COMMON.MENU.PRROOM.001.016" text="PANTONE"/></em>
													<span><spring:message code="FRONT.COMMON.MENU.PRROOM.001.017" text="7722&nbsp;&nbsp;C"/></span>
												</p>
												<p class="color-define-txt">
													<em><spring:message code="FRONT.COMMON.MENU.PRROOM.001.018" text="CMYK" /></em>
													<span><spring:message code="FRONT.COMMON.MENU.PRROOM.001.019" text="100&nbsp;&nbsp;0&nbsp;&nbsp;40&nbsp;&nbsp;70"/></span>
												</p>
												<p class="color-define-txt">
													<em><spring:message code="FRONT.COMMON.MENU.PRROOM.001.040" text="RGB" /></em>
													<span><spring:message code="FRONT.COMMON.MENU.PRROOM.001.038" text="0&nbsp;&nbsp;68&nbsp;&nbsp;66"/></span>
												</p>
												<p class="color-define-txt">
													<span><spring:message code="FRONT.COMMON.MENU.PRROOM.001.039" text="#004442"/></span>
												</p>
											</div>
										</div>
										<p class="cont-desc"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.020" text="자연을 상징하는 도화의 그린 컬러는 언제나 ‘자연과 사람’을 최우선으로 생각하며 고객과 인류에게 보답하는 도화의 정신을 표현합니다." /></p>
									</div>
									<div class="ci-cont">
										<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.024" text="Lettermark 레터마크" /></h3>
										<div class="cont-box ci-mean-box">
											<span class="img"><img src="/images/pc/img_ci_logo.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.025" text="도화 엔지니어링 CI" />" /></span>
										</div>
										<div class="cont-desc">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.001.025" text="<p>종합 엔지니어링 컨설팅 기업, 도화엔지니어링의 CI(Corporate Identity)는 원칙주의에 입각한 합리적인 경영을 토대로 반세기 동안 우리나라 엔지니어링 컨설팅 업계를 선도해온</p>" />
										</div>
									</div>
									<div class="ci-cont">
										<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.021" text="Graphic Motif 그래픽 모티브" /></h3>
										
										<!-- <div class="cont-box symbol-define-box">
											<span class="img"><img src="/images/pc/img_ci_symbol<c:out value="${_lang eq 'ko' ? '' : _lang eq 'en' ? '_en' : _lang eq 'es' ? '_es' : '' }" />.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.022" text="도화 엔지니어링 심볼" />" /></span>
										</div>
										<p class="cont-desc"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.023" text="원만한 대내외 인화력을 상징하며, 그린 색상의 변화(Gradation)는 오랜 전통을 바탕으로 한 회사의 &lsquo;뫼비우스 띠&rsquo; 처럼 영원 불변하다는 것을 표현하고 있습니다." /></p>
										<div class="cont-box symbol-define-box">
											<span class="img"><img src="/images/pc/img_ci_symbol<c:out value="${_lang eq 'ko' ? '' : _lang eq 'en' ? '_en' : _lang eq 'es' ? '_es' : '' }" />.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.022" text="도화 엔지니어링 심볼" />" /></span>
										</div>
										<p class="cont-desc"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.023.1" text="원만한 대내외 인화력을 상징하며, 그린 색상의 변화(Gradation)는 오랜 전통을 바탕으로 한 회사의 &lsquo;뫼비우스 띠&rsquo; 처럼 영원 불변하다는 것을 표현하고 있습니다." /></p>
										 -->
										
										<div class="ci-type-box">
											<div class="type-kor">
												<div class="ci-type-img">
													<img src="/images/pc/img_ci_graphic_a.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.022" text="도화 엔지니어링 심볼" />" />
												</div>
												<p class="cont-desc"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.023" text="Type A는 미래를 향해 비상하는 끊임없는 도전과 상승을 의미합니다.끊김 없이 상승하는 라인은 한계를 넘어 도전하는 구성원들의 열정과 미래로 이어지는 뛰어난 기술력을 나타냅니다." /></p>
											</div>
											<div class="type-eng">
												<div class="ci-type-img">
													<img src="/images/pc/img_ci_graphic_b.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.022" text="도화 엔지니어링 심볼" />" />
												</div>
												<p class="cont-desc"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.023.1" text="Type B는 길을 연상시키는 곡선 형태를 활용한 그래픽 모티브로, 도화가 지금껏 만들어온 역사, 그리고 새롭게 만들어 나갈 혁신의 길을 의미하며, Dohwa’s Way 로 명명됩니다." /></p>
											</div>
										</div>
									</div>
									
									<div class="ci-cont">
										<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.026" text="CI 타입" /></h3>
										<div class="ci-type-box">
											<div class="type-kor">
												<em class="title-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.027" text="국문타입" /></em>
												<div class="ci-type-img">
													<img src="/images/pc/img_ci_type_k01.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.028" text="국문타입 1" />" />
													<img src="/images/pc/img_ci_type_k02.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.029" text="국문타입 2" />" />
												</div>
											</div>
											<div class="type-eng">
												<em class="title-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.030" text="영문타입" /></em>
												<div class="ci-type-img">
													<img src="/images/pc/img_ci_type_e01.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.031" text="영문타입 1" />" />
													<img src="/images/pc/img_ci_type_e02.jpg" alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.032" text="영문타입 2" />" />
												</div>
											</div>
										</div>
										<div class="bttn-area center">
											<a class="bttn type01 style01 bttn-download" href="/upload/file_import/dohwa_ci_eng.pdf" target="_blank" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.033" text="C.I PDF 다운로드" />">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.034" text="C.I Download PDF" /></span>
												<i class="ico download" aria-hidden="true"></i>
											</a>
											<a class="bttn type01 style01 bttn-download" href="/upload/file_import/dohwa_ci_eng_ai.ai" target="_blank" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.001.035" text="C.I AI 다운로드" />">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.PRROOM.001.036" text="C.I Download AI" /></span>
												<i class="ico download" aria-hidden="true"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner sp-type-02">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
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