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
		<div class="intro csr" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
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
						<div class="tab-menu-type01 center swiper-container">
							<%@ include file="/WEB-INF/views/mobile/layout/overview_tab_list.jsp" %>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont csr-ethics">
							<div class="tab-menu-type02">
								<ul class="tab-list">
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/csr_01" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.003" text="나눔경영" /></span></a>
									</li>
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/csr_02"/>"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.004" text="안전/품질경영" /></span></a>
									</li>
									<li class="active">
										<a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.005" text="윤리준법경영" /></span></a>
									</li>
								</ul>
							</div>
							<div class="inner-tab-cont active">
								<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.008" text="윤리준법경영" /></h3>
								<p class="title-main">
									<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.009.MOB" text="투명한 기업 운영을 통해 지속
									<br />
									가능한 회사를 만들고 있습니다."/>
								</p>
								<p class="cont-desc">
									<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.010" text="도화엔지니어링은 변화하는 사회에 발 맞추어 윤리 준법을
									<br />
									기업문화로 정착시키기 위해 전 임직원과 함께 노력하고 있습니다."/>
								</p>
								<div class="sub-visual"><img src="/images/mobile/img_intro_csr03.jpg" alt="Ethical Compliance" /></div>
								<div class="csr-cont">
									<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.012" text="윤리위원회 운영" /></h4>
									<div class="csr-imgbox"><img src="/images/mobile/img_csr_ethics01.jpg" alt="" /></div>
									<p class="subtit">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.013.MOB" text="도화엔지니어링은 윤리준법 내재화 및
										<br />
										전사 컴플라이언스 체계 수립을 위해
										<br />
										윤리위원회를 조직 및 운영하고 있습니다."/>
									</p>
									<div class="desc-area">
										<ul class="desc-list">
											<li><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.014" text="임직원 교육 및 사내 홍보 등의 예방 활동과 윤리준법지침 수 점검과 같은 모니터링, 위반사항 시정조치 등의 개선 업무를 담당합니다."/></li>
											<li><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.015" text="컴플라이언스 체계를 고도화하여 국내외 반부패 및 윤리 이슈에 선제적으로 대응합니다."/></li>
											<li><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.016" text="그 외 윤리경영 제보라인을 별도 운영하여 직원들의 윤리준법 실천을 위해 노력하고 있습니다."/></li>
											<li><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.017" text="제보라인을 통해 외부 이해관계자는 부정 비리와 불공정 거래 행위를 고발할 수 있습니다."/></li>
											<li><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.018" text="또한 회사의 경영활동과 제도의 개선을 위한 내·외부 이해관계자의 건의사항을 수렴하는 창구로 기능하고 있습니다."/></li>
										</ul>
									</div>
									<div class="bttn-area">
										<a class="bttn type01 style01" href="<c:url value="${mobileStartPath }speak"/>" role="button">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.019" text="윤리경영 제보라인" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</div>
								</div>
								<div class="csr-cont">
									<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.020" text="윤리교육" /></h4>
									<div class="csr-imgbox"><img src="/images/mobile/img_csr_ethics02.jpg" alt="" /></div>
									<p class="subtit">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.021.MOB" text="도화엔지니어링은 임직원의 윤리준법
										<br />
										의식의 내재화를 위해 온라인 및 오프라인
										<br />
										맞춤형 교육을 실시하고 있습니다."/>
									</p>
									<div class="desc-area">
										<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.022" text="선택 집중적 윤리교육을 통해 기업 내 윤리 준법 문화를 조성하고 임직원의 윤리적인 행동 실천을 유도하고 있습니다."/></p>
									</div>
								</div>
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
		<script type="text/javascript">
		
		</script>
	</body>
</html>