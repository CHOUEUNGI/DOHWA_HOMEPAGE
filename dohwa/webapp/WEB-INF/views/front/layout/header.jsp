<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<header id="header">
	<ul class="skipnav">
		<li><a href="#"><spring:message code="FRONT.COMMON.MENU.HEADER.001" text="주요메뉴 바로가기" /></a></li>
		<li><a href="#content"><spring:message code="FRONT.COMMON.MENU.HEADER.002" text="컨텐츠 바로가기" /></a></li>
	</ul>
	<div class="header-content">
		<h1 class="logo-wrap"><a href="<c:url value="/main" />"><spring:message code="FRONT.COMMON.MENU.HEADER.003" text="도화엔지니어링" /></a></h1>
		<div class="gnb-wrap">
			<ul class="gnb-menu-list">
				<li class="gnb-menu-item">
					<a class="gnb-menu-link" href="<c:url value="/aboutus/overview" />"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></a>
					<ul class="gnb-sub-list">
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/overview" />"><spring:message code="FRONT.COMMON.MENU.HEADER.005" text="Overview" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/vision" />"><spring:message code="FRONT.COMMON.MENU.HEADER.006" text="Vision" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/people" />"><spring:message code="FRONT.COMMON.MENU.HEADER.007" text="People" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/history" />"><spring:message code="FRONT.COMMON.MENU.HEADER.008" text="History" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/csr_01" />"><spring:message code="FRONT.COMMON.MENU.HEADER.009" text="CSR" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/aboutus/contactus" />"><spring:message code="FRONT.COMMON.MENU.HEADER.010" text="Contact us" /></a></li>
					</ul>
				</li>
				<li class="gnb-menu-item">
					<a class="gnb-menu-link" href="<c:url value="/business" />"><spring:message code="FRONT.COMMON.MENU.HEADER.011" text="사업소개" /></a>
					<ul class="gnb-sub-list">
						<li class="gnb-sub-item"><a href="<c:url value="/business" />"><spring:message code="FRONT.COMMON.MENU.HEADER.012" text="Overview" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/business/project" />"><spring:message code="FRONT.COMMON.MENU.HEADER.013" text="프로젝트" /></a></li>
					</ul>
				</li>
				<li class="gnb-menu-item">
					<a class="gnb-menu-link" href="<c:url value="/invest/finance" />"><spring:message code="FRONT.COMMON.MENU.HEADER.014" text="투자정보" /></a>
					<ul class="gnb-sub-list">
						<li class="gnb-sub-item"><a href="<c:url value="/invest/finance" />"><spring:message code="FRONT.COMMON.MENU.HEADER.015" text="재무정보" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/invest/eAnno" />"><spring:message code="FRONT.COMMON.MENU.HEADER.016" text="전자공고 및 공시" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/invest/ir" />"><spring:message code="FRONT.COMMON.MENU.HEADER.017" text="IR 자료실" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/invest/stock" />"><spring:message code="FRONT.COMMON.MENU.HEADER.018" text="주식 및 주주정보" /></a></li>
					</ul>
				</li>
				<li class="gnb-menu-item">
					<a class="gnb-menu-link" href="<c:url value="/prroom/ci" />"><spring:message code="FRONT.COMMON.MENU.HEADER.019" text="홍보센터" /></a>
					<ul class="gnb-sub-list">
						<li class="gnb-sub-item"><a href="<c:url value="/prroom/ci" />"><spring:message code="FRONT.COMMON.MENU.HEADER.020" text="CI소개" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/prroom/news" />"><spring:message code="FRONT.COMMON.MENU.HEADER.021" text="최신뉴스" /></a></li>
						<!--<c:if test="${'ko' eq _lang}">
							<li class="gnb-sub-item"><a href="<c:url value="/prroom/press" />"><spring:message code="FRONT.COMMON.MENU.HEADER.032" text="보도자료" /></a></li>
						</c:if>-->
						<li class="gnb-sub-item"><a href="<c:url value="/prroom/brochure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.022" text="기업브로슈어" /></a></li>
						<li class="gnb-sub-item"><a href="<c:url value="/prroom/promotional" />"><spring:message code="FRONT.COMMON.MENU.HEADER.023" text="홍보영상" /></a></li>
					</ul>
				</li>
				<li class="gnb-menu-item">
					<a class="gnb-menu-link" href="<c:url value="/recruit/procedure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.024" text="채용정보" /></a>
						<c:choose>
						<c:when test="${'ko' eq _lang}">
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="/recruit/procedure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.025" text="채용안내" /></a></li>
								<li class="gnb-sub-item"><a href="<c:url value="/recruit/introduction" />"><spring:message code="FRONT.COMMON.MENU.HEADER.033" text="직무소개" /></a></li>	
								<li class="gnb-sub-item">
									<c:choose>
										<c:when test="${'ko' eq _lang}">
											<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
												<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
											</a>
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
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="gnb-sub-list">
								<li class="gnb-sub-item"><a href="<c:url value="/recruit/procedure" />"><spring:message code="FRONT.COMMON.MENU.HEADER.025" text="채용안내" /></a></li>	
								<li class="gnb-sub-item">
									<c:choose>
										<c:when test="${'ko' eq _lang}">
											<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
												<spring:message code="FRONT.COMMON.MENU.HEADER.026" text="채용지원" />
											</a>
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
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
		<div class="menu">
			<!-- 메인에 회사브로셔 다운로드 없앰. 글로벌팀 요청! 2020.09.29 -->
			<!-- <span class="down-wrap">
				<c:choose>
					<c:when test="${_lang eq 'ko'}"><a class="bttn-down-brochure" href="/upload/file_import/2019_KOREAN.pdf" target="_blank"></c:when>
					<c:otherwise><a class="bttn-down-brochure" href="/upload/file_import/2019_ENGLISH.pdf" target="_blank"></c:otherwise>
				</c:choose>
					<spring:message code="FRONT.COMMON.MENU.HEADER.027" text="회사소개 브로셔" />
					<em class="ico down" aria-hidden="true"></em>
				</a>
			</span> -->
			<span class="lang-wrap">
				<c:choose>
					<c:when test="${_lang eq 'ko'}"><c:set var="langText"><spring:message code="FRONT.COMMON.MENU.HEADER.028" text="KOR" /></c:set></c:when>
					<c:when test="${_lang eq 'en'}"><c:set var="langText"><spring:message code="FRONT.COMMON.MENU.HEADER.029" text="ENG" /></c:set></c:when>
					<c:when test="${_lang eq 'es'}"><c:set var="langText"><spring:message code="FRONT.COMMON.MENU.HEADER.030" text="ESP" /></c:set></c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<button class="bttn-lang-sel" type="button" style="outline:none"><c:out value="${langText}" /></button>
				<ul class="lang-list">
					<li>
						<button class="bttn-lang" type="button" onclick="CommonUtils.chgLang('ko')"><spring:message code="FRONT.COMMON.MENU.HEADER.028" text="KOR" /></button>
					</li>
					<li>
						<button class="bttn-lang" type="button" onclick="CommonUtils.chgLang('en')"><spring:message code="FRONT.COMMON.MENU.HEADER.029" text="ENG" /></button>
					</li>
					<li>
						<button class="bttn-lang" type="button" onclick="CommonUtils.chgLang('es')"><spring:message code="FRONT.COMMON.MENU.HEADER.030" text="ESP" /></button>
					</li>
				</ul>
			</span>
			<span class="btn-gnb-wrap">
				<button class="bttn-all-menu" type="button" style="outline:none">
					<em class="ico gnb-menu" aria-hidden="true"></em>
					<spring:message code="FRONT.COMMON.MENU.HEADER.031" text="MENU" />
				</button>
			</span>
		</div>
	</div>
</header>