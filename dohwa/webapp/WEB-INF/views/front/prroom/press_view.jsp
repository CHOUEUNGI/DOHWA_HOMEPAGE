<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
		<div class="pr" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.002" text="홍보센터" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.022" text="Scroll" /></span>
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
									<li><a class="item" href="<c:url value="/prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.003" text="CI소개" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.004" text="CI최신뉴스" /></a></li>
									<!--<c:if test="${'ko' eq _lang}">
										<li class="active"><a class="item" href="<c:url value="/prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.024" text="보도자료" /></a></li>
									</c:if>-->
									<li><a class="item" href="<c:url value="/prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.005" text="기업브로슈어" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.006" text="홍보영상" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents business-cont-wrap clfix">
							<span class="page-decs">
								<strong>04 <spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.001" text="PR ROOM" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont first-cont">
								<div id="print_page" class="bbs-view">
									<div class="bbs-tit-area">
										<strong class="bbs-tit-press"><c:out value="${pressVO.title}" /></strong>
									</div>
									<div class="bbs-share-area">
										<p class="bbs-tit-press-dt"><c:out value="${pressVO.writeDt}" /></p>
										<button class="bttn bttn-sns-print" type="button">
											<em class="ico sns-print"></em>
											<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.014" text="인쇄" /></span>
										</button>
										<button class="bttn bttn-sns-kakao" type="button">
											<em class="ico sns-kakao"></em>
											<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.014" text="카카오톡" /></span>
										</button>
										<button class="bttn bttn-sns-facebook" type="button">
											<em class="ico sns-facebook"></em>
											<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.015" text="페이스북" /></span>
										</button>
									</div>
									<div class="bbs-cont-area" id="print-area">
										<div class="bbs-box-bd">
											<div class="pressview-img-div">
												<div class="pressview-img">
												<c:choose>
													<c:when test="${null ne pressVO.path}">
														<img src="<c:url value="${WEB_URL }${pressVO.path }" />" alt="<c:out value="${pressVO.title}" /><c:out value="${status.count}" />" />
													</c:when>
													<c:otherwise>
														<img src="/images/common/press_view_logo.png" alt="<c:out value="${pressVO.title}"/>" />
													</c:otherwise>
												</c:choose>
												</div>
											</div>
											<!-- <div class="bbs-box-img-size">
									       		<div class="bbs-box-img-center">
									       			<img src="<c:url value="${WEB_URL }${pressVO.path }" />" alt="<c:out value="${pressVO.title}" /><c:out value="${status.count}" />" />
									            </div>
											</div> -->
											<div class="bbs-box-cont-press"><c:out value="${fn:replace(pressVO.cont, newLineChar, '<br/>')}" escapeXml="false"/></div>
										</div>
									</div>
								</div>
							</div>
							<div class="bbs-bttn-area">
								<a class="bttn-bbs-list" href="<c:url value="/prroom/press" />" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" />">
									<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" /></div>
								</a>
							</div>
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
		<script>
			SnsUtils.kakaoInit();
			$('.bttn-sns-kakao').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${pressVO.title}" />', '<c:out value="${pressVO.title}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.kakaoShare();
			});

			$('.bttn-sns-facebook').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${pressVO.title}" />', '<c:out value="${pressVO.title}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.fbShare();
			});
			
			$('.bttn-sns-print').on('click', function() {
				PrintUtils.printPage('print-area');
			});
			
		</script>
	</body>
</html>