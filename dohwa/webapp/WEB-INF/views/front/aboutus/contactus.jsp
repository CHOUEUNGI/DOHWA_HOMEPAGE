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
		<div class="intro intro-contactus" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<!-- 20200805 스크롤 수정 start-->
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<!-- 20200805 스크롤 수정 end-->
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
							</div>
						</div>
						<div class="contents no-btm-type clfix" style="display:block;">
							<span class="page-decs">
								<strong>
									<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" />
									<!-- 20200811 텍스트 수정 -->
								</strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont">
								<div class="tab-menu-type02">
									<ul class="tab-list">
										<li class="active">
											<a class="item" href="<c:url value="/aboutus/contactus" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.009" text="연락처 &middot; 본사위치" /></span></a>
										</li>
										<li>
											<a class="item" href="<c:url value="/aboutus/overseas" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.010" text="해외지사" /></span></a>
										</li>
										<li>
											<a class="item" href="<c:url value="/aboutus/custInqr" />"><span class="txt" data-id=""><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.011" text="문의사항" /></span></a>
										</li>
									</ul>
								</div>
								<div class="inner-tab-cont active">
									<div class="location-wrap">
										<div class="location-map" id="map">
										</div>
										<div class="location-desc">
											<div class="t-cell-left">
												<p class="add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008" text="서울특별시 강남구 삼성로 438 (06178)" /></p>
											</div>
											<div class="t-cell-right">
												<span class="tel"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.1" text="전화: 02-6323-3000" /></span>
												<span class="fax"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.2" text="팩스: 02-553-8021" /></span>
											</div>
										</div>
									</div>
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3" text="지하철 이용 시" /></h3>
									<div class="subway-wrap">
										<div class="t-cell-left">
											<em class="tit">
												<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.1" text="2호선 삼성역<span class='num'>4</span>번 출구 방면" />
											</em>
											<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.2" text="포스코사거리 사거리 방향으로 직진" /></p>
											<p class="desc">
												<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.3" text="도보 10분, 약 500m" /></span>
												<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.4" text="좌회전 방향으로 100m 전방" /></span>
												<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.5" text="도화타워 도착" /></span>
											</p>
										</div>
										<div class="t-cell-right">
											<em class="tit">
												<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.6" text="2호선 선릉역<span class='num'>1</span>번 출구 방면" />
											</em>
											<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.7" text="포스코사거리 사거리 방향으로 직진" /></p>
											<p class="desc">
												<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.8" text="도보 15분, 약 700m" /></span>
												<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.008.3.9" text="도화타워 도착" /></span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %>
						</div>
						<!-- s : 20200813 grid mixin 추가-->
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
						<!-- e : 20200813 grid mixin 추가-->
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
	</body>
	<script type="text/javascript">

		function initMap() {

			var uluru = {
				lat : 37.506087,
				lng : 127.0575086
			};

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 17,
				center : uluru
			});

			var marker = new google.maps.Marker({
				position : uluru,
				map : map,
				icon: {
					url: "/resources/images/common/pin_ico.png",
					scaledSize: new google.maps.Size(42, 50)
				}
			});
		}
	</script>
    <!-- <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2vgxy-gUfx_XBxO9g6EVTZbevdkuojfQ&callback=initMap&language=${_lang }&region=KR">
    </script> -->
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBezTSgt9AXleuuIqgNLN46t0gmY2P_gi4&callback=initMap&language=${_lang }&region=KR">
    </script>    
</html>