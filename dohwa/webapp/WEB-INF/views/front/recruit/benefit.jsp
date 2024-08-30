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
		<div class="recruit" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual recruit01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.040" text="RECRUIT" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001" text="채용안내" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.042" text="Scroll" /></span>
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
								<ul class="tab-list">
									<li class="active"><a class="item" href="<c:url value="/recruit/benefit" />" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.043" text="채용안내" /></a></li>
									<li>
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<!-- <a class="item" href="#" onclick="alert('현재 채용사이트 작업중입니다.')"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.044" text="채용지원" /></span></a> -->
												<a class="item" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.044" text="채용지원" />
												</a>
											</c:when>
											<c:when test="${'en' eq _lang}">
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" />" data-id="" target="_blank">
													<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.044" text="채용지원" />
												</a>
											</c:when>
											<c:otherwise>
												<a class="item" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" />" data-id="" target="_blank">
														<spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.044" text="채용지원" />
												</a>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</div>
						</div>
						<div class="contents full-type no-btm-type clfix">
							<span class="page-decs page-decs-type02">
								<strong>05 <spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.003" text="RECRUIT" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont recruit-welfare">
								<div class="content-inner">
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list-3depth">
											<li>
												<a class="item" href="/recruit/procedure"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.001" text="채용절차" /></span></a>
											</li>
											<li class="active">
												<a class="item" href="#" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002" text="복리후생" /></span></a>
											</li>
										</ul>
									</div>
									<p class="title-main"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.005" text="도화엔지니어링은 임직원이 일과 삶의 조화를
										<br />
										추구할 수 있도록 다양한 복리후생을 제공하고 있습니다." />
									</p>
									<div class="bttn-area">
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<!-- <a class="bttn type01 style01" href="#" onclick="alert('현재 채용사이트 작업중입니다.')" role="button"> -->
												<a class="bttn type01 style01" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index"/>" role="button" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a> 
											</c:when>
											<c:when test="${'en' eq _lang}">
												<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec"/>" role="button" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a>
											</c:when>
											<c:otherwise>
												<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec"/>" role="button" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a> 
											</c:otherwise>
										</c:choose>
										
										<!-- <a class="bttn type01 style01" href="<c:url value="http://recruiter.dohwa.co.kr" />" role="button" target="_blank">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.006" text="채용지원 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a> -->
									</div>
								</div>
								<div class="sub-visual">
									<div id="bg2"></div>
								</div>
								<div class="content-inner">
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.008" text="복리후생" /></h3>
									<ul class="welfare-wrap">
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-savings"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.045" text="도화 희망채움적금" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.046" text="공채 신입사원 대상으로 직원과 회사가 공동으로 운용하는 적립금 제도 운영" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-license"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.022" text="자격 수당" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.023" text="기술사, 기사 및 변호사 등 전문자격증에 대하여 수당 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-nonsmoking"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.026" text="금연 수당 지급" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.027" text="비흡연자인 직원에 한하여 월 5만원 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-time"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.012" text="선택적 근로 제도" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.013" text="10:00~17:00 코어타임, 그 외 시간에는 선택적 근로 가능" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-half"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.038" text="반반차 제도" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.039" text="연차를 반차(4시간) 또는 반반차(2시간)로 분할 사용 가능" />
														</li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-condo"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.030" text="휴양시설 지원" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.031" text="전국 10개 유명 콘도 체인, 33개 시설 이용 가능" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-baseball"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.034" text="스포츠 시즌권" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.035" text="프로야구 잠실구장 시즌권 신청자 대상으로 제공" /> </li>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.035.2" text=" FC서울 스카이박스 시즌권 부문별 제공" /> </li>
													</ul>
												</div>
											</div>
										</li>
											<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-dining"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.032" text="구내식당 운영" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.033" text="조식, 중식, 석식 운영" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-edu"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.009" text="외국어 교육 지원" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.010" text="영어, 중국어, 일본어, 독일어 등 온라인 외국어 교육 지원 " />
														</li>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.011" text="원어민과의 전화영어 수업 제공" /></li>
													</ul>
												</div>
											</div>
										</li>
											<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-student"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.016" text="자녀 학자금 지원" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.017" text="분기별 자녀수에 관계없이 학자금 지원" /></li>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.018" text="미취학 아동, 유치원, 초 &middot; 중 &middot; 고등학교, 대학교 등록금 지원" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-prize"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.014" text="장기 근속자 포상" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.015" text="근속 연수별 포상금 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-foundation"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.039.3" text="창립기념일" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.039.4" text="휴가 및 기념품 제공" /></li>
													</ul>
												</div>
											</div>
										</li>
											<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-casual"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.036" text="캐주얼 데이" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.037" text="매주 금요일 자유로운 복장으로 출근" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-health"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.028" text="종합 건강검진" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.029" text="매 2년마다 건강검진 지원" />
														</li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-event"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.024" text="경조사 지원" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.025" text="경조금, 경조화환, 경조용품 지원" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-support"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.019" text="사내 동호회 지원" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.020" text="동호회별 연간 최대 500만원 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-golf"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.039.1" text="계열 골프장 할인" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.039.2" text="Ariji Country Club (경기도 여주 소재)" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-supportbirth"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.047" text="출산지원금" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.048" text="자녀 출산에 따른 출산지원금 및 선물 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-babycare"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.049" text="영유아 돌봄휴가" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.050" text="만 5세 이하 자녀 병원 방문 시 특별휴가 부여" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-relaxroom"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.051" text="임산부 휴게실 운영" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.052" text="수유실이 포함된 임산부 전용 휴게시설 제공" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-mindhealing"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.053" text="마인드 힐링 서비스" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.054" text="매주 금요일 임직원의 멘탈케어를 위한 상담 서비스 제공" /></li>
													</ul>
												</div>
											</div>
										</li>
										<li class="welfare-item">
											<span class="item-icon" aria-hidden="true"><i class="ico-welfare-schoolpresent"></i></span>
											<div class="inner">
												<em class="tit"><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.055" text="초등학교 입학 선물" /></em>
												<div class="list-type-dot">
													<ul>
														<li><spring:message code="FRONT.COMMON.MENU.RECRUIT.001.002.056" text="초등학교 입학 자녀 선물 지급" /></li>
													</ul>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %>
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
	</body>
</html>