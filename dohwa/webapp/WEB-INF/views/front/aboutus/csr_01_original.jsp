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
		<div class="intro csr" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
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
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
								</ul>
							</div>
						</div>
						<div class="contents full-type no-btm-type clfix">
							<span class="page-decs page-decs-type02">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont csr-share">
								<div class="content-inner">
									<!-- s: 20200814 추가 -->
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list-3depth">
											<li class="active"><a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.003" text="나눔경영" /></span></a></li>
											<li><a class="item" href="/aboutus/csr_02"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.004" text="안전/품질경영" /></span></a></li>
											<li><a class="item" href="/aboutus/csr_03"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.005" text="윤리준법경영" /></span></a></li>
										</ul>
									</div>
									<!-- e: 20200814 추가 -->
									<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.008" text="나눔경영" /></h3>
									<p class="title-main">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.009" text="㈜도화엔지니어링은 &lsquo;인본, 화합을 중시하는<br />나눔경영&rsquo;을 중시합니다." />
									</p>
									<p class="cont-desc">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.010" text="매 해 임직원들의 자발적 참여로 운영되는 &lsquo;봉사동호회&rsquo;를 토대로 국내 뿐만 아니라 인도네시아, 탄자니아, 페루, 캄보디아 등 다양한 국가에 나눔경영을 실천하고 있습니다.<br />앞으로도 ㈜도화엔지니어링은 인본을 중시하는 지속가능 체계 속에서 진정성 있는 나눔 활동의 확대를 위해 더욱 노력하겠습니다." />
									</p>
								</div>
								<div class="sub-visual">
									<div id="bg" aria-hidden="true"></div>
									<em class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.011" text="Sharing Management" /></em>
								</div>
								<div class="content-inner">
									<div class="csr-cont">
										<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.012" text="사회공헌" /></h4>
										<div class="desc-area">
											<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.013" text="기업의 경제적 이윤 추구에 머무르지 않고, 신뢰받는 사회구성원으로서 함께 하는 지역사회와 소통하고 협력하며 행복을 추구합니다." /></p>
											<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.014" text="임직원의 자발적인 참여로 조성된 기금 지원, 취약계층을 후원하고 환경과 문화를 보존하는 봉사 활동 등은 상생의 가치를 이어가고자 하는 도화의 의지입니다." /></p>
										</div>
									</div>
									<div class="csr-cont">
										<div class="csr-txtbox fl">
											<h5 class="title-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.015" text="봉사활동" /></h5>
											<div class="csr-imgbox"><img src="/images/pc/img_csr_share01.jpg" alt="" /></div>
											<div class="desc-area">
												<p>
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.016" text="2015년 임직원 60명이 뜻을 모아 설립한 &lsquo;도화 봉사동호회&rsquo;가 주축이 되어, 매년 초 운영 계획을 수립하고 사회 전반에 걸쳐 관심이 필요한 이들을 대상으로 다방면의 활동을 펼치고 있습니다. 매월 정기총회를 통해 독거노인 &middot; 탈북민 등 소외계층을 위한 김장 담그기, 환경 보존을 위한 자연정화 활동, 역사문화탐방, 컴퓨터 및 전산장비 기부, 태극기달기 등 직접 찾아가는 희망 봉사 활동을 정기적으로 실천해 왔습니다. 앞으로도 도화는 지역사회의 상생과 행복한 미래에 보탬이 되는 진정성 있는 나눔으로 기여하겠습니다." />
												</p>
											</div>
										</div>
										<div class="csr-txtbox fl">
											<h5 class="title-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.017" text="희망나눔기금" /></h5>
											<div class="csr-imgbox"><img src="/images/pc/img_csr_share02.jpg" alt="" /></div>
											<div class="desc-area">
												<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.018" text="임직원의 자발적인 참여로 이루어진 &lsquo;도화희망나눔기금&rsquo;은 매월 급여 중 기부한 일정 금액으로 조성되며, 이 기금으로 국내 &middot; 외에서 다양한 사회공헌 활동을 전개하고 있습니다. 현재 임직원의 약 62%인 1,200명 이상이 도화희망나눔기금에 동참하고 있으며, 임직원이 기부한 금액만큼 회사도 동일 금액을 후원, 그 나눔이 두 배가 되는 일명 ‘매칭 그랜트 방식’으로 운영되고 있습니다." /></p>
											</div>
										</div>
									</div>
									<div class="fund-box" id="fund-box"></div>
									<div class="section-cont social-activty">
										<div class="social-activty-list fl">
											<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.025" text="사회공헌 주요활동" /></h4>
											<div class="list-type-dot">
												<ul>
													<li><button class="e-slide-li on" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.026" text="도화희망나눔, 베트남 백혈병 환자 기부" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.027" text="네팔 대사관 통해 지진피해 입은 네팔에 따듯한 손길…성금 전달" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.028" text="도화봉사동호회, 국제 로타리 클럽과 양천 장애인 복지관에 한 겨울 김장 봉사" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.029" text="인도네시아 지진 피해 지원" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.030" text="탄자니아 고아원 물품지원 옷 모으기 행사 진행, 임직원 모두 참여" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.031" text="전국재해구호협회, 희망브리지에 강원도 산불 피해 이웃돕기 성급 지급" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.032" text="필리핀 화산폭팔 이재민을 위한 미화 25천불 상당 구호 성금 전달" /></span></button></li>
													<li><button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.033" text="페루 코로나19 사태 지원을 위한 국가지원금 전달" /></span></button></li>
												</ul>
												<!-- e: 20200812 마크업 수정-->
											</div>
										</div>
										<div class="award-status fr">
											<div class="award-slide">
												<div class="swiper-container award-container">
													<div class="swiper-wrapper">
														<!-- s: 20200814 이미지 추가 -->
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide01.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.034' text='도화희망나눔, 베트남 백혈병 환자 기부'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide02.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.035' text='네팔 대사관 통해 지진피해 입은 네팔에 따듯한 손길…성금 전달'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide03.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.036' text='도화봉사동호회, 국제 로타리 클럽과 양천 장애인 복지관에 한 겨울 김장 봉사'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide04.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.037' text='인도네시아 지진 피해 지원'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide05.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.038' text='탄자니아 고아원 물품지원 옷 모으기 행사 진행, 임직원 모두 참여'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide06.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.039' text='전국재해구호협회, 희망브리지에 강원도 산불 피해 이웃돕기 성급 지급'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide07.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.040' text='필리핀 화산폭팔 이재민을 위한 미화 25천불 상당 구호 성금 전달'/>" /></div>
														<div class="swiper-slide"><img src="/images/pc/img_csr_share_slide08.jpg" alt="<spring:message code='FRONT.COMMON.MENU.ABOUTUS.005.001.041' text='페루 코로나19 사태 지원을 위한 국가지원금 전달'/>" /></div>
														<!-- e: 20200814 이미지 추가 -->
													</div>
													<div class="pager-area">
														<button class="btn-prev-small" type="button">
															<i class="ico"></i>
															<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.042" text="이전" /></div>
														</button>
														<button class="btn-next-small" type="button">
															<i class="ico"></i>
															<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.043" text="다음" /></div>
														</button>
														<button class="btn-control" type="button">
															<i class="ico"></i>
															<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.044" text="정지" /></span>
														</button>
														<div class="paging-range">
															<span class="paging-bar"><span class="paging-active"></span></span>
														</div>
														<div class="swiper-pagination"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
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
	var component = new ComponentUI();
	</script>
</html>