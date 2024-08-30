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
		<div class="business" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual business01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.002" text="사업소개" /></h2>
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
								<li><a class="item" href="<c:url value="${mobileStartPath}business" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.003" text="Overview" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}business/project" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.004" text="Project" /></a></li>
							</ul>
						</div>
					</div>
					<div class="contents business-cont-wrap" style="display:block;">
						<div class="section-cont first-cont">
							<div class="bbs-view">
								<div class="bbs-tit-area">
									<strong class="bbs-tit"><c:out value="${projectVO.projectMlVO.title}" /></strong>
									<p class="bbs-sub-tit"><c:out value="${projectVO.projectMlVO.subTitle}" /></p>
									<div class="bbs-keyword-wrap">
										<c:if test="${not empty projectVO.type1}"><span class="keyword">#<c:out value="${projectVO.type1}" /></span></c:if>
										<c:if test="${not empty projectVO.type4}"><span class="keyword">#<c:out value="${projectVO.type4}" /></span></c:if>
										<c:if test="${not empty projectVO.type2}"><span class="keyword">#<c:out value="${projectVO.type2}" /></span></c:if>
										<c:if test="${not empty projectVO.type5}"><span class="keyword">#<c:out value="${projectVO.type5}" /></span></c:if>
									</div>
								</div>
								<div class="bbs-cont-area">
									<div class="bbs-img-slide swiper-container">
										<div class="swiper-wrapper">
										<c:forEach var="img" items="${projectVO.files}" varStatus="status">
											<c:if test="${0 eq status.index}">
												<c:set var="imagePath" value="${WEB_URL}${img.path}/${img.newName}" />
											</c:if>
											<div class="swiper-slide slide"><img src="<c:url value="${WEB_URL}${img.path}/${img.newName}" />" alt="<c:out value="${projectVO.projectMlVO.title}" /><c:out value="${status.count}" />" /></div>
										</c:forEach>
										</div>
										<div class="swiper-pagination"></div>
									</div>
									<div class="bbs-sec-tit"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.007" text="프로젝트 정보" /></div>
									<div class="bbs-box-bd">
										<dl>
											<dt><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.008" text="국가" /></dt>
											<dd><c:out value="${projectVO.type5}" /></dd>
										</dl>
										<dl>
											<dt><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.009" text="서비스형태" /></dt>
											<dd><c:out value="${projectVO.type2}" /></dd>
										</dl>
										<dl>
											<dt><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.010" text="준공년도" /></dt>
											<dd><c:out value="${projectVO.year}" /><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.011" text="년" /></dd>
										</dl>
										<dl class="last-box">
											<dt><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.012" text="발주처" /></dt>
											<dd><c:out value="${projectVO.projectMlVO.client}" /></dd>
										</dl>
									</div>
									<div class="bbs-sec-tit"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.013" text="프로젝트 소개" /></div>
									<div class="bbs-box-bd">
										<p class="bbx-box-txt">
											<c:out value="${fn:replace(projectVO.projectMlVO.cont, newLineChar, '<br/>')}" escapeXml="false"/>
										</p>
									</div>
								</div>
								<%-- <div class="bbs-share-area">
									<button class="bttn-sns-kakao" type="button">
										<em class="ico sns-kakao"></em>
										<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.014" text="카카오톡" /></span>
									</button>
									<button class="bttn-sns-facebook" type="button">
										<em class="ico sns-facebook"></em>
										<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.015" text="페이스북" /></span>
									</button>
								</div> --%>
								<div class="bbs-bttn-area">
									<c:choose>
										<c:when test="${not empty param.searchType}">
											<a class="bttn-bbs-list" href="<c:url value="${mobileStartPath}business/project?searchType="/><c:out value="${param.searchType}"/>" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" />">
												<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" /></div>
											</a>
										</c:when>
										<c:otherwise>
											<a class="bttn-bbs-list" href="<c:url value="${mobileStartPath}business/project" />" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" />">
												<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" /></div>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script>
			var businessSwiper = new Swiper(".business-slide.swiper-container", {
				slidesPerView: 2,
				slidesPerGroup: 2,
				//autoHeight : true,
				pagination: {
					el: ".business-slide .swiper-pagination"
				}
			});

			/* var projectSwiper = new Swiper(".bbs-img-slide", {
				slidesPerView: 1,
				slidesPerView: "auto",
				pagination: {
					el: ".bbs-img-slide .swiper-pagination"
				}
			}); */

			SnsUtils.kakaoInit();
			$('.bttn-sns-kakao').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${projectVO.projectMlVO.title}" />', '<c:out value="${projectVO.projectMlVO.subTitle}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.kakaoShare();
			});

			$('.bttn-sns-facebook').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${projectVO.projectMlVO.title}" />', '<c:out value="${projectVO.projectMlVO.subTitle}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.fbShare();
			});
		</script>
	</body>
</html>