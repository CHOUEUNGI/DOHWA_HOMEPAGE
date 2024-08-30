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
		<%@ include file="/WEB-INF/views/mobile/layout/head.jsp" %>
	</head>
	<body class="main">
		<!--[if lte IE 8]>
			<p class="browserupgrade">
				You are using an
				<strong>outdated</strong>
				browser. Please
				<a href="https://browsehappy.com/">upgrade your browser</a>
				to improve your experience and security.
			</p>
		<![endif]-->
		<div id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<!-- s: 2020820 레이어팝업 추가-->
				<c:if test="${not empty popupList}">
					<c:forEach items="${popupList }" var="pop">
						<div class="lypopup-wrap" id="mainLayerPopup${pop.seq }">
							<!-- 활성화시 .active 추가 -->
							<div class="lypopup-container">
								<button class="lypopup-close layer-close" type="button"><span class="hide-txt"><spring:message code="FRONT.COMMON.BUTTON.CLOSE" text="닫기" /></span></button>
								<div class="lypopup-content">
									<img src="<c:url value="${WEB_URL}" /><c:out value="${pop.path }" />/<c:out value="${pop.newName }" />" alt="<c:out value="${pop.title}"/>" />
									<c:if test="${not empty pop.pcLinkUrl}">
									<a href="<c:url value="${pop.pcLinkUrl}"/>" <c:if test="${'Y' eq pop.pcLinkYn}">target="_blank"</c:if> style="display:block;height:11.3333vw;padding:3.2vw 0px;text-align:center;background:#004442"><span style='font-family:"NanumSquareB";color:#fff'><c:out value="${pop.linkBtnNm}"/></span></a>
									</c:if>
								</div>
								<div class="lypopup-footer clfix">
									<span class="input-checkbox right">
										<input type="checkbox" id="popchk01_${pop.seq }" name="popchk" />
										<label for="popchk01_${pop.seq }"><span class="txt"><spring:message code="FRONT.COMMON.BUTTON.DONTSHOW" text="오늘 하루 열지 않기" /></span></label>
									</span>
									<button class="btn-close" type="button"><spring:message code="FRONT.COMMON.BUTTON.CLOSE" text="닫기" /></button>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- e: 2020820 레이어팝업 추가-->
				<div id="content" role="main">
					<div class="main-visual-wrap">
						<div class="main-visual visual-area">
							<div class="main-slide swiper-container">
								<div class="swiper-wrapper">
									<c:forEach items="${bannerList }" var="bnn" varStatus="bnnStat">
									<div class="swiper-slide slide0${bnnStat.count}">
										<c:if test="${not empty bnn.SUB_IMG1}"><div class="img-box" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG1}"/>')"></div></c:if>
										<c:if test="${not empty bnn.SUB_IMG2}"><div class="img-box" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG2}"/>')"></div></c:if>
										<c:if test="${not empty bnn.SUB_IMG3}"><div class="img-box" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG3}"/>')"></div></c:if>
										<div class="tit-box">
											<c:if test="${not empty bnn.MO_TITLE1 || not empty bnn.MO_SUB_TITLE1}">
											<div class="txt-list">
												<strong class="slide-tit ui-tit"><c:out value="${bnn.MO_TITLE1}" escapeXml="flase"/></strong>
												<p class="slide-txt ui-sub-tit"><c:out value="${bnn.MO_SUB_TITLE1}" escapeXml="flase"/></p>
											</div>
											</c:if>
											<c:if test="${not empty bnn.MO_TITLE2 || not empty bnn.MO_SUB_TITLE2}">
											<div class="txt-list">
												<strong class="slide-tit ui-tit"><c:out value="${bnn.MO_TITLE2}" escapeXml="flase"/></strong>
												<p class="slide-txt ui-sub-tit"><c:out value="${bnn.MO_SUB_TITLE2}" escapeXml="flase"/></p>
											</div>
											</c:if>
											<c:if test="${not empty bnn.MO_TITLE3 || not empty bnn.MO_SUB_TITLE3}">
											<div class="txt-list">
												<strong class="slide-tit ui-tit"><c:out value="${bnn.MO_TITLE3}" escapeXml="flase"/></strong>
												<p class="slide-txt ui-sub-tit"><c:out value="${bnn.MO_SUB_TITLE3}" escapeXml="flase"/></p>
											</div>
											</c:if>
										</div>
										<!-- s: 20200903 서브텍스트 1개 추가-->
										<c:choose>
											<c:when test="${not empty bnn.MO_URL1 && not empty bnn.LINK_BTN_NAME1}">
												<div class="btn-wrap">
													<a class="bttn-link" href="<c:out value="${bnn.MO_URL1}"/>">
														<span class="txt01"><c:out value="${bnn.LINK_BTN_NAME1}"/></span>
														<em class="line" aria-hidden="true"></em>
													</a>
												</div>
											</c:when>
											<c:when test="${not empty bnn.MO_URL2 && not empty bnn.LINK_BTN_NAME2}">
												<div class="btn-wrap">
													<a class="bttn-link" href="<c:out value="${bnn.MO_URL2}"/>">
														<span class="txt01"><c:out value="${bnn.LINK_BTN_NAME2}"/></span>
														<em class="line" aria-hidden="true"></em>
													</a>
												</div>
											</c:when>
											<c:when test="${not empty bnn.MO_URL3 && not empty bnn.LINK_BTN_NAME3}">
												<div class="btn-wrap">
													<a class="bttn-link" href="<c:out value="${bnn.MO_URL3}"/>">
														<span class="txt01"><c:out value="${bnn.LINK_BTN_NAME3}"/></span>
														<em class="line" aria-hidden="true"></em>
													</a>
												</div>
											</c:when>
										</c:choose>
										<!-- s: 20200903 서브텍스트 1개 추가-->
										<!-- s: 20200825 .btn-wrap 제거-->
										<!-- e: 20200825 .btn-wrap 제거-->
									</div>
									</c:forEach>
								</div>
								<button class="swiper-button-prev bttn-swiper" type="button"><span class="hide-txt">Prev</span></button>
								<button class="swiper-button-next bttn-swiper" type="button"><span class="hide-txt">Next</span></button>
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
						<div class="noti-scroll"><span>Scroll</span></div>
					</div>
					<div class="main-cont-wrap">
						<div class="main-cont-box business">
							<div class="box-inner" style="display:none">
								<h2 class="box-tit ui-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.001" text="BUSINESS" /></h2>
								<p class="tit-desc ui-sub-tit">
									<spring:message code="FRONT.COMMON.MENU.MAIN.002" text="초일류 종합엔지니어링 기업 도화의 세계를 향한 도전은 계속됩니다." />
								</p>
								<div class="business-slide swiper-container">
									<ul class="business-list swiper-wrapper">
										<li class="swiper-slide">
											<div class="img-area"><img src="/images/mobile/img_business01.png" alt="" /></div>
											<div class="txt-area">
												<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.003" text="Water Division" /></span>
												<a class="tit" href="<c:url value="${mobileStartPath }business#MARKET_001" />">
													<spring:message code="FRONT.COMMON.MENU.MAIN.004" text="물 부문" />
													<em class="ico-arr" aria-hidden="true"></em>
												</a>
												<!-- s: 20200813 텍스트 수정-->
												<ul class="sub-list">
													<c:forEach items="${market001}" var="code" varStatus="codeStat">
														<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/>&nbsp;</a></li>
													</c:forEach>
												</ul>
												<!-- e: 20200813 텍스트 수정-->
											</div>
										</li>
										<li class="swiper-slide">
											<div class="img-area"><img src="/images/mobile/img_business02.png" alt="" /></div>
											<div class="txt-area">
												<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.005" text="Urban Division" /></span>
												<a class="tit" href="<c:url value="${mobileStartPath }business#MARKET_002" />">
													<spring:message code="FRONT.COMMON.MENU.MAIN.006" text="도시부문" />
													<em class="ico-arr" aria-hidden="true"></em>
												</a>
												<!-- s: 20200813 텍스트 수정-->
												<ul class="sub-list">
													<c:forEach items="${market002}" var="code" varStatus="codeStat">
														<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/>&nbsp;</a></li>
													</c:forEach>
												</ul>
												<!-- e: 20200813 텍스트 수정-->
											</div>
										</li>
										<li class="swiper-slide">
											<div class="img-area"><img src="/images/mobile/img_business03.png" alt="" /></div>
											<div class="txt-area">
												<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.007" text="Transportation Division" /></span>
												<a class="tit" href="<c:url value="${mobileStartPath }business#MARKET_003" />">
													<spring:message code="FRONT.COMMON.MENU.MAIN.008" text="교통부문" />
													<em class="ico-arr" aria-hidden="true"></em>
												</a>
												<!-- s: 20200813 텍스트 수정-->
												<ul class="sub-list">
													<c:forEach items="${market003}" var="code" varStatus="codeStat">
														<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/></a></li>
													</c:forEach>
												</ul>
												<!-- e: 20200813 텍스트 수정-->
											</div>
										</li>
										<li class="swiper-slide">
											<div class="img-area"><img src="/images/mobile/img_business04.png" alt="" /></div>
											<div class="txt-area">
												<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.009" text="Energy Division" /></span>
												<a class="tit" href="<c:url value="${mobileStartPath }business#MARKET_004" />">
													<spring:message code="FRONT.COMMON.MENU.MAIN.010" text="에너지부문" />
													<em class="ico-arr" aria-hidden="true"></em>
												</a>
												<!-- s: 20200813 텍스트 수정-->
												<ul class="sub-list">
													<c:forEach items="${market004}" var="code" varStatus="codeStat">
														<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/></a></li>
													</c:forEach>
												</ul>
												<!-- e: 20200813 텍스트 수정-->
											</div>
										</li>
									</ul>
									<div class="swiper-pagination"></div>
								</div>
							</div>
						</div>
						<div class="main-cont-box project">
							<div class="box-inner">
								<div class="box-tit-area">
									<h2 class="box-tit ui-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.011" text="PROJECT" /></h2>
									<p class="tit-desc ui-sub-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.012" text="도화의 세계를 향한 도전은 계속됩니다." /></p>
								</div>
								<div class="project-slide swiper-container">
									<div class="swiper-wrapper">
										<c:forEach items="${projectList }" var="prj" varStatus="prjStat">
											<c:if test="${prjStat.index < 8 }">
												<div class="swiper-slide list-item">
													<a class="item-link" href="<c:url value="${mobileStartPath }business/project/" /><c:out value="${prj.seq }" />">
														<span class="item-img" style="background-image:url('<c:url value="${WEB_URL}" /><c:out value="${empty prj.mainFileName2 ? prj.filePath : prj.mainFileName2 }" />'"></span>
														<p class="item-tit"><span class="line-clamp"><c:out value="${prj.projectMlVO.title }" /></span></p>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="swiper-controller">
										<button class="swiper-button-next swiper-button-black"></button>
										<button class="swiper-button-prev swiper-button-black"></button>
										<div class="swiper-pagination"></div>
									</div>
								</div>
								<a class="bttn-more" href="<c:url value="${mobileStartPath}/business/project"/>"><em class="ico-more" aria-hidden="true"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></em></a>
							</div>
						</div>
						<div class="main-cont-box news">
							<div class="box-inner">
								<h2 class="box-tit ui-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.013" text="NEWS" /></h2>
								<p class="tit-desc ui-sub-tit">
									<spring:message code="FRONT.COMMON.MENU.MAIN.014" text="세상을 아름답게 디자인하는 도화의 새로운 소식을 만나보세요." />
									<!-- 20200813 텍스트 수정 -->
								</p>
								<div class="news-slide swiper-container">
									<div class="swiper-wrapper news-list">
										<c:forEach items="${newsList }" var="news" varStatus="newsStat">
											<c:if test="${newsStat.index < 4 }">
												<div class="news-item swiper-slide">
													<c:choose>
														<c:when test="${news.typeCd  eq '01'}">
														<span class="list-category txt-blue"><spring:message code="FRONT.COMMON.MENU.MAIN.030" text="영업" /></span>
														</c:when>
														<c:when test="${news.typeCd  eq '02'}">
														<span class="list-category txt-blue"><spring:message code="FRONT.COMMON.MENU.MAIN.029" text="수상" /></span>														
														</c:when>
														<c:when test="${news.typeCd  eq '03'}">
														<span class="list-category txt-green"><spring:message code="FRONT.COMMON.MENU.MAIN.031" text="사회공헌" /></span>
														</c:when>
														<c:otherwise>
														<span class="list-category txt-blue"><spring:message code="FRONT.COMMON.MENU.MAIN.032" text="기타" /></span>
														</c:otherwise>
													</c:choose>
													<strong class="list-tit">
														<span class="line-clamp">
															<c:out value="${news.title }"/>
															<!-- 20200813 텍스트 수정 -->
														</span>
													</strong>
													<!-- 20200813 p.list-txt 삭제-->
													<c:if test="${not empty news.url }">
														<a class="bttn-link-bd" href="<c:out value="${news.url }" />" target="_blank"><spring:message code="FRONT.COMMON.MENU.MAIN.015" text="언론사 바로가기" /></a>
													</c:if>
													<c:if test="${empty news.url }">
														<a class="bttn-link-bd" href="${mobileStartPath }prroom/news/<c:out value="${news.seq }" />"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.014" text="자세히 보기" /></a>
													</c:if>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="swiper-pagination"></div>
								</div>
								<a class="bttn-more" href="<c:url value="${mobileStartPath}prroom/news"/>"><em class="ico-more" aria-hidden="true"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></em></a>
							</div>
						</div>
						<div class="main-cont-box carrer">
							<div class="box-inner" style="display:none">
								<h2 class="box-tit ui-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.016" text="CAREER" /></h2>
								<p class="tit-desc ui-sub-tit">
									<spring:message code="FRONT.COMMON.MENU.MAIN.017" text="열정과 패기가 넘치는 창의적인 인재를 환영합니다." />
								</p>
								<div class="ui-cont">
									<spring:message code='FRONT.COMMON.MENU.MAIN.018.MOB' text='<div class="txt-box">사람이 최우선이라는<span class="txt-green">‘인간 중심의 사고’</span>는 60년 동안 정도 경영을 하게 한 힘이었으며, 진취적인 행동과<span class="txt-blue">‘창의적인 사고’</span>는 미래를 개척해 나가는 원동력입니다.<span class="txt-orange">‘도화인의 화합’</span>을 통해 글로벌 종합 엔지니어링 회사로 도약하겠습니다.</div>' />
									<div class="btn-wrap">
										<a class="bttn type01 style01" href="<c:url value="${mobileStartPath }recruit/procedure"/>">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.019" text="채용안내 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
										<br />
										<c:choose>
											<c:when test="${'ko' eq _lang}">
												<a class="bttn type01 style01" href="https://dohwa.recruiter.co.kr/appsite/company/index" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a>
											</c:when>
											<c:when test="${'en' eq _lang}">
												<a class="bttn type01 style01" href="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a>
											</c:when>
											<c:otherwise>
												<a class="bttn type01 style01" href="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec" target="_blank">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a>
											</c:otherwise>
										</c:choose>
										<!-- <a class="bttn type01 style01" href="<c:url value="http://recruiter.dohwa.co.kr" />" target="_blank">
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a> -->
									</div>
								</div>
							</div>
						</div>
						<div class="main-cont-box company">
							<div class="box-inner">
								<h2 class="box-tit ui-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.021" text="지속가능경영" /></h2>
								<p class="tit-desc ui-sub-tit">
									<spring:message code="FRONT.COMMON.MENU.MAIN.022" text="고객과 파트너 모두에게 최고의 기술과 품질을 바탕으로 정성을 다하는 기업이 되겠습니다" />
								</p>
								<div class="box-btm ui-cont">
									<div class="box-btm-inner">
										<a class="bttn-link-bd" href="<c:url value="${mobileStartPath }aboutus/csr_01"/>">
											<span>
												<spring:message code="FRONT.COMMON.MENU.MAIN.023" text="나눔경영" />
											</span>
										</a>
									</div>
									<div class="box-btm-inner">
										<a class="bttn-link-bd" href="<c:url value="${mobileStartPath }aboutus/csr_02"/>">
											<span>
												<spring:message code="FRONT.COMMON.MENU.MAIN.025" text="안전/품질경영" />
											</span>
										</a>
									</div>
									<div class="box-btm-inner">
										<a class="bttn-link-bd" href="<c:url value="${mobileStartPath }aboutus/csr_03"/>">
											<span>
												<spring:message code="FRONT.COMMON.MENU.MAIN.027" text="윤리준법경영" />
											</span>
										</a>
									</div>
								</div>
							</div>
							<div class="grid-wrap" aria-hidden="true">
								<div class="grid-ico-wrap" aria-hidden="true">
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
						<div class="cnt-grid-wrap" aria-hidden="true">
							<div class="grid-ico-wrap" aria-hidden="true">
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
							</div>
							<div class="grid-line-wrap" aria-hidden="true">
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<div class="dimm"></div>
		<div class="cnt-grid-wrap" aria-hidden="true">
			<div class="grid-ico-wrap" aria-hidden="true">
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
				<div class="grid-ico" aria-hidden="true"></div>
			</div>
			<div class="grid-line-wrap" aria-hidden="true">
				<div class="grid-line" aria-hidden="true"></div>
				<div class="grid-line" aria-hidden="true"></div>
			</div>
		</div>
		<script src="/inc/js/jquery.js"></script>
		<script src="/inc/js/swiper.min.js"></script>
		<script src="/inc/js/TweenMax.min.js"></script>
		<script src="/inc/js/CustomEase.min.js"></script>
		<script src="/inc/js/ComponentUI.js"></script>
		<script src="/inc/js/common_mo.js"></script>
		<script src="/inc/js/countUp.min.js"></script>
		<script src="/inc/js/main_mo.js" type="text/javascript" charset="utf-8"></script>
		<%@ include file="/WEB-INF/views/front/layout/common_utils_js.jsp" %> <!-- 추후 js 파일로 import할 예정 -->
		<script>
			var businessSwiper = new Swiper(".business-slide.swiper-container", {
				slidesPerView: 2,
				slidesPerGroup: 2,
				//autoHeight : true,
				pagination: {
					el: ".business-slide .swiper-pagination"
				}
			});
	
			var projectSwiper = new Swiper(".project-slide.swiper-container", {
				slidesPerView: 1,
				effect: "coverflow",
				grabCursor: true,
				slidesPerView: "auto",
				coverflowEffect: {
					rotate: 50,
					stretch: 0,
					depth: 100,
					modifier: 1,
					slideShadows: false
				},
				pagination: {
					el: ".project-slide .swiper-pagination",
					type: "fraction"
				},
				navigation: {
					nextEl: ".project-slide .swiper-button-next",
					prevEl: ".project-slide .swiper-button-prev"
				}
			});
	
			var newsSwiper = new Swiper(".news-slide.swiper-container", {
				slidesPerView: 2,
				slidesPerGroup: 2,
				pagination: {
					el: ".news-slide .swiper-pagination"
				}
			});
	
			component.selectBox(".bttn-lang-sel", 150);
			// s: 20200827 모바일 레이어팝업 스크립트 추가
			component.modalPopUp(".lypopup-wrap");
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				$('.lypopup-wrap').each(function(){
					// 오늘 하루 열지 않기
					var $lypopup = $(this);
					if(CommonUtils.compareCookie($lypopup.attr('id'), DateUtils.getNowStr('yyyyMMdd'))){
						$(this).removeClass('active');
					} else {
						$(this).removeClass('active').addClass('active');
					}

					//체크박스 이벤트 바인딩
					$lypopup.find('input[type=checkbox]').on('click', function(e){
						var $lypopupChk = $(this);
						if($lypopupChk.is(':checked')){
							CommonUtils.setCookie($lypopup.attr('id'), DateUtils.getNowStr('yyyyMMdd'), 1);
						} else {
							CommonUtils.setCookie($lypopup.attr('id'), '', -1);
						}
					});
				});

			});

		});
		</script>
	</body>
</html>