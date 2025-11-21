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
	<body class="overview">
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
					<div class="page-visual intro01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.001" text="COMPANY OVERVIEW" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.002" text="도화가 디자인하는 세상,<br />함께 만들어 가는 미래" /></h2>
						</div>
						<!-- 20200813 비디오 태그 추가 Start-->
						<div class="sub-video">
							<video autoplay muted loop>
								<source src="/images/video/visual_overview.mp4" />
							</video>
						</div>
						<!-- 20200813 비디오 태그 추가 End-->
						<!-- 20200804 스크롤 수정 start-->
						<div class="noti-scroll">
							<span class="txt">Scroll</span>
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
								<div class="intro-wrap">
									<div class="intro-company ui-section ui-section-01">
										<div class="content-inner">
											<div class="intro-msg">
												<div class="intro-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.006" text="미래를 향해 비상하는<br />명실 상부한 글로벌 기업" /></div>
												<div class="intro-subtit ui-content"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.007" text="도화엔지니어링은<br />국내 1위 종합 엔지니어링 컨설팅 기업입니다." /></div>
												<div class="intro-desc ui-content">
													<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.008" text="도화엔지니어링은 상하수도, 수자원개발, 도시계획, 도로교통, 구조, 항만, 철도, 환경 등 엔지니어링 전 분야에서 기획 &middot; 타당성조사 &middot; 설계 &middot; 분석 &middot; 시험 &middot;감리 &middot; 시운전 &middot; 평가 &middot; 자문 및 지도 업무를 수행하는 국내 1위 종합엔지니어링 컨설팅 회사입니다." /></p>
													<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.009" text="또한 전통 순수 엔지니어링 사업인 설계 및 감리 용역의 형태에서 벗어나 공사의 설계, 기자재의 공급, 건설공사, 시운전 및 인허가 등 건설에 필요한 모든업무를 책임지는 EPC사업으로 영역을 확대하고 있으며, 국내의 성공을 기반으로 글로벌 기업으로 도약하기 위하여 해외시장 및 플랜트 사업으로 진출하는 현재의 성공에 만족하지 않고, 미래를 향해 비상하는 명실 상부한 최초에서 최고의 글로벌 기업입니다." /></p>
												</div>
											</div>
											<div class="intro-img">
												<div class="intro-img-wrap"><img src="/images/pc/img_overview01.jpg" alt="" /></div>
											</div>
										</div>
									</div>
									<div class="intro-company full ui-section ui-section-02">
										<div class="content-inner">
											<div class="intro-img"><img src="/images/pc/img_overview02.png" alt="ceo" /></div>
											<div class="intro-msg">
												<div class="intro-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.010" text="Message from our CEO" /></div>
												<div class="intro-subtit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.058" text="최초에서 최고를 넘어 글로벌 E&C의 미래를 선도합니다"/></div>
												<div class="intro-desc">
													<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.011" text="도화엔지니어링은 1957년 8월 15일 설립된 대한민국 최초의 종합엔지니어링 회사로서 사업영역 전 분야에서 우수한 인재와 기술력을 바탕으로 놀랄만한 성장을 거듭해 왔으며, 국내뿐 아니라 이란, 베트남, 인도네시아, 페루, 네팔 등 국내외 약 1만 건 이상의 건설엔지니어링 프로젝트를 성공적으로 수행하여 글로벌 기업으로 성장 기반을 다져 왔습니다. 아울러,&nbsp;항상 고객에게 신뢰받는 기업, 나아가 고객에게 감동을 주는 기업이 되기 위하여, 2,000여 명의 전 임직원이 한마음이 되어 최고의 기술과 품질을 바탕으로 고객에게 정성을 다하는 기업이 될 것을 약속드립니다." /></p>
												</div>
												<span class="sign">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.012" text="회장 박승우" />
													<!-- s: 20200812 추가-->
													<img class="signature" src="/images/pc/txt_signature.png" alt="회장 박승우 친필서명" />
													<!-- e: 20200812 추가-->
												</span>
											</div>
										</div>
									</div>
									<div class="company-status">
										<div class="content-inner">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.013" text="기업 현황" /></h3>
											<span class="comment"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.014" text="2023.12 기준" /></span>
											<ul class="status-list">
												<li class="name">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.015" text="회사명" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.016" text="(주)도화엔지니어링" /></em>
												</li>
												<li class="founded">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.017" text="설립일" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.018" text="1957.8.15" /></em>
												</li>
												<li class="location">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.019" text="본사" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.020" text="서울시 강남구 삼성로 438" /></em>
												</li>
												<li class="personnel ui-section ui-section-03">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.021" text="인력현황" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.022" text="2,646명" /></em>
												</li>
												<li class="country">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.023" text="진출국가" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.024" text="80개국" /></em>
												</li>
												<li class="ceo">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.025" text="대표이사" /></span>
													<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.026" text="박승우, 곽준상, 김덕구" /></em>
												</li>
												<li class="capital">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.027" text="매출액" /></span>
													<em class="number">
													<c:if test="${'ko' eq _lang}">
														<span class="ani" id="capital_ko"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="5,750" /></span>
													</c:if>
													<c:if test="${'en' eq _lang}">
														<span class="ani" id="capital"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="438.6" /></span>
													</c:if>
													<c:if test="${'es' eq _lang}">
														<span class="ani" id="capital"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="438.6" /></span>
													</c:if>
														<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.029" text="억" />
													</em>
												</li>
												<li class="revenue">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.030" text="당기순이익" /></span>
													<em class="number">
														<c:if test="${'ko' eq _lang}">
															<span class="ani" id="proceeds_ko">63</span>
														</c:if>
														<c:if test="${'en' eq _lang}">
															<span class="ani" id="proceeds">1.3</span>
														</c:if>
														<c:if test="${'es' eq _lang}">
															<span class="ani" id="proceeds">1.3</span>
														</c:if>
														
														<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.032" text="억원" />
													</em>
												</li>
												<li class="credit">
													<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.033" text="신용등급" /></span>
													<em class="number">
														<span class="ani creditNum">
															<span>A</span>
															<span>2</span>
															<span>+</span>
														</span>
													</em>
												</li>
											</ul>
										</div>
									</div>
									<div class="award-status">
										<div class="content-inner">
											<div class="section-cont">
												<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.035" text="수상 현황" /></h3>
												<div class="award-tab">
													<div class="tab-menu-type03">
														<ul class="tab-list">
															<li class="active"><a class="item" href="#none"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.036" text="대통령" /></a></li>
															<li><a class="item" href="#none"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.037" text="국무총리 &middot; 장관" /></a></li>
														</ul>
													</div>
													<div class="inner-tab-cont active">
														<!-- s: 20200814 마크업 수정-->
														<ul class="award-list" style="overflow:scroll; width:656px; height:361px; overflow-x:hidden;">
														<!-- 수상현황 스크롤 추가 20201208 -->
															<li class="award-item">
																<span class="date">2020.11.02</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.059" text="금탑 산업훈장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2018.10.18</span>
																<p class="desc">
																	<button class="e-slide-li on" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.038" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2016.03.25</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.039" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2010.03.03</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.043" text="표창장 – 용수공급사업에 전력하여 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2008.12.12</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.044" text="표창장 – 건설신기술 개발을 통하여 국가발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2005.07.21</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.045" text="표창장 – 도로건설기술 개발을 통하여 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">1998.06.30</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.041" text="포장 – 대구지하철 건설에 전력하여 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.042" text="포장 – 용수공급사업에 전력하여 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.046" text="표창장 – 광역상수도 사업을 통하여 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">1987.12.17</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.040" text="동탑 산업훈장 – 건설산업 발전에 기여" /></span></button>
																</p>
															</li>
														</ul>
														<div class="award-slide tab-slide01">
															<div class="swiper-container award-container">
																<div class="swiper-wrapper">
																	<!-- s: 20200814 이미지 추가-->
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide110.png" alt="2020.11.02 금탑 산업훈장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide01.jpg" alt="2018.10.18 금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide102.jpg" alt="2016.03.25 금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide106.jpg" alt="2010.03.03 표창장 – 용수공급사업에 전력하여 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide107.jpg" alt="2008.12.12 표창장 – 건설신기술 개발을 통하여 국가발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide109.jpg" alt="2005.07.21표창장 – 광역상수도 사업을 통하여 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide104.jpg" alt="1998.06.30 포장 – 대구지하철 건설에 전력하여 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide105.jpg" alt="1998.02.19 포장 – 용수공급사업에 전력하여 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide108.jpg" alt="1998.02.19 표창장 – 도로건설기술 개발을 통하여 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide103.jpg" alt="1987.12.17 동탑 산업훈장 – 건설산업 발전에 기여" /></div>
																	<!-- e: 20200814 이미지 추가-->
																</div>
																<div class="pager-area">
																	<button class="btn-prev-small" type="button">
																		<i class="ico"></i>
																		<div class="hide-txt">이전</div>
																	</button>
																	<button class="btn-next-small" type="button">
																		<i class="ico"></i>
																		<div class="hide-txt">다음</div>
																	</button>
																	<button class="btn-control" type="button">
																		<i class="ico"></i>
																		<span class="hide-txt">정지</span>
																	</button>
																	<div class="paging-range">
																		<span class="paging-bar"><span class="paging-active"></span></span>
																	</div>
																	<div class="swiper-pagination"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="inner-tab-cont">
														<ul class="award-list">
															<li class="award-item">
																<span class="date">2020.11.02</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.060" text="장관 표창장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2019.11.27</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.057" text="장관 표창장 – 타당성 조사에 전력하여 해외의 산업발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2009.03.03</span>
																<p class="desc">
																	<button class="e-slide-li" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.049" text="장관 표창장 – 성실한 납세의무 이행으로 국가재정에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">2005.06.17</span>
																<p class="desc">
																	<button class="e-slide-li on" type="button"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.047" text="국무총리 표창장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></span></button>
																</p>
															</li>
															<li class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc">
																	<button class="e-slide-li" type="button">
																		<span class="txt">
																			<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.048" text="국무총리 표창장 – 건설부문에 우수한 기술과 탁월한 방법을<br />활용함으로써 건설업발전과 기술향상에 기여" />
																		</span>
																	</button>
																</p>
															</li>
														</ul>
														<div class="award-slide tab-slide01">
															<div class="swiper-container award-container">
																<div class="swiper-wrapper">
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide206.jpg" alt="2020.11.02 장관 표창장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide203.jpg" alt="2019.11.27 장관 표창장 – 타당성 조사에 전력하여 해외의 산업발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide204.jpg" alt="2009.03.03 장관 표창장 – 성실한 납세의무 이행으로 국가재정에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide201.jpg" alt="2005.06.17 국무총리 표창장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></div>
																	<div class="swiper-slide"><img src="/images/pc/img_award_slide202.jpg" alt="1998.02.19 국무총리 표창장 – 건설부문에 우수한 기술과 탁월한 방법을" /></div>
																</div>
																<div class="pager-area">
																	<button class="btn-prev-small" type="button">
																		<i class="ico"></i>
																		<div class="hide-txt">이전</div>
																	</button>
																	<button class="btn-next-small" type="button">
																		<i class="ico"></i>
																		<div class="hide-txt">다음</div>
																	</button>
																	<button class="btn-control" type="button">
																		<i class="ico"></i>
																		<span class="hide-txt">정지</span>
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

									<c:if test="${not empty licenseList }">

									<div class="license-status">
										<div class="content-inner">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.054" text="업면허 등록 현황" /></h3>
											<div class="license-slide">
												<div class="swiper-container license-container">
													<div class="swiper-wrapper">

														<c:forEach items="${licenseList }" var="list" varStatus="vs">
															<c:set var="title" value="${_lang eq 'ko' ? list.koTitle : _lang eq 'en' ? list.enTitle : list.esTitle }" />
															<c:set var="issueAgency" value="${_lang eq 'ko' ? list.koIssueAgency : _lang eq 'en' ? list.enIssueAgency : list.esIssueAgency }" />

														
														<div class="swiper-slide">
															<div class="license-list">
																<a href="#">
																	<c:if test="${'ko' eq _lang}">
																		<span class="img-box"><img src="<c:url value="${WEB_URL }${list.pcFile.path }/${list.pcFile.newName }" />" alt="<c:out value="${title }" />" /></span>
																	</c:if>
																	<c:if test="${'en' eq _lang}">
																		<c:choose>
																			<c:when test="${not empty list.pcFileEnPath }"><span class="img-box"><img src="<c:url value="${WEB_URL }${list.pcFileEnPath }/${list.pcFileEnNewName }" />" alt="<c:out value="${title }" />" /></span></c:when>
																			<c:otherwise><span class="img-box"><img src="<c:url value="${WEB_URL }${list.pcFile.path }/${list.pcFile.newName }" />" alt="<c:out value="${title }" />" /></span></c:otherwise>
																		</c:choose>
																	</c:if>
																	<c:if test="${'es' eq _lang}">
																		<c:choose>
																			<c:when test="${not empty list.pcFileEsPath }"><span class="img-box"><img src="<c:url value="${WEB_URL }${list.pcFileEsPath }/${list.pcFileEsNewName }" />" alt="<c:out value="${title }" />" /></span></c:when>
																			<c:otherwise><span class="img-box"><img src="<c:url value="${WEB_URL }${list.pcFile.path }/${list.pcFile.newName }" />" alt="<c:out value="${title }" />" /></span></c:otherwise>
																		</c:choose>
																	</c:if>
																	<span class="license-name"><span class="line-clamp"><c:out value="${title }" /></span></span>
																	<span class="hover-txt">
																		<span class="type"><c:out value="${title }" /></span>
																		<span class="issued">
																			<span><c:out value="${issueAgency }" /></span>
																			<span>
																				<fmt:parseDate var="acquireDt" value="${list.acquireDt}" pattern="yyyy-MM-dd" />
																				<fmt:formatDate value="${acquireDt}" pattern="yyyy.MM.dd" />
																			</span>
																		</span>
																	</span>
																</a>
															</div>
														</div>

														</c:forEach>

													</div>
												</div>
												<div class="swiper-pagination"></div>
												<button class="btn-prev-mid" type="button">
													<i class="ico"></i>
													<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.055" text="이전" /></div>
												</button>
												<button class="btn-next-mid" type="button">
													<i class="ico"></i>
													<div class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.056" text="다음" /></div>
												</button>
											</div>
										</div>
									</div>

									</c:if>

								</div>
							</div>
						</div>
						<div class="btm-full-banner sp-type-02">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
						</div>
						<div class="dim-pop-wrap">
							<!-- popup 제어 클래스 : active -->
							<div class="dim-pop">
								<div class="dim-header">
									<h1 class="dim-title"><div class="line-clamp"></div></h1>
								</div>
								<div class="dim-content">
									<div class="img-box"><img src="/images/pc/img_license_03.jpg" alt="업면허 사진" /></div>
								</div>
								<button class="layer-close" type="button" >
									<i class="ico"></i>
									<span class="hide-txt"><spring:message code="FRONT.COMMON.BUTTON.CLOSE" text="닫기" /></span>
								</button>
							</div>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
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
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
		<script type="text/javascript">

		var component = new ComponentUI();
		component.tabContent(".award-tab .tab-list", ".award-tab .inner-tab-cont");

		var motionFunc = (function() {
			var sec01, sec02, sec03;
			var _scrollTop;

			var _countIndex = 0,
				_timeout;

			(function init() {
				sec01 = $(".ui-section-01");
				sec02 = $(".ui-section-02");
				sec03 = $(".ui-section-03");

				_scrollTop = $(this).scrollTop();

				$(".intro-tit, .intro-subtit, .intro-desc, .intro-img, .sign").css("opacity", 0);

				// 새로고침 후 스크롤이 하단에 위치했을때 모션 실행
				$(".ui-section").each(function(_i, _target) {
					var _currentSection = $(_target),
						_trigger = _currentSection.offset().top - $(window).height() * 0.7;

					if (_scrollTop >= _trigger) {
						switch (_i) {
							case 0:
								section01();
								break;
							case 1:
								section02();
								break;
							case 2:
								section03();
								break;
						}

						_currentSection.attr("motion", "active");
					}
				});

				// 스크롤이 움직임에 따른 모션 실행
				$(window).on("scroll", function() {
					_scrollTop = $(window).scrollTop();

					$(".ui-section").each(function(_i, _target) {
						var _currentSection = $(_target),
							_trigger = _currentSection.offset().top - $(window).height() * 0.7;

						if (_scrollTop >= _trigger) {
							switch (_i) {
								case 0:
									section01();
									break;
								case 1:
									section02();
									break;
								case 2:
									section03();
									break;
							}

							_currentSection.attr("motion", "active");
						}
					});
				});
			})();

			function section01() {
				var _tit, _subTit, _contents, _imgWrap, _img;

				_imgWrap = sec01.find(".intro-img");
				_img = sec01.find(".intro-img img");

				_tit = sec01.find(".intro-tit");
				_subTit = sec01.find(".intro-subtit");
				_contents = sec01.find(".intro-desc");

				if (sec01.attr("motion") == "active") return false;

				// txt
				TweenMax.fromTo(_tit, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut });
				TweenMax.fromTo(_subTit, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut, delay: 0.4 });
				TweenMax.fromTo(_contents, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut, delay: 0.55 });

				// img
				TweenMax.to(_imgWrap, 4, { opacity: 1, ease: Power4.easeOut });
				TweenMax.fromTo(_img, 4.5, { scale: 1.2, x: 50 }, { x: 0, ease: Power2.easeOut });
			}

			function section02() {
				var _tit, _contents, _sign, _img;

				_imgWrap = sec02.find(".intro-img");
				_img = sec02.find(".intro-img img");

				_tit = sec02.find(".intro-tit");
				_subTit = sec02.find(".intro-subtit");
				_contents = sec02.find(".intro-desc");
				_sign = sec02.find(".sign");

				if (sec02.attr("motion") == "active") return false;

				// txt
				TweenMax.fromTo(_tit, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut });
				TweenMax.fromTo(_subTit, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut, delay: 0.4 });
				TweenMax.fromTo(_contents, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut, delay: 0.55 });
				TweenMax.fromTo(_sign, 2, { y: 80 }, { y: 0, opacity: 1, ease: Power4.easeOut, delay: 0.6 });

				// img
				TweenMax.to(_imgWrap, 4, { opacity: 1, ease: Power4.easeOut });
				//- TweenMax.fromTo(_img, 4.5, {scale: 1.1}, {scale: 1, ease: Power2.easeOut});
			}

			function section03() {
				if (sec03.attr("motion") == "active") return false;

				// count
				var options = {
					useEasing: false,
					easingFn: function(t, b, c, d) {
						var ts = (t /= d) * t;
						var tc = ts * t;
						return b + c * (tc + -3 * ts + 3 * t);
					},
					useGrouping: true,
					separator: ",",
					decimal: ""
				};

				new CountUp("capital_ko", 0, 5750 /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
				new CountUp("proceeds_ko", 0, 63 /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
				new CountUp("capital", 0, 420.2 /*최종 값*/, 1 /*소수점 자리*/, 0.8 /*애니메이션 시간*/,".", options).start();
				new CountUp("proceeds", 0,1.5 /*최종 값*/, 1 /*소수점 자리*/, 0.8 /*애니메이션 시간*/,".", options).start();

				$(".ani.creditNum span").css("opacity", "0");

				_countUp($(".ani.creditNum span").eq(0), ["A", "B", "C", "D"]);

				setTimeout(function() {
					clearTimeout(_timeout);
					$(".ani.creditNum span")
						.eq(0)
						.text("A");

					$(".ani.creditNum span")
						.eq(1)
						.fadeIn();
					_countUp($(".ani.creditNum span").eq(1), ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]);

					setTimeout(function() {
						clearTimeout(_timeout);
						$(".ani.creditNum span")
							.eq(1)
							.text("2");
					}, 500);

					setTimeout(function() {
						TweenMax.to($(".ani.creditNum span").eq(2), 0.4, { opacity: 1 });
					}, 500);
				}, 500);
			}

			function _countUp(target, arr, i) {
				TweenMax.to(target, 0.4, { opacity: 1 });

				if (_countIndex >= arr.length) _countIndex = 0;

				target.text(arr[_countIndex]);

				_countIndex++;

				_timeout = setTimeout(function() {
					_countUp(target, arr);
				}, 50);
			}
		})();

		</script>
	</body>
</html>