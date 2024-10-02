<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<header class="header" id="header">
	<ul class="skipnav">
		<li><a href="#"><spring:message code="FRONT.COMMON.MENU.HEADER.001" text="주요메뉴 바로가기" /></a></li>
		<li><a href="#content"><spring:message code="FRONT.COMMON.MENU.HEADER.002" text="컨텐츠 바로가기" /></a></li>
	</ul>
	<div class="header_content">
		<h1 class="logo-wrap">
			<a href="<c:url value="${mobileStartPath}main" />"></a>
			<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.HEADER.003.MOBILE" text="DOHWA" /></span>
		</h1>
		<div class="header-menu">
			<span class="btn-gnb-wrap">
				<button class="bttn-all-menu" type="button">
					<em class="ico gnb-menu" aria-hidden="true"></em>
					<span class="hide-txt">Menu</span>
				</button>
			</span>
			<div class="header-all-menu">
				<div class="scroll-wrap">
					<ul class="all-menu-list">
						<li class="all-menu-item active">
							<a href="javascript:void(0);">
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" />
								<i class="ico-gnb-arrow" aria-hidden="true"></i>
							</a>
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/overview" />"><spring:message code="FRONT.COMMON.MENU.HEADER.005" text="Overview" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/vision" />"><spring:message code="FRONT.COMMON.MENU.HEADER.006" text="Vision" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/people" />"><spring:message code="FRONT.COMMON.MENU.HEADER.007" text="People" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/history" />"><spring:message code="FRONT.COMMON.MENU.HEADER.008" text="History" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/csr_01" />"><spring:message code="FRONT.COMMON.MENU.HEADER.009" text="CSR" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}aboutus/contactus" />"><spring:message code="FRONT.COMMON.MENU.HEADER.010" text="Contact us" /></a></li>
							</ul>
						</li>
						<li class="all-menu-item">
							<a href="javascript:void(0);">
								<spring:message code="FRONT.COMMON.MENU.HEADER.011" text="사업소개" />
								<i class="ico-gnb-arrow" aria-hidden="true"></i>
							</a>
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}business" />"><spring:message code="FRONT.COMMON.MENU.HEADER.012" text="Overview" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}business/project" />"><spring:message code="FRONT.COMMON.MENU.HEADER.013" text="프로젝트" /></a></li>
							</ul>
						</li>
						<li class="all-menu-item">
							<a href="javascript:void(0);">
								<spring:message code="FRONT.COMMON.MENU.HEADER.014" text="투자정보" />
								<i class="ico-gnb-arrow" aria-hidden="true"></i>
							</a>
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}invest/finance" />"><spring:message code="FRONT.COMMON.MENU.HEADER.015" text="재무정보" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}invest/eAnno" />"><spring:message code="FRONT.COMMON.MENU.HEADER.016" text="전자공고 및 공시" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}invest/ir" />"><spring:message code="FRONT.COMMON.MENU.HEADER.017" text="IR 자료실" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}invest/stock" />"><spring:message code="FRONT.COMMON.MENU.HEADER.018" text="주식 및 주주정보" /></a></li>
							</ul>
						</li>
						<li class="all-menu-item">
							<a href="javascript:void(0);">
								<spring:message code="FRONT.COMMON.MENU.HEADER.019" text="홍보센터" />
								<i class="ico-gnb-arrow" aria-hidden="true"></i>
							</a>
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}prroom/ci" />"><spring:message code="FRONT.COMMON.MENU.HEADER.020" text="CI소개" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}prroom/news" />"><spring:message code="FRONT.COMMON.MENU.HEADER.021" text="최신뉴스" /></a></li>
								<!--<c:if test="${'ko' eq _lang}">
									<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}prroom/press" />"><spring:message code="FRONT.COMMON.MENU.HEADER.032" text="보도자료" /></a></li>
								</c:if>-->
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}prroom/brochure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.022" text="기업브로슈어" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}prroom/promotional" />"><spring:message code="FRONT.COMMON.MENU.HEADER.023" text="홍보영상" /></a></li>
							</ul>
						</li>
						<li class="all-menu-item">
							<a href="javascript:void(0);">
								<spring:message code="FRONT.COMMON.MENU.HEADER.024" text="채용정보" />
								<i class="ico-gnb-arrow" aria-hidden="true"></i>
							</a>
							<c:choose>
								<c:when test="${'ko' eq _lang}">
									<ul class="gnb-sub-list">
										<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}recruit/procedure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.025" text="채용안내" /></a></li>
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}recruit/introduction" />"><spring:message code="FRONT.COMMON.MENU.HEADER.033" text="직무소개" /></a></li>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
											</c:when>
											<c:when test="${'en' eq _lang}">
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
												</a>
											</c:when>
											<c:otherwise>
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
												</a>
											</c:otherwise>
										</c:choose>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="gnb-sub-list">
										<li class="gnb-sub-item"><a href="<c:url value="${mobileStartPath}recruit/procedure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.025" text="채용안내" /></a></li>
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
											</c:when>
											<c:when test="${'en' eq _lang}">
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
												</a>
											</c:when>
											<c:otherwise>
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
												</a>
											</c:otherwise>
										</c:choose>
									</ul>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
					<ul class="lang-list">
						<li>
							<button class="bttn-lang <c:if test="${_lang eq 'ko'}">on</c:if>" type="button" onclick="CommonUtils.chgLang('ko');"><spring:message code="FRONT.COMMON.MENU.HEADER.028" text="KOR" /></button>
						</li>
						<li>
							<button class="bttn-lang <c:if test="${_lang eq 'en'}">on</c:if>" type="button" onclick="CommonUtils.chgLang('en');"><spring:message code="FRONT.COMMON.MENU.HEADER.029" text="ENG" /></button>
						</li>
						<li>
							<button class="bttn-lang <c:if test="${_lang eq 'es'}">on</c:if>" type="button" onclick="CommonUtils.chgLang('es');"><spring:message code="FRONT.COMMON.MENU.HEADER.030" text="ESP" /></button>
						</li>
					</ul>
				</div>
				<button class="bttn-menu-close" type="button" title="<spring:message code="FRONT.COMMON.MENU.HEADER.032" text="전체메뉴 닫기" />"><span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.HEADER.032" text="전체메뉴 닫기" /></span></button>
			</div>
		</div>
	</div>
</header>