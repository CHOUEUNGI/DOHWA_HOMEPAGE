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
		<div class="pr pr-news" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.002" text="홍보센터" /></h2>
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
							<ul class="tab-list">
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.003" text="CI소개" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.004" text="최신뉴스" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.005" text="기업브로슈어" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.006" text="홍보영상" /></a></li>
							</ul>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont">
							<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.020" text="최신뉴스 상세" /></h3>
							<div class="news-detail-wrap">
								<div class="news-head">
									<span class="news-type">
										<c:choose>
											<c:when test="${'01' eq boardVO.typeCode}"><span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.008" text="영업" /></span></c:when>
											<c:when test="${'02' eq boardVO.typeCode}"><span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.009" text="수상" /></span></c:when>
											<c:when test="${'03' eq boardVO.typeCode}"><span class="news-label green"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.010" text="사회공헌" /></span></c:when>
											<c:otherwise><span class="news-label gray"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.011" text="기타" /></span></c:otherwise>
										</c:choose>
									</span>
									<span class="news-title"><span class="line-clamp"><c:out value="${boardVO.title}" /></span></span>
								</div>
							</div>
							<div class="news-detail-content">
								<span class="news-img">
									<c:forEach var="img" items="${boardVO.pcFileList}" varStatus="status">
										<img src="<c:url value="${WEB_URL}${img.path}/${img.newName}" />" alt="<c:out value="${boardVO.title}"/><c:out value="${status.count}" />" />
									</c:forEach>
								</span>
								<div class="news-desc">
									<c:out value="${boardVO.cont}" escapeXml="false" />
								</div>
							</div>
							<div class="bbs-bttn-area">
								<c:if test="${0 < fn:length(boardPrev)}">
								<a class="bttn-bbs-prev" href="<c:url value="${mobileStartPath}prroom/news/${boardPrev[0].seq}" />" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.012" text="이전" />">
									<em class="ico"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.013" text="PREV" /></em>
									<span class="line-clamp"><c:out value="${boardPrev[0].title}" /></span>
								</a>
								</c:if>

								<c:if test="${0 == fn:length(boardPrev)}">
								<a class="bttn-bbs-prev disabled" href="javascript:void(0);" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.012" text="이전" />">
									<em class="ico"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.013" text="PREV" /></em>
									<span class="line-clamp"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.014" text="이전글이 없습니다." /></span>
								</a>
								</c:if>

								<a class="bttn-bbs-list" href="<c:url value="${mobileStartPath}prroom/news" />" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.015" text="목록" />">
									<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.015" text="목록" /></div>
								</a>

								<c:if test="${0 < fn:length(boardNext)}">
								<a class="bttn-bbs-next" href="<c:url value="${mobileStartPath}prroom/news/${boardNext[0].seq}" />" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.016" text="다음" />">
									<em class="ico"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.017" text="NEXT" /></em>
									<span class="line-clamp"><c:out value="${boardNext[0].title}" /></span>
								</a>
								</c:if>
								<c:if test="${0 == fn:length(boardNext)}">
								<a class="bttn-bbs-next disabled" href="javascript:void(0);" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.016" text="다음" />">
									<em class="ico"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.017" text="NEXT" /></em>
									<span class="line-clamp"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.018" text="다음글이 없습니다." /></span>
								</a>
								</c:if>
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