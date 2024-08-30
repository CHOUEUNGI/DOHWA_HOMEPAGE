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
		<div class="intro intro-overview" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.001" text="COMPANY OVERVIEW" /></span>
							<h2 class="title-main">
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.002" text="도화가 디자인하는 세상,
								<br />
								함께 만들어 가는 미래"/>
							</h2>
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
						<div class="section-cont">
							<div class="intro-company ui-section ui-section-01">
								<div class="intro-msg">
									<h3 class="intro-tit">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.006" text="미래를 향해 비상하는
										<br />
										명실 상부한 글로벌 기업"/>
									</h3>
									<div class="intro-img"><img src="/images/mobile/img_overview01.jpg" alt="" /></div>
									<div class="intro-subtit ui-content">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.007.MOB" text="도화엔지니어링은 국내 1위
										<br />
										종합 엔지니어링 컨설팅 기업입니다."/>
									</div>
									<div class="intro-desc ui-content">
										<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.008.MOB" text="도화엔지니어링은 상하수도, 수자원개발, 도시계획, 도로교통, 구조, 항만, 철도, 환경 등 엔지니어링 전 분야에서 기획 &middot; 타당성조사 &middot; 설계 &middot; 분석 &middot; 시험 &middot;감리 &middot; 시운전 &middot; 평가 &middot; 자문 및 지도 업무를 수행하는 국내 1위 종합엔지니어링 컨설팅 회사입니다." /></p>
										<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.009.MOB" text="또한 전통 순수 엔지니어링 사업인 설계 및 감리 용역의 형태에서 벗어나 공사의 설계, 기자재의 공급, 건설공사, 시운전 및 인허가 등 건설에 필요한 모든업무를 책임지는 EPC사업으로 영역을 확대하고 있으며, 국내의 성공을 기반으로 글로벌 기업으로 도약하기 위하여 해외시장 및 플랜트 사업으로 진출하는 현재의 성공에 만족하지 않고, 미래를 향해 비상하는 명실 상부한 최초에서 최고의 글로벌 기업입니다." /></p>
									</div>
								</div>
								<div class="ceo-msg">
									<h3 class="ceo-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.010" text="Message from our CEO" /></h3>
									<div class="intro-img"><img src="/images/mobile/img_overview02.jpg" alt="ceo" /></div>
									<!--s : 20200821 추가-->
									<div class="intro-subtit ui-content"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.058" text="최초에서 최고를 넘어 글로벌 E&C의 미래를 선도합니다"/></div>
									<!--e : 20200821 추가-->
									<div class="intro-desc">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.011.MOB" text="<p>도화는 1957년 설립된 대한민국 최초의 종합엔지니어링 회사로 끊임없는 도전과 혁신을 거듭하며 성장한 대한민국 최고의 엔지니어링 회사입니다. </p>
										<p>축적된 전문성과 경험으로 국내를 포함하여 페루, 이란, 베트남 등 국외 76개국에서 1만 건이 넘는 프로젝트를 성공적으로 수행하였고, EPC, PMC, O&A 등 건설 사업 전반으로 사업 영역을 확대하여 국내 뿐만 아니라 해외 시장에서도 최고의 기업이 되기 위해 노력하고 있습니다. 2,300여명의 임직원을 대표하여 우리 도화는 미래를 선도하고 사회적 책임을 다하며, 고객가치 창출을 위해 최고의 기술력과 품질로 안전한 환경을 선사할 것을 약속 드립니다.</p>"/>
									</div>
									<span class="sign">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.012" text="회장 박승우" />
										<img class="signature" src="/images/mobile/txt_signature.png" alt="회장 박승우 친필서명" />
									</span>
								</div>
							</div>
							<div class="company-status">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.013" text="기업 현황" /></h3>
								<span class="comment"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.014" text="2023.12. 기준" /></span>
								<ul class="status-list-typ1">
									<li class="name">
										<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.015" text="회사명" /></span>
										<em class="txt">
											<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.016.MOB" text="(주)도화
											<br />
											엔지니어링"/>
										</em>
									</li>
									<li class="founded">
										<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.017" text="설립일" /></span>
										<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.018" text="1957.8.15" /></em>
									</li>
									<li class="location">
										<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.019" text="본사" /></span>
										<em class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.020" text="서울시 강남구 삼성로 438" /></em>
									</li>
									<li class="personnel">
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
								</ul>
								<ul class="status-list-typ2 ui-section ui-section-03">
									<li class="capital">
										<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.027" text="매출액" /></span>
										<em class="number">
											<c:if test="${'ko' eq _lang}">
												<span class="ani" id="capital_ko"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="5750" /></span>
											</c:if>
											<c:if test="${'en' eq _lang}">
												<span class="ani" id="capital"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="438.6" /></span>
											</c:if>
											<c:if test="${'es' eq _lang}">
												<span class="ani" id="capital"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.028" text="438.6" /></span>
											</c:if>
											<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.029" text="억" /></span>
										</em>
									</li>
									<li class="revenue">
										<span class="lb"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.030" text="당기순이익" /></span>
										<em class="number">
											<c:if test="${'ko' eq _lang}">
												<span class="ani" id="proceeds_ko">207</span>
											</c:if>
											<c:if test="${'en' eq _lang}">
												<span class="ani" id="proceeds">1.3</span>
											</c:if>
											<c:if test="${'es' eq _lang}">
												<span class="ani" id="proceeds">1.3</span>
											</c:if>
											<span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.032" text="억원" /></span>
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
							<div class="award-status">
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
											<!-- 탭 활성화 클래스 active -->
											<div class="award-slide tab-slide01">
												<div class="swiper-container award-container">
													<div class="swiper-wrapper">
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide110.png" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.059" text="금탑 산업훈장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" />" />
															<div class="award-item">
																<span class="date">2020.11.02</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.059" text="금탑 산업훈장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide01.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.038" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" />" />
															<div class="award-item">
																<span class="date">2018.10.18</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.038" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide102.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.039" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" />" />
															<div class="award-item">
																<span class="date">2016.03.25</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.039" text="금탑 산업훈장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide106.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.043" text="포장 – 용수공급사업에 전력하여 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">2010.03.03</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.043" text="포장 – 용수공급사업에 전력하여 산업발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide107.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.044" text="표창장 – 건설신기술 개발을 통하여 국가발전에 기여" />" />
															<div class="award-item">
																<span class="date">2008.12.12</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.044" text="표창장 – 건설신기술 개발을 통하여 국가발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide109.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.046" text="표창장 – 광역상수도 사업을 통하여 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">2005.07.21</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.045" text="표창장 – 도로건설기술 개발을 통하여 산업발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide104.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.041" text="포장 – 대구지하철 건설에 전력하여 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">1998.06.30</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.041" text="포장 – 대구지하철 건설에 전력하여 산업발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide105.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.042" text="포장 – 용수공급사업에 전력하여 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.042" text="포장 – 용수공급사업에 전력하여 산업발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide108.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.045" text="표창장 – 도로건설기술 개발을 통하여 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.046" text="표창장 – 광역상수도 사업을 통하여 산업발전에 기여" /></p>																
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide103.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.040" text="동탑 산업훈장 – 건설산업 발전에 기여" />" />
															<div class="award-item">
																<span class="date">1987.12.17</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.040" text="동탑 산업훈장 – 건설산업 발전에 기여" /></p>
															</div>
														</div>
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
														<div class="paging-box">
															<span class="cur">01</span>
															/
															<span class="total">08</span>
														</div>
														<div class="paging-range">
															<span class="paging-bar"><span class="paging-active"></span></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="inner-tab-cont">
											<div class="award-slide tab-slide02">
												<div class="swiper-container award-container">
													<div class="swiper-wrapper">
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide206.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.060" text="장관 표창장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" />" />
															<div class="award-item">
																<span class="date">2020.11.02</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.060" text="장관 표창장 – 해외건설플랜트산업 진흥을 통하여 국토교통업무에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide203.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.057" text="장관 표창장 – 타당성 조사에 전력하여 해외의 산업발전에 기여" />" />
															<div class="award-item">
																<span class="date">2019.11.27</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.057" text="장관 표창장 – 타당성 조사에 전력하여 해외의 산업발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide204.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.049" text="장관 표창장 – 성실한 납세의무 이행으로 국가재정에 기여" />" />
															<div class="award-item">
																<span class="date">2009.03.03</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.049" text="장관 표창장 – 성실한 납세의무 이행으로 국가재정에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide201.jpg" alt="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.047" text="국무총리 표창장 – 건설기술진흥을 통하여 국가산업 발전에 기여" />" />
															<div class="award-item">
																<span class="date">2005.06.17</span>
																<p class="desc"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.047" text="국무총리 표창장 – 건설기술진흥을 통하여 국가산업 발전에 기여" /></p>
															</div>
														</div>
														<div class="swiper-slide">
															<img src="/images/pc/img_award_slide202.jpg" alt="1998.02.19 국무총리 표창장 – 건설부문에 우수한 기술과 탁월한 방법을" />
															<div class="award-item">
																<span class="date">1998.02.19</span>
																<p class="desc">
																	<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.048" text="국무총리 표창장 – 건설부문에 우수한 기술과 탁월한 방법을
																	<br />
																	활용함으로써 건설업발전과 기술향상에 기여"/>
																</p>
															</div>
														</div>
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
														<div class="paging-box">
															<span class="cur">01</span>
															/
															<span class="total">08</span>
														</div>
														<div class="paging-range">
															<span class="paging-bar"><span class="paging-active"></span></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="license-status">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.054" text="업면허 등록 현황" /></h3>
								<div class="license-slide">
									<div class="swiper-container license-container">
										<div class="swiper-wrapper">
										
										<c:forEach items="${licenseList }" var="list" varStatus="status">
											<c:set var="title" value="${_lang eq 'ko' ? list.koTitle : _lang eq 'en' ? list.enTitle : list.esTitle }" />
											<c:set var="issueAgency" value="${_lang eq 'ko' ? list.koIssueAgency : _lang eq 'en' ? list.enIssueAgency : list.esIssueAgency }" />
											
											<c:if test="${'ko' eq _lang}">
												<c:set var="filePath" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.path : list.moFile.path }" />
												<c:set var="fileName" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.newName : list.moFile.newName }" />
											</c:if>
											<c:if test="${'en' eq _lang}">
												<c:choose>
													<c:when test="${not empty list.moFileEnPath }">
														<c:set var="filePath" value="${list.moFileEnPath }" />
														<c:set var="fileName" value="${list.moFileEnNewName }" />
													</c:when>	
													<c:otherwise>
														<c:set var="filePath" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.path : list.moFile.path }" />
														<c:set var="fileName" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.newName : list.moFile.newName }" />
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${'es' eq _lang}">
												<c:choose>
													<c:when test="${not empty list.moFileEsPath }">
														<c:set var="filePath" value="${list.moFileEsPath }" />
														<c:set var="fileName" value="${list.moFileEsNewName }" />
													</c:when>	
													<c:otherwise>
														<c:set var="filePath" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.path : list.moFile.path }" />
														<c:set var="fileName" value="${empty list.moFile || empty list.moFile.newName ? list.pcFile.newName : list.moFile.newName }" />
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${0 eq status.index || 0 == status.index % 6}">
												<c:if test="${0 ne status.index && 0 == status.index % 6}">
												</div>
												</c:if>
											<div class="swiper-slide">
											</c:if>
											
												<div class="license-list">
													<a href="#">
														<span class="img-box"><img src="<c:url value="${WEB_URL }${filePath }/${fileName }" />" alt="<c:out value="${title }" />" /></span>
														<span class="license-name"><span class="line-clamp"><c:out value="${title }" /></span></span>
													</a>
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
						<div class="dim-pop-wrap">
							<!-- popup 제어 클래스 : active -->
							<div class="dim-pop">
								<div class="dim-header">
									<h1 class="dim-title"><div class="line-clamp"></div></h1>
								</div>
								<div class="dim-content">
									<div class="img-box"><img src="/images/pc/img_license_03.jpg" alt="업면허 사진" /></div>
								</div>
								<button class="layer-close" type="button">
									<i class="ico"></i>
									<span class="hide-txt">닫기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="btm-full-banner sp-type-02">
					<%@ include file="/WEB-INF/views/mobile/layout/intro_link.jsp" %>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script type="text/javascript">
		
		component.tabContent(".award-tab .tab-list", ".award-tab .inner-tab-cont");

		</script>
	</body>
</html>