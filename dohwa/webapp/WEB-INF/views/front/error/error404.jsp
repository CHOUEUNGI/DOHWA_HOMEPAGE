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
		<div class="etc etc-error" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="contents">
						<div class="section-cont">
							<img src="/images/common/img_footer_logo.jpg" alt="DOHWA 엔지니어링" />
							<h2 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ERROR.002.001" text="서비스 이용에 불편을 드려 죄송합니다." /></h2>
							<i class="ico-exmark" aria-hidden="true"></i>
							<div class="error-msg">
								<p><spring:message code="FRONT.COMMON.MENU.ERROR.002.002" text="요청하신 페이지는 접근권한이 없거나, 사용이 중지된 페이지로 존재하지 않습니다." /></p>
								<p><spring:message code="FRONT.COMMON.MENU.ERROR.002.003" text="다시 한번 URL을 확인하시고 접근을 시도해 주시기 바랍니다. 감사합니다." /></p>
							</div>
							<div class="bttn-area">
								<a class="bttn type01 style02" href="/main">
									<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ERROR.002.004" text="메인으로 돌아가기" /></span>
									<i class="ico01" aria-hidden="true"></i>
								</a>
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