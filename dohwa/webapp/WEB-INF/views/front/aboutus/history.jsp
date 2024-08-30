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
		<div class="intro intro-history" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="">
					<div class="page-visual intro04 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.001" text="HISTORY" /></span>
							<h2 class="title-main">
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.002" text="끊임없는 성장과 혁신을 거듭해온<br />도화엔지니어링의 역사를 확인해보세요." />
							</h2>
						</div>
						<!-- 20200813 비디오 태그 추가 Start-->
						<div class="sub-video">
							<video autoplay muted loop>
								<source src="/images/video/visual_history.mp4" />
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
					<div class="content-wrap">
						<div class="contents no-btm-type full-type">
							<div class="history-container">
								<div class="history-select">
									<!-- 1957 - 1970 -->
									<div class="history-select-item select-item01 active">
										<!-- 활성화시 .active 추가 -->
										<div class="inner-item">
											<a class="history-back-btn" href="javascript:void(0);">BACK</a>
											<a class="history-anchor" href="javascript:void(0);">
												<div class="desc">
													<em class="title-main">1957 - 1970</em>
													<p class="txt">
														<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.003" text="국내 토목건설 엔지니어링 산업의<br />기틀을 다진 도화의 시작" />
													</p>
													<i class="ico-arrow-right" aria-hidden="true"></i>
												</div>
											</a>
										</div>
									</div>
									<!-- 1980 - 1990 -->
									<div class="history-select-item select-item02">
										<div class="inner-item">
											<a class="history-back-btn" href="javascript:void(0);">BACK</a>
											<a class="history-anchor" href="javascript:void(0);">
												<div class="desc">
													<em class="title-main">1980 - 1990</em>
													<p class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.004" text="종합 엔지니어링 회사로 도약하는 중흥기의 도화" /></p>
													<i class="ico-arrow-right" aria-hidden="true"></i>
												</div>
											</a>
										</div>
									</div>
									<!-- 2000’ s -->
									<div class="history-select-item select-item03">
										<div class="inner-item">
											<a class="history-back-btn" href="javascript:void(0);">BACK</a>
											<a class="history-anchor" href="javascript:void(0);">
												<div class="desc">
													<em class="title-main">2000’ s</em>
													<p class="txt"><p class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.005" text="21세기 새로운 미래를 향한 발걸음" /></p></p>
													<i class="ico-arrow-right" aria-hidden="true"></i>
												</div>
											</a>
										</div>
									</div>
								</div>
								<div class="progress-wrap">
									<div class="progress-inner">
										<a class="progress-anchor active" href="javascript:void(0);">
											<!-- 활성화시 .active 추가 -->
											<div class="inner-txt">
												<em class="progress-tit">1957 - 1970</em>
												<p class="progress-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.006" text="국내 토목건설 엔지니어링 산업의 기틀을 다진 도화의 시작" /></p>
											</div>
											<span class="progress-line" aria-hidden="true"><span class="bar" style="width:10%;"></span></span>
										</a>
										<a class="progress-anchor" href="javascript:void(0);">
											<div class="inner-txt">
												<em class="progress-tit">1980 - 1990</em>
												<p class="progress-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.007" text="종합 엔지니어링 회사로 도약하는 중흥기의 도화" /></p>
											</div>
											<span class="progress-line" aria-hidden="true"><span class="bar" style="width:0;"></span></span>
										</a>
										<a class="progress-anchor" href="javascript:void(0);">
											<div class="inner-txt">
												<em class="progress-tit">2000’ s</em>
												<p class="progress-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.008" text="21세기 새로운 미래를 향한 발걸음" /></p>
											</div>
											<span class="progress-line" aria-hidden="true"><span class="bar" style="width:0;"></span></span>
										</a>
									</div>
								</div>
								<div class="history-detail detail01">
									<div class="detail-container">
										<!-- 1957 - 1970 Detail -->
										<div class="history-detail-item detail-item01 active">
											<!-- 활성화시 .active 추가 -->
											<div class="inner-item">
												<a class="history-back-btn2" href="javascript:void(0);">BACK</a>
												<div class="desc">
													<em class="tit">1957 - 1970</em>
													<p class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.009" text="국내 토목건설 엔지니어링 산업의 기틀을 다진 도화의 시작" /></p>
												</div>
											</div>
											<div class="detail-list">
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_001.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1957.8</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.010" text="도화설계사무소 설립" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_002.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1962</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.011" text="협화정진 / &quot;창립 5주년 기념 휘호&quot; / 설립 초기의 경영기반 확립" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_003.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1962-1963</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.012" text="울산 사연댐 기본설계 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_004.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1967</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.013" text="안동 다목적댐 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_005.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1967.2</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.014" text="외자도입사업 기술용역업자 등록" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_006.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1968</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.015" text="제1단계 부산항 정비 기본계획조사 실시" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_007.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1969</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.016" text="대한석유공사 저유시설 설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_008.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1969.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.017" text="서울 - 대전 고속도로 개통식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_009.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1971</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.018" text="금호강 하류 개수계획 조사설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_010.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1971</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.019" text="인천항 도크 설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_011.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1973-1976</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.020" text="포항신항건설 기본계획 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_012.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1974</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.021" text="온산항 방파제 축조공사 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_013.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1974</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.022" text="현대조선 미포항 조사계획 및 기본설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_014.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1975</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.023" text="이란 코람샤 항만설계 및 감리용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1957_015.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1975</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.024" text="코람샤 항만 공사 시험항타참관" /></p>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="history-detail detail02">
									<div class="detail-container">
										<!-- 1980 - 1990 Detail -->
										<div class="history-detail-item detail-item02">
											<div class="inner-item">
												<a class="history-back-btn2" href="javascript:void(0);">BACK</a>
												<div class="desc">
													<em class="tit">1980 - 1990</em>
													<p class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.025" text="종합 엔지니어링 회사로 도약하는 중흥기의 도화" /></p>
												</div>
											</div>
											<div class="detail-list">
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_001.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1980-1982</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.026" text="울산시 상수도시설확충을 위한 협의" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_002.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1982</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.027" text="광양 및 아산만 항만개발" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_003.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1982</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.028" text="회야댐 계통 상수도 확장사업 시공감리 용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_004.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1982-1986</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.029" text="한강종합개발사업" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_005.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1983</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.030" text="충주 상수도 기본계획 수립" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_006.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1983.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.031" text="최초 도화사옥기공식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_007.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1984</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.032" text="강남구 신사동 사옥장만" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_008.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1984</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.033" text="인도네시아 IKK 상수도 사업" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_009.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1985.8</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.034" text="건설교통부 표창장 수상" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_010.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1986</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.035" text="태백권 광역상수도사업 기공식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_011.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1987.2</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.036" text="평화의 댐 건설 기공식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_012.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1987.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.037" text="대통령 동탑산업훈장 (건설사업을 통하여 산업발전에 기여)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_013.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1987-1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.038" text="군산시 하수처리장 기본설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_014.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1987-1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.039" text="남강댐 보완 타당성 검토 및 기본설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_015.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1987-1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.040" text="횡성댐 타당성조사용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_016.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.041" text="비금도 도초도간 연도교 가설공사 실시설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_017.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.042" text="서울시 중랑하수처리장 증설 실시설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_018.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1988</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.043" text="업계최초 신입사원 공개채용 및 전사원 연수대회" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_019.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1989-1993</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.044" text="송도지역 공유수면 매립사업 설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_020.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1990.5</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.045" text="감리전문회사등록 (건설부)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_021.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1990-1991</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.046" text="동해항개발 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_022.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1990-1991</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.047" text="서울시 중랑구 중화묵동 침수지역 해소공사 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_023.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1991</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.048" text="김해림 회장 타계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_024.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1991.4</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.049" text="창원신도시 개발계획 수립" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_025.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1991.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.050" text="청주공단 폐수종말처리장 준공식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_026.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1991-1992</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.051" text="부산시 기존 공업용수도사업 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_027.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1991-1992</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.052" text="안산시 하수처리장 2차 처리시설 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_028.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1992.5</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.053" text="기업부설연구소 인정" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_029.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1992.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.054" text="통일대교 장단길 도로 개설공사" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_030.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1993.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.055" text="엔지니어링사업자 신고증" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_031.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1993-1994</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.056" text="발안 반월간 도로확장 및 포장공사 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_032.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1994</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.057" text="도화 감리 부문 종합감리회사 등록" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_033.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1994.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.058" text="서울1000년 타임캡슐 광장조성 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_034.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1994-1995</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.059" text="대청댐광역상수도 2단계사업 타당성조사 및 기본계획" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_035.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1994-1995</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.060" text="울산시 회야정수장 고도정수처리시설 기본계획 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_036.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1994-1997</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.061" text="부산시 제2부산대교(남항대교) 건설공사 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_037.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1995-2000.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.062" text="인천국제공항 배후지원단지 기반시설 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_038.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1996</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.063" text="1990년 9월 발족한 조경부가 조성한 뿌리공원" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_039.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1996.8</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.064" text="대한주택협회 가입" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_040.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1996.11</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.065" text="유공 제8부두 150,000DWT급 유류부두 준공검사" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_041.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.066" text="삼척항 수역시설 유지준설공사 설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_042.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997.3</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.067" text="한국수자원공사 건설기술용역과업 성실수행 및 1996년도<br />건설기술용역평가결과 우수용역업체선정" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_043.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997.4</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.068" text="SGS, ICS ISO9001 인증서 획득 (내부품질감사실시)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_044.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997.4</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.069" text="소프트웨어사업자 신고확인서" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_045.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997.8</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.070" text="Cowl사 현지미팅" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_046.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1997-1999</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.071" text="대구광역시 4차순환도로(성서공단-지천간) 건설 기본 및<br />실시설계 수행" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_047.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1998.2</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.072" text="대통령 표창장(광역상수도 사업을 통하여 국가산업발전에 기여)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_048.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1998.2</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.073" text="대통령 표창장(용수공급사업에 전력, 국가산업발전에 기여)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_049.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1999</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.074" text="턴키설계한 군&middot;장신항만 남측안벽 완공" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_050.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1999.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.075" text="공주-서천간 고속도로 노선 설명회" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_051.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1999.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.076" text="한국수자원환경신문사 20C 환경인물 50인상" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_052.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1999-2005</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.077" text="경부고속철도 12공구 노반 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_1980_053.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">1999-2005</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.078" text="경부고속철도 12공구 노반 실시설계" /></p>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="history-detail detail03">
									<div class="detail-container">
										<!-- 2000’ s Detail -->
										<div class="history-detail-item detail-item03">
											<div class="inner-item">
												<a class="history-back-btn2" href="javascript:void(0);">BACK</a>
												<div class="desc">
													<em class="tit">2000’ s</em>
													<p class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.079" text="21세기 새로운 미래를 향한 발걸음" /></p>
												</div>
											</div>
											<div class="detail-list">
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_001.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.080" text="수지 광주간 도로 확&middot;포장공사" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_002.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000.11</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.081" text="한국토지공사 용인죽전택지개발사업지구 특별설계단지<br />기본계획안 건설기술공모 입상" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_003.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000-2001</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.082" text="갯골유수지 및 빗물펌프장 설치공사 기본설계 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_004.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000-2001</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.083" text="부산 명장정수장 정수시설 개량공사 실시설계 TK용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_005.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000-2001</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.084" text="장승포(옥포)지구 하수종말처리시설 설치사업 실시설계용역" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_006.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2000-2001</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.085" text="태화강 생태공원 조성사업 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_007.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2001.12-2003.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.086" text="송도신도시 2,4공구 공원&middot;녹지 조경 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_008.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2001-2002</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.087" text="강릉과학지방산업단지 조성사업 조사설계용역 조감도" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_009.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2002</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.088" text="대청댐계통 천안정수장" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_010.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2002</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.089" text="부산시 서구 송도일원 침식방지 공사" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_011.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2002-2004</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.090" text="안산하수종말처리장 고도처리시설 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_012.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2002-2007</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.091" text="용인흥덕지구 택지개발사업 조사설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_013.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2003</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.092" text="ISO-품질인증서9001(국문)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_014.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2003.6-2004.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.093" text="잠실수중보 어도개선 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_015.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2003.9</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.094" text="평화의 댐 2단계사업 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_016.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2003-2005</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.095" text="암사대교 및 연결도로 건설공사 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_017.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2004</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.096" text="길동도시자연공원 기본계획" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_018.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2004</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.097" text="한국수자원공사 우수건설기술용역패" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_019.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2004.6</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.098" text="ISO-환경인증서14001(국문)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_020.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2004.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.099" text="울산 용연하수처리장 고도처리시설 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_021.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.100" text="고성 백악기 공룡테마파크 조성 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_022.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005.4</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.101" text="대구광역시 위생매립장 확장 및 폐기물종합처리시설단지조성<br />실시설계" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_023.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005.6</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.102" text="국무총리표창장 (건설산업진흥 국가산업발전 기여)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_024.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005.6</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.103" text="중도관광공원(World-Class-Garden) 타당성조사" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_025.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005.7</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.104" text="대통령표창장 (도로건설기술개발을 통하여 국가산업발전에<br />기여)" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_026.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005-2006</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.105" text="도라산 평화공원 조성계획 수립 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_027.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2005-2012</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.106" text="인천경제자유구역 영종지구 개발사업(영종지역)<br />조사 및 실시설계" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_028.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2006</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.107" text="기술개발연구원 출범 및 정부시책에 부응하는 R&amp;D사업<br />적극수행" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_029.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2006-2007</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.108" text="녹산국가산업단지 해안방재사업 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_030.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2007.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.109" text="베트남 하노이 지사 설립" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_031.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2007.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.110" text="성실납세의무 이행 표창" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_032.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2009.7</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.111" text="건설업 산업환경설비공사업" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_033.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2010.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.112" text="제44회 납세자의 날, 대통령 표창장수여" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_034.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2010.4</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.113" text="본사이전 (서울특별시-강남구-대치동-942-1)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_035.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2010.8</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.114" text="유가증권시장 상장" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_036.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2011</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.115" text="서울 길동배수지 기본 및 실시설계" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_037.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2011.5</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.116" text="도화 미래비전 2020 선포식" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_038.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2013.3</span>
														<p class="tit">
															<spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.117" text="대한토목학회 은상수상 (대동화명대교) 2013<br />올해의토목구조물" />
														</p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_039.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2014.1</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.118" text="MOT 표창장 (베트남 GMS남부해안연결도로)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_040.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2014.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.119" text="대한토목학회-토목대상" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_041.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2015.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.120" text="도화 뉴비전 2020 선포" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_042.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2015.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.121" text="OHSAS인증서(국문)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_043.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2016.3</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.122" text="대통령 금탑산업훈장" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_044.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2017.1</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.123" text="도화역사관 개관" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_045.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2018.5</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.124" text="월드클래스 300선정" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_046.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2018.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.125" text="국내 최초FI 주도형 엔지니어링사-민자사업(GTX-A) 수주" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_047.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2019.10</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.126" text="국내 최초 PMO 계약 체결 (페루 친체로 신공항건설)" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_048.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2020.04</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.127" text="국내 최초 소형공항 울릉공항 건설공사 실시설계 수주" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_049.jpg" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2021.01</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.128" text="New Vision 2030 선포" /></p>
													</div>
												</a>
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_050.png" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2022.03</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.129" text="대한토목학회, 올해의 토목구조물 동상" /></p>
													</div>
												</a>
												
												<a class="detail-anchor" href="javascript:void(0);">
													<div class="detail-img"><img src="/images/pc/img_history_2000_051.png" alt="" /></div>
													<div class="detail-desc">
														<span class="year">2022.12</span>
														<p class="tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.004.001.130" text="대한토목학회, 올해의 토목구조물 동상" /></p>
													</div>
												</a>
											</div>
										</div>
									</div>
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
		<script src="/inc/js/history.js" type="text/javascript" charset="utf-8"></script>
	</body>
	<script type="text/javascript">
	
	var _history = new HistoryUI();
	
	// 메인 비주얼영역에서 링크 클릭시 해당 연혁리스트로 이동
	// _history.setPosInit(); : 초기화
	// _history.setHistoryList($index) : 리스트 이동
	// 0 : 1957 - 1970
	// 1 : 1980 - 1990
	// 2 : 2000's
	
	</script>
</html>