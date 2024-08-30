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
		<div class="press" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
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
					<div class="contents no-btm-type">
						<div class="section-cont press">
							<div class="press-cont">
								<strong><h3 style="font-size:4.6vw; line-height:1.2; font-weight:bold;"><c:out value="${pressVO.title}" /></h3></strong>
								<div><p style="margin-top:5px; margin-bottom:5px;"><span style="color:#004442; font-size:0.9rem; font-weight:bold;"><c:out value="${pressVO.writeDt}" /></span></p></div>
								<div class="bbs-share-area">
									<button class="bttn-link-share" type="button">
										<em class="ico link-share"></em>
										<span class="hide-txt"><spring:message text="링크콩유" /></span>
									</button>
									<button class="bttn-sns-kakao" type="button">
										<em class="ico sns-kakao"></em>
										<span class="hide-txt"><spring:message text="카카오톡" /></span>
									</button>
									<button class="bttn-sns-facebook" type="button">
										<em class="ico sns-facebook"></em>
										<span class="hide-txt"><spring:message text="페이스북" /></span>
									</button>
								</div>
								<div class="press-cont-box">
									<c:choose>
										<c:when test="${null ne pressVO.path}">
											<img src="<c:url value="${WEB_URL }${pressVO.path }" />" alt="<c:out value="${pressVO.title}" /><c:out value="${status.count}" />" />
										</c:when>
										<c:otherwise>
											<img src="/images/common/press_view_logo.png" alt="<c:out value="${pressVO.title}"/>" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="cont-desc">
									<c:out value="${fn:replace(pressVO.cont, newLineChar, '<br/>')}" escapeXml="false"/>
								</div>
							</div>
							<div class="press-bttn-area">
								<a class="bttn-press-list" href="<c:url value="${mobileStartPath}prroom/press" />" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" />">
									<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.002.016" text="목록" /></div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script>
			$(".table").attr("style","");
			SnsUtils.kakaoInit();
			$('.bttn-sns-kakao').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${pressVO.title}" />', '<c:out value="${pressVO.title}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.kakaoShare();
			});

			$('.bttn-sns-facebook').off('click').on('click', function() {
				SnsUtils.setMetaTag(location.href, '<c:out value="${pressVO.title}" />', '<c:out value="${pressVO.title}" />', location.origin + '<c:out value="${imagePath}" />');
				SnsUtils.fbShare();
			});
			
			$('.bttn-link-share').off('click').on('click', function() {
				CopyUrl();
			});
			
			function CopyUrl() {
		        var tempInput  = document.createElement("input");
		        var obShareUrl = location.href;
		        
		        document.body.appendChild(tempInput);
		        tempInput.value = obShareUrl;
		        tempInput.select();
		        document.execCommand("copy");
		        alert("클립보드에 복사되었습니다.");
		        document.body.removeChild(tempInput);
		    }
			
		</script>
	</body>
</html>