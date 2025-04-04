<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<%@ include file="/WEB-INF/views/front/layout/head.jsp"%>
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
	<div class="pr" id="wrap">
		<%@ include file="/WEB-INF/views/front/layout/header.jsp"%>
		<div id="container">
			<div id="content" role="main">
				<div class="page-visual promotion01 visual-area">
					<div class="page-title-sec">
						<span class="title-main-sub"><spring:message
								code="FRONT.COMMON.MENU.PRROOM.003.001.001" text="PR ROOM" /></span>
						<h2 class="title-main">
							<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.002"
								text="홍보센터" />
						</h2>
					</div>
					<div class="noti-scroll none">
						<span class="txt"><spring:message
								code="FRONT.COMMON.MENU.PRROOM.003.001.020" text="Scroll" /></span> <span
							class="ico01" aria-hidden="true"></span> <span class="ico02"
							aria-hidden="true"></span>
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
				<div class="contents-wrap" style="position: relative">
					<div class="page-tab-section">
						<div class="tab-menu-type01 center">
							<ul class="tab-list">
								<li><a class="item" href="<c:url value="/prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.003" text="CI소개" /></a></li>
								<li><a class="item" href="<c:url value="/prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.004" text="최신뉴스" /></a></li>
								<!--<c:if test="${'ko' eq _lang}">
									<li><a class="item" href="<c:url value="/prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.019" text="보도자료" /></a></li>
								</c:if>--> 
								<li class="active"><a class="item" href="<c:url value="/prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.005" text="기업브로슈어" /></a></li>
								<li><a class="item" href="<c:url value="/prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.006" text="홍보영상" /></a></li>
							</ul>
						</div>
					</div>
					<div class="contents full-type no-btm-type clfix">
						<span class="page-decs page-decs-type02"> <strong>04
								<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.007"
									text="PR ROOM" />
						</strong> <spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005"
								text="DOHWA ENGINEERING" />
						</span>
						<div class="brochure-wrap">
							<div class="brochure-inner">
								<span class="brochure-img"><img
									src="/images/pc/img_promotion_brochure.jpg"
									alt="<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.009" text="SHAPE THE FUTURE 도화가 디자인하는 세상, 함께 만들어가는 미래" />" /></span>
								<div class="brochure-txt">
									<span class="add-txt"> <em>2024</em> <span><spring:message
												code="FRONT.COMMON.MENU.PRROOM.003.001.010"
												text="Comprehensive Catalog" /></span>
									</span>
									<div class="brochure-desc">
										<strong><spring:message
												code="FRONT.COMMON.MENU.PRROOM.003.001.011"
												text="‘자연과 사람’을 생각합니다." /></strong>
										<p class="desc">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.012"
												text="도화엔지니어링은 상하수도, 수자원개발, 도시, 조경, 철도, 도로, 교통, 교량, 터널, 항만,<br />환경, 플랜트 등 엔지니어링 전 분야에서 기획&middot;타당성조사&middot;설계&middot;분석&middot;시험&middot;감리&middot;시공&middot;구매&middot;<br />시운전&middot;평가&middot;자문 및 지도 업무를 수행하는 종합엔지니어링 컨설팅 회사 입니다." />
										</p>
									</div>
									<div class="brochure-down">
										<button class="bttn type01 style01 bttn-download"
											type="button" onclick="download('ko');"
											title="<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.013" text="Korean brochure 다운로드" />">
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.PRROOM.003.001.014" text="Korean" /></span>
											<em class="ico download" aria-hidden="true"></em>
										</button>
										<button class="bttn type01 style01 bttn-download"
											type="button" onclick="download('en');"
											title="<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.015" text="English brochure 다운로드" />">
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.PRROOM.003.001.016" text="English" /></span>
											<em class="ico download" aria-hidden="true"></em>
										</button>
										<button class="bttn type01 style01 bttn-download"
											type="button" onclick="download('es');"
											title="<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.018" text="Spanish brochure 다운로드" />">
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.PRROOM.003.001.019" text="Spanish" /></span>
											<em class="ico download" aria-hidden="true"></em>
										</button>
										<button class="bttn type01 style01 bttn-download"
											type="button" onclick="download('arab');"
											title="<spring:message code="FRONT.COMMON.MENU.PRROOM.003.001.020" text="Arabic brochure 다운로드" />">
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.PRROOM.003.001.021" text="Arabic" /></span>
											<em class="ico download" aria-hidden="true"></em>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btm-full-banner sp-type-02">
						<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp"%>
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
		<%@ include file="/WEB-INF/views/front/layout/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/front/layout/after_script.jsp"%>
	<script>
		function download(lang) {
			var pdfUrl = "/upload/file_import/2024_KOREAN.pdf";
			if (lang === 'en') {
				pdfUrl = "/upload/file_import/2024_ENGLISH.pdf";
			} else if (lang === 'es') {
				pdfUrl = "/upload/file_import/2024_SPANISH.pdf";
			} else if (lang === 'arab') {
				pdfUrl = "/upload/file_import/2024_ARABIC.pdf";
			}
			window.open(pdfUrl);
		}
	</script>
</body>
</html>