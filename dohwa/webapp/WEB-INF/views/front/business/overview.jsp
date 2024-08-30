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
	<body class="water">
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
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual business01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.002" text="사업소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.057" text="Scroll" /></span>
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
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list tab-list-1depth">
									<li class="active"><a class="item" href="javascript:void(0);" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.003" text="Overview" /></a></li>
									<li><a class="item" href="<c:url value="/business/project" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.004" text="Project" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents full-type business-cont-wrap contents-1depth clfix">
							<span class="page-decs">
								<strong>02 <spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="business-tab-area">
								<ul class="business-tab-list tab-list-2depth">
									<li class="active"><a class="item" href="#MARKET_001" data-code="MARKET_001"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.007" text="물" /></a></li>
									<li><a class="item" href="#MARKET_002" data-code="MARKET_002"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.008" text="도시" /></a></li>
									<li><a class="item" href="#MARKET_003" data-code="MARKET_003"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.009" text="교통" /></a></li>
									<li><a class="item" href="#MARKET_004" data-code="MARKET_004"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.010" text="에너지" /></a></li>
								</ul>
							</div>
							<div class="business-tab-cont business-water contents-2depth" style="display:block;">
								<div id="bg0" aria-hidden="true"></div>
								<div class="content-inner">
									<div class="business-summary-wrap water-division">
										<div class="business-summary-inner">
											<p class="business-name-eng"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.011" text="Water Sector" /></p>
											<h3 class="business-name"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.012" text="물 부문" /></h3>
											<div class="business-txt-box">
												<spring:message code="FRONT.COMMON.MENU.BUSINESS.001.013" text="도화는 상하수도 분야에서 매년 1위를 차지하는 선두업체입니다. 특히, 광역상수도를 비롯한 상수도 설계에 있어서 대표 주자입니다. 광역상수도는 대한민국 내의 급증하는 용수수요에 대처하는 매우 중요한 사회기반시설로서 대청댐, 전주권, 울산권, 광양권 등 광역상수도 시설의 타당성 조사, 기본 및 실시설계 등을 성공적으로 수행하였습니다.
												<br />
												또한, 수자원 및 방재 관련 사업을 수행하고 있으며, 2000년대에 들어서면서 해외의 하천개발사업, 수력발전사업, 홍수조절통합계획 등 수자원사업에 다수 참여하고 있습니다." />
											</div>
										</div>
									</div>
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list-3depth">
											<li class="active">
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.014" text="상수도" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.015" text="하수도" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.016" text="하천/수자원개발/댐/수력발전" /></span></a>
											</li>
										</ul>
									</div>
									<div class="inner-tab-cont contents1-3depth" style="display:block;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.017" text="도화는 국내 상하수도 분야에서 매년 수주실적 1위를 달성해온 물 분야 선도기업입니다. 특히, 광역상수도를 비롯한 상수도 계획 및 설계에 있어서 대표 주자로 자리매김하고 있습니다. 광역상수도는 국내의 급증하는 용수 수요에 대처하는 매우 중요한 사회기반시설로서, 도화는 대청댐, 전주권, 울산권, 광양권 등 광역상수도 시설의 타당성 조사, 기본 및 실시설계 등을 성공적으로 수행해왔습니다.
													<br />
													또한 기후 변화에 따른 원수 부족에 대처하기 위해 취수원 다변화 설계와 해수담수화를 통한 용수 공급에도 풍부한 경험을 갖고 있습니다. 오랜 기간 축적한 경험과 기술을 바탕으로 페루, 네팔, 인도네시아, 베트남, 미얀마 등 해외 상수도 사업에도 적극 참여하여 타당성조사, 설계 및 감리를 성공적으로 완수했습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_001"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_001" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents1-3depth" style="display:block;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.020" text="도화는 대한민국 하수도 분야를 선도하는 기업으로서, 유역하수도 정비 계획부터 특별&middot;광역시, 시&middot;군 하수도정비 기본계획에 이르기까지 대한민국의 하수도 마스터 플랜을 수립하는 대표 회사입니다.
												<br />
												하수처리장 및 하수관거 설계에 관한 기술적, 제도적 요구사항을 충실히 이행하고, 나아가 하수처리시설 운영 서비스를 통한 토탈 솔루션 제공자 역할을 담당합니다.
												<br />
												대한민국을 넘어서 방글라데시, 네팔, 탄자니아, 캄보디아, 니카라과, 페루, 인도네시아 등으로 진출하여 주민 생활환경 개선과 방류수역 수질 보전에도 기여하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_001"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_001" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents1-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.021" text="하천 및 하천환경, 댐 및 수력발전, 수자원개발, 재해영향평가, 방재 등으로서 유역종합계획, 하천기본계획, 하천종합개발계획, 홍수위험지도제작, 하천재해예방 및 생태하천복원사업, 유역조사, 댐 조사 및 설계, 유지용수확보, 홍수조절지, 배수펌프장, 수력발전사업, 자연재해저감종합계획 및 우수유출저감대책계획, 자연재해위험지구 개선정비사업 및 재해영향평가 및 재해복구사업 분석평가, 비상대처계획 등 각분야의
													최고의기술력를 갖추어 수자원분야 및 방재분야의 선도적인 역할을 담당하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_001"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_001" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="business-tab-cont business-city contents-2depth" style="display:none;">
								<div id="bg1" aria-hidden="true"></div>
								<div class="content-inner">
									<div class="business-summary-wrap city-division">
										<div class="business-summary-inner">
											<p class="business-name-eng"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.022" text="Urban Sector" /></p>
											<h3 class="business-name"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.023" text="도시 부문" /></h3>
											<div class="business-txt-box">
												<spring:message code="FRONT.COMMON.MENU.BUSINESS.001.024" text="도화는 한정된 국토공간의 효율적 이용계획 수립과 환경 친화적인 도시계획에 필요한 그간의 축적된 기술과 지속적인 연구개발 노력으로 타사와는 차별화된 기술력을 보유하고 있으며, 우리나라 대표적인 주택 및 산업단지를 비롯하여 생태환경단지에 이르기까지 폭 넓은 사업수행영역을 확보하고 있습니다." />
											</div>
										</div>
									</div>
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list2-3depth">
											<li class="active">
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.025" text="도시계획&middot;개발" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.026" text="조경&middot;레저" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.027" text="스마트시티" /></span></a>
											</li>
										</ul>
									</div>
									<div class="inner-tab-cont contents2-3depth" style="display:block;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.028" text="한정된 국토공간의 효율적 이용계획 수립과 환경 친화적인 도시계획에 필요한 그간의 축적된 기술과 지속적인 연구개발 노력으로 타사와는 차별화된 기술력을 보유하고 있으며, 우리나라 대표적인 주택 및 산업단지를 비롯하여 생태환경단지에 이르기까지 폭 넓은 사업수행영역을 확보하고 있습니다.
													<br />
													도시기본계획, 도시관리계획(재개발), 택지개발, 산업단지, 유통단지 등의 도시계획과 공간설계를 위한 단지계획, 단지토공, 상&middot;하수도, 하천, 교량, 지반 등의 복합공정을 수행하고 있습니다. 최근에는 동남아, 중동 등의 지역에 신도시 및 주택단지, 산업단지 등 해외도시개발 부문에도 사업수행영역을 확장해 나가고 있습니다.
													<br />
													앞으로도 국내외 도시공간의 효율적인 이용과 환경친화적인 도시계획을 통한 인간의 삶의 질과 생활수준을 향상시키기 위해 연구, 경험, 독창성을 모토로 지속가능한 미래사회의 구현을 위해 노력할 것입니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_002"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_002" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents2-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.029" text="국립 중앙 수목원 조성사업 및 새만금 관광용지 개발기본계획 등 대규모 국책사업을 성공적으로 수행하여 업계 최고의 기술력을 인정받고 있습니다. 특히 공원, 관광지, 유원지, 자연공원, 골프장 및 체육시설, 생태 및 경관계획 분야 등 다양한 업무를 수행한 경험과 축적된 기술력을 보유하고 있습니다.
													<br />
													앞으로도 끊임없는 노력과 지속적인 연구개발을 통해 자연과 인간이 조화될 수 있는 창조적이고 지속가능한 미래지향적 공간창조에 최선의 노력을 다하겠습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_002"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_002" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents2-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.030" text="지속가능한 도시공간과 4차 산업혁명 시대의 혁신기술이 융합된 차별화된 스마트시티 모델을 제공함으로써 세계적으로 급속한 도시화에 따른 문제들을 해결하고, 인류의 삶의 질을 높이는 미래지향적인 도시 창조에 기여하고 있습니다.
													<br />
													도시 및 지역계획, 신도시, 주택단지, 산업단지, 물류단지, 관광단지, 도시재생 및 정비를 위한 도시컨설팅과 스마트 교통, 스마트 에너지, 스마트 안전, 스마트 환경, 스마트 관광 등 분야별로 모듈화된 스마트시티 솔루션을 통합함으로써 국가 및 도시별 다양한 요구에 최적화된 맞춤형 스마트시티 사업모델을 제공합니다.
													<br />
													앞으로도 끊임없는 연구와 혁신을 토대로 스마트시티 컨설팅 뿐만 아니라 디벨로퍼로서의 업무영역 확장을 통해 성공적인 스마트시티 비즈니스 모델 창출 및 사업 실현을 위한 최고의 비즈니스 파트너로 거듭날 것입니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_002"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_002" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="business-tab-cont business-transportation contents-2depth" style="display:none;">
								<div id="bg2" aria-hidden="true"></div>
								<div class="content-inner">
									<div class="business-summary-wrap transportation-division">
										<div class="business-summary-inner">
											<p class="business-name-eng"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.031" text="Transportation Sector" /></p>
											<h3 class="business-name"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.032" text="교통 부문" /></h3>
											<div class="business-txt-box"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.033" text="종합교통계획, 도로, 공항, 철도 교량, 항만등 교통과 관련된 전반적인 분야에서 국내 최고의 전문인력들과 최상의 교통체계를 수립하고 있습니다.
												<br />
												기존 교통체계의 문제점 개선 및 안전과 편리성에 기여하는 최상의 교통서비스를 제공하기 위해 지속적인 노력을 다하고 있으며, 인간중심의 친환경 교통체계 구축에 선도적인 역할을 수행하고 있습니다." />
											</div>
										</div>
									</div>
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list3-3depth">
											<li class="active">
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.034" text="도시공항" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.035" text="교통계획" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.036" text="철도/지하철" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.037" text="교량" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.038" text="항만" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.039" text="지반터널" /></span></a>
											</li>
										</ul>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:block;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.040" text="창립 이래 반세기 동안 국토의 대동맥인 경부고속도로 및 서해안 고속도로를 비롯하여 수많은 고속도로와 국도, 지방도 설계 뿐만 아니라 대중교통 등 교통개선 사업을 성공적으로 수행하여 한국의 현대식 도로 건설 및 교통체계개선과 역사를 같이 함으로써 명실공히 경험과 기술력을 인정받았습니다.
													<br />
													특히, 고객만족을 최우선으로 하고, 각종 첨단기술 도입 및 활용으로 모든 성과품을 데이터베이스화 함으로써 한국 도로 건설공사 및 교통체계 선진화에 앞장서고 있습니다. 끊임없는 신기술 개발과 인재 양성을 토대로 미래형 지식산업의 선두주자로 나아 가고, 21세기에도 도전과 개척의 역사는 계속될 것입니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.041" text="종합교통계획, 대중교통 및 녹색교통, 교통체계개선(TSM), 광역교통, 교통영향평가, 교통안전 등을 비롯한 교통에 관련된 전반적인 사업을 수행하고 있으며 국내 최고의 전문인력으로 최상의 교통체계를 수립하고 있습니다.
													<br />
													기존 교통체계의 문제점 개선 및 안전과 편리성에 기여하는 최상의 교통서비스를 제공하기 위해 지속적인 노력을 다하고 있으며, 인간중심의 친환경 대중교통 조성 및 녹색교통체계 구축에 선도적인 역할을 수행하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.042" text="다년간 축적된 풍부한 경험과 선도적인 기술 노하우로 국내의 철도 및 도시철도 건설에 일익을 담당하고 있으며, 최상의 기술력을 바탕으로 알제리, 방글라데시, 페루, 스리랑카, 탄자니아 등 해외시장 개척에 선구자적인 역할을 담당하고 있습니다. 또한, 토목뿐만 아니라 궤도, 기계, 전기, 신호, 통신 등 시스템분야를 총괄하는 한편, 업무영역도 단순한 설계단계에 머무르지 않고 공사를 포함한 디자인빌드 아이디어 및 자본을
													결합한 민간투자사업까지도 추진하고 있습니다. 우수한 기술진과 설계 노하우를 통해 21세기 종합철도교통체계 제공이 우리 부문의 지향 목표이며, 앞으로도 기술력 강화는 물론이며 품질제일주의 목표를 실현하여 수요자를 위한 가치창조와 철도교통 문화창조에 최선을 다할 것입니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.043" text="그동안 국내외의 도로 및 철도교량, 지하 공동구, 해상 풍력을 포함한 해상 구조물 기초 등을 포함한 다양한 형식의 구조물 설계를 수행하였으며 이러한 경험을 바탕으로 보다 안전하고 공학적인 구조물 계획 및 설계를 수행하고 있습니다. 전세계를 대상으로 각 국가별 설계기준과 각종 시방기준을 바탕으로 가설 지역에 최적화된 구조물 설계를 위해 모든 구성원이 노력하고 있으며 특수교량 시공감리, PMC, EPC 등에 대한
													사업확장을 추진하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.044" text="1975년 「목포항 삼학도 안벽 신축공사 조사설계 용역」을 시작으로 50여년간 항만 및 해안분야의 설계, 감리, 대안/턴키 등의 다양한 프로젝트를 성공적으로 수행하였으며, 특히 1970년에 국내 최초로 IRAN 코람샤항, 인도네시아 10만톤급 Loading Pier 설계 등을 수행하여 해외사업 진출의 발판을 마련하였습니다. 최근에는 축적된 설계경험과 기술 Know-how를 바탕으로 항만시설, 연안보호시설과 같은 정통 항만분야 뿐만 아니라
													연료하역부두, 회처리장, 취·배수구조물, 해저케이블 등의 발전분야, 해상풍력 등의 신재생 에너지분야에도 적극 참여하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents3-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.045" text="하천/댐/도로교통/해양항만/지하공간 등 사회간접자본 시설물이 건설되는 지반에서의 흙과암반의 역학적 거동및 공학적 특성을 분석하고 지반공학 기술에 의한 각 시설물의 사용성과 안정성을 향상시키며 청정자원인 지하수 개발 및 보존기술력을 통해 궁극적으로 인간과 환경을 위한 지반관련 최적화 기술을 제공하고 있습니다.
													<br />
													최근까지 수행한 사업으로 영암 F1자동차 경기장, 부산 에코델타시티, 인천국제공항 건설공사, 남항대교, 화명대교, 암사대교 건설공사, 새만금-전주간 고속도로,부산외곽순환 고속도로, 안동-임하댐 연결 터널공사, 평화의댐 치수능력 증대사업, 전남신안 해상풍력등이 있습니다. 해외사업으로는 인도네시아 Siborpa 수력발전 건설사업, 바레인 Muharraq하수처리장 , 인도네시아 KTH Biomass Fired Power Plant등이 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_003"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_003" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="business-tab-cont business-energy contents-2depth" style="display:block;">
								<div id="bg3" aria-hidden="true"></div>
								<div class="content-inner">
									<div class="business-summary-wrap energy-division">
										<div class="business-summary-inner">
											<p class="business-name-eng"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.046" text="Energy Sector" /></p>
											<h3 class="business-name"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.047" text="에너지 부문" /></h3>
											<div class="business-txt-box"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.048" text="도화는 풍력, 태양광, 소수력. 바이오매스, 지열 등의 신재생에너지 종합솔루션을 제공하며, 신재생에너지발전의 사업개발 및 투자, 컨설팅, 타당성조사, EPC, O&amp;M까지 전 분야의
												<br />
												업무를 수행하고 있습니다. 신재생에너지 분야의 다수 실적을 바탕으로 고도의 축적된 기술, 경험 등을 바탕으로 향후 국내외 신재생에너지 발전 시장의 선두 주자로 나아갈
												<br />
												것입니다." />
											</div>
										</div>
									</div>
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list4-3depth">
											<li class="active">
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.049" text="태양광" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.050" text="풍력" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.051" text="환경플랜트" /></span></a>
											</li>
											<li>
												<a class="item" href="javascript:void(0);"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.052" text="화력" /></span></a>
											</li>
										</ul>
									</div>
									<div class="inner-tab-cont contents4-3depth" style="display:block;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.053" text="온실가스 배출량을 감소시켜 세계 환경을 지키는데 기여하고자 국내 뿐만 아니라 일본, 베트남, 이라크, 에디오피아, 온두라스 등 다수의 해외 시장에서 태양광발전 사업을 추진하여 수행하고
													<br />
													있습니다. 특히 열악한 환경의 오지에 태양광발전 사업을 추진하므로서 인류의 편의에 기여하고 있으며, 국내외 다수의 수상, 육상태양광사업의 타당성, 컨설팅, 설계, EPC, 감리 업무 수행의
													<br />
													경험을 바탕으로 향후 사업개발 및 투자사업으로의 사업분야 확대를 계획하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_004"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_004" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents4-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.054" text="환경에 영향이 없는 친환경에너지를 제공하기 위한 국가 에너지정책 및 전세계 신재생에너지 추진동향에 발맞추기 위해 국내외 다수의 육상, 해상 풍력발전단지의 타당성조사, 설계를
													<br />
													수행하고 있으며, 최근에는 국내 풍력발전소 건설사업(EPC)을 성공적으로 수행하였습니다. 향후 풍부한 경험과 기술력을 바탕으로 풍력사업의 선두주자로 나아갈 것입니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_004"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_004" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents4-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.055" text="자연과 사람의 풍요로운 미래를 위해 자원순환을 통한 연료화, 소각에너지, 바이오가스화, 매립가스 플랜트 등 환경기초시설의 타당성조사 및 기본계획, 설계, 감리, EPC사업등의 기술집약형 환경기술 서비스를 제공하고 있으며 국내외 환경플랜트분야에서 풍부한 기술경험이 있는 전문인력과 최신의
													<br />
													기술력을 보유하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_004"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_004" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
									<div class="inner-tab-cont contents4-3depth" style="display:none;">
										<div class="business-detail-txt">
											<p>
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.056" text="첨단 기술과 특허권을 통해 에너지 분야의 선두 주자로 석탄화력, 복합화력, 바이오매스 발전에 대한 FS, 엔지니어링, PMC, EPC, O&amp;M 서비스를 수행하며, 탁월한 기술력과 전문인력을
													<br />
													확보하고 있어 최고의 전문성을 보유하고 있습니다." />
												</span>
											</p>
											<div class="bttn-area">
												<button class="bttn-link-bd" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></button>
											</div>
										</div>
										<div class="section-cont">
											<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.019" text="대표 프로젝트" /></h3>
											<div class="business-project-wrap">
												<div class="business-project-slide" data-area="MARKET_004"></div>
												<a class="bttn-more style01" href="<c:url value="/business/project?searchType=MARKET_004" />">
													<em class="ico-more" aria-hidden="true"></em>
													<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.018" text="더보기" /></span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
		<script>
			var component = new ComponentUI();
			component.selectBox(".dropdown-selbox01", 150);
			component.selectBox(".dropdown-selbox02", 150);
			component.selectBox(".dropdown-selbox03", 150);
			component.selectBox(".dropdown-selbox04", 150);
			//- 물
			component.tabContent(".tab-list-2depth", ".contents-2depth");
			component.tabContent(".tab-list-3depth", ".contents1-3depth");
			//- 도시
			component.tabContent(".tab-list2-3depth", ".contents2-3depth");
			//- 교통
			component.tabContent(".tab-list3-3depth", ".contents3-3depth");
			//- 에너지
			component.tabContent(".tab-list4-3depth", ".contents4-3depth");

			//- overview project 영역 images size
			$(".business-project-slide .slide").each(function() {
				var $this = $(this),
					$box = $this.find(".list-img-wrap"),
					$img = $this.find(".list-link").find("img"),
					divAspect = $box.height() / $box.width(),
					imgAspect = $img.height() / $img.width();
				if (imgAspect <= divAspect) {
					//가로가 긴 경우 세로를 박스에 맞추고 가로 크롭
					$img.addClass("img-w");
				} else {
					//세로가 긴 경우 가로를 박스에 맞추고 세로 크롭
					$img.addClass("img-h");
				}
			});

			$(document).ready(function() {
				var _idx = 0;
				if(!StringUtils.isEmpty(location.hash)){
					var arrHash = location.hash.split('#');
					if(arrHash && typeof arrHash.length !== 'undefined' && arrHash.length > 0){
						arrHash.forEach(function(o, i){
							// 사업소개 overview(/business)
							if(o.indexOf('MARKET_') == 0){
								var _o = o;
								$('ul.business-tab-list li').each(function(idx, obj) {
									if($(this).find('a').data('code') === _o) {
										_idx = idx;
									}
								});
							}
						});
					}
				} else if(location.href.indexOf('tabIdx=') > -1){
					if(CommonUtils.getUrlParams().tabIdx){
						if(CommonUtils.getUrlParams().tabIdx.length && CommonUtils.getUrlParams().tabIdx.length > 0 ){
							_idx = Number(CommonUtils.getUrlParams().tabIdx[0]);
						}
					}
				}
				
				$('.water').data('_inst').initCategoryIndex(_idx);
				setTimeout(function() {
					$('ul.business-tab-list li').eq(_idx).find('a').trigger('click');
				}, 900);
			});

			$('.tab-list-2depth').off('click').on('click', 'a', function() {
				project().get($(this).data('code'));
				location.href=location.href.split('#')[0]+"#"+$(this).data('code');
			});

			function project() {
				var _selector = '';
				function get(code) {
					_selector = code;
					$.ajax({
						url : '/business/project/item/' + code,
						type : 'get',
						dataType: 'json',
						contentType: 'application/json',
						success : function(data) {
							set(data);
						},
						error : function(jqXHR) {
							console.log(jqXHR);
						}
					});
				}

				function set(data) {
					var s = '';
					if(typeof data.list !== 'undefined') {
						for(var i in data.list) {
							var item = data.list[i];
							s += '<div class="slide">';
							s += 	'<a class="list-link" href="<c:url value="/business/project/" />'+ item.seq +'?searchType='+_selector+'">';
							s += 		'<div class="list-img-wrap"><img src="<c:url value="${WEB_URL}" />'+ item.image +'" /></div>';
							s += 		'<p class="list-tit">';
							s += 			'<span class="txt line-clamp">'+ item.ml.title +'</span>';
							s += 		'</p>';
							s += 		'<em class="bg" aria-hidden="true"></em>';
							s += 	'</a>';
							s += '</div>';
						}

						$('[data-area="'+ _selector +'"]').empty().append(s);

					}

					$(window).trigger('resize');
				}

				return {
					get : get
				}
			}
		</script>
	</body>
</html>