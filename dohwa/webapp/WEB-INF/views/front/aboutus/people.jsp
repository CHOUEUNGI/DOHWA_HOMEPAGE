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
		<div class="intro" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro03 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003.001.001" text="PEOPLE" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003.001.002" text="국내 NO.1 도화엔지니어링을 이끌어 가는<br />2020년 우수 임직원을 소개합니다." /></h2>
						</div>
						<!-- 20200813 비디오 태그 추가 Start-->
						<div class="sub-video">
							<video autoplay muted loop>
								<source src="/images/video/visual_people.mp4" />
							</video>
						</div>
						<!-- 20200813 비디오 태그 추가 End-->
						<!-- 20200804 스크롤 수정 start-->
						<div class="noti-scroll">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003.001.003" text="Scroll" /></span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<!-- 20200804 스크롤 수정 end-->
						<!-- 20200803 그리드 추가 start-->
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
						<!-- 20200803 그리드 추가 end-->
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
							</div>
						</div>
						<div class="contents no-btm-type full-type clfix">
							<span class="page-decs page-decs-type02">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont">
								<div class="best-executives">
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.003.001.006" text="2020 도화 우수 임직원" /></h3>
									<ul class="executives-list">

										<c:forEach items="${peopleList }" var="list">

										<li>
											<div class="img-box"><img src="<c:url value="${WEB_URL }${list.fileVO.path }/${list.fileVO.newName }" />" alt="<c:out value="${list.peopleMlVO.name }" />" /></div>
											<div class="executives-info">
												<span class="department">
													<span><c:out value="${list.peopleMlVO.partname }" /></span>
													<span class="position"><c:out value="${list.peopleMlVO.staffLevel }" /></span>
												</span>
												<em class="name"><c:out value="${list.peopleMlVO.name }" /></em>
											</div>
											<div class="hover-box">
												<strong>INTERVIEW</strong>
												<p class="hover-txt"><c:out value="${list.peopleMlVO.interview }" /></p>
											</div>
										</li>

										</c:forEach>

									</ul>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
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

	$(function() {

	});

	</script>
</html>