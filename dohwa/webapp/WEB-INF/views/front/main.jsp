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
	<body class="main-body">

		<!--[if lte IE 8]>
			<p class="browserupgrade">
				You are using an
				<strong>outdated</strong>
				browser. Please
				<a href="https://browsehappy.com/">upgrade your browser</a>
				to improve your experience and security.
			</p>
		<![endif]-->
		<div class="main-wrap" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<%--//컨텐츠 영역 시작 --%>
			<div id="container">
				<!-- s: 2020818 레이어팝업 클래스 추가-->
				<!--  -->
				<c:if test="${not empty popupList}">
					<c:forEach items="${popupList }" var="pop">
						<div class="lypopup-wrap" id="mainLayerPopup${pop.seq }">
							<div class="lypopup-container">
								<button class="lypopup-close layer-close" type="button"><span class="hide-txt"><spring:message code="FRONT.COMMON.BUTTON.CLOSE" text="닫기" /></span></button>
								<div class="lypopup-content">
									<img src="<c:url value="${WEB_URL}" /><c:out value="${pop.path }" />/<c:out value="${pop.newName }" />" alt="<c:out value="${pop.title}"/>" />
									<c:if test="${not empty pop.pcLinkUrl}">
									<a href="<c:url value="${pop.pcLinkUrl}"/>" <c:if test="${'Y' eq pop.pcLinkYn}">target="_blank"</c:if> style="display:block;height:60px;padding:17px 0px;text-align:center;background:#004442"><span style='font-family:"NanumSquareB";color:#fff'><c:out value="${pop.linkBtnNm}"/></span></a>
									</c:if>
								</div>
								<div class="lypopup-footer clfix">
									<span class="input-checkbox right">
										<input type="checkbox" id="popchk01_${pop.seq }" name="popchk"/>
										<label for="popchk01_${pop.seq }"><span class="txt" style="cursor:pointer;"><spring:message code="FRONT.COMMON.BUTTON.DONTSHOW" text="오늘 하루 열지 않기" /></span></label>
									</span>
									
								 	<button class="btn-close" type="button" style="cursor:pointer;"><spring:message code="FRONT.COMMON.BUTTON.CLOSE" text="닫기" /></button>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<!-- e: 2020818 레이어팝업 클래스 추가-->
				<div id="content" role="main">
					<div class="main-visual visual-area">
						<div class="main-slide swiper-container">
							<!-- 20200807 slide 영역 전면 수정 start-->
							<!-- video 가 있을경우 .slide-img, .btn-wrap 삭제-->
							<!-- .btn-wrap, .slide-img 의 개수는 동일해야 함.-->
							<!-- 5초마다 슬라이드 .btn-wrap > .bttn-link 클릭시 해당 페이지로 링크이동-->
							<!-- slide-img 에 dimm 이미지 처리되어 있으며, video 영상은 영상내에 작업되어있음.-->
							<div class="swiper-wrapper">
								<c:set var="nextBtnName" value="Next"/>
								<c:set var="prevBtnName" value="Prev"/>
								<c:forEach items="${bannerList }" var="bnn" varStatus="bnnStat">
									<c:choose>
										<c:when test="${fn:endsWith(bnn.SUB_IMG1, '.mp4') }">
											<div class="swiper-slide slide0${bnnStat.count}">
												<div class="video">
													<video autoplay muted loop>
														<source src="<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG1}"/>" />
													</video>
												</div>
												<div class="txt-wrap">
													<c:if test="${not empty bnn.WEB_TITLE1 || not empty bnn.WEB_SUB_TITLE1}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE1}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE1}" escapeXml="flase"/></p>
													</div>
													</c:if>
													<c:if test="${not empty bnn.WEB_TITLE2 || not empty bnn.WEB_SUB_TITLE2}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE2}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE2}" escapeXml="flase"/></p>
													</div>
													</c:if>
													<c:if test="${not empty bnn.WEB_TITLE3 || not empty bnn.WEB_SUB_TITLE3}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE3}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE3}" escapeXml="flase"/></p>
													</div>
													</c:if>
												</div>
												<c:if test="${fn:length(bannerList) > 1 }">
													<c:set var="prevBtnName0" value="${empty bnn.PREV_TYPE ? bannerList[(bnnStat.index == 0 ? fn:length(bannerList)-1 : bnnStat.index-1)].BANNER_TYPE : bnn.PREV_TYPE}"/>
													<c:set var="nextBtnName0" value="${empty bnn.NEXT_TYPE ? bannerList[(bnnStat.index == 0 ? bnnStat.index+1 : 0)].BANNER_TYPE : bnn.NEXT_TYPE}"/>
													<c:if test="${_lang  eq 'es'}">
														<c:set var="prevBtnName0" value="${'BUSINESS' eq prevBtnName0 ? 'NEGOCIO' : 'HISTORY' eq prevBtnName0 ? 'HISTORIA' : 'BRANDING' eq prevBtnName0 ? 'VALOR' : 'PROJECT' eq prevBtnName0 ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
														<c:set var="nextBtnName0" value="${'BUSINESS' eq nextBtnName0 ? 'NEGOCIO' : 'HISTORY' eq nextBtnName0 ? 'HISTORIA' : 'BRANDING' eq nextBtnName0 ? 'VALOR' : 'PROJECT' eq nextBtnName0 ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
													</c:if>
													<span class="prev-slide" aria-hidden="true"><c:out value="${prevBtnName0}"/></span>
													<span class="next-slide" aria-hidden="true"><c:out value="${nextBtnName0}"/></span>
													<c:if test="${bnnStat.count < 2}">
														<c:set var="prevBtnName" value="${empty bnn.PREV_TYPE ? bannerList[(bnnStat.index == 0 ? fn:length(bannerList)-1 : bnnStat.index-1)].BANNER_TYPE : bnn.PREV_TYPE}"/>
														<c:set var="nextBtnName" value="${empty bnn.NEXT_TYPE ? bannerList[(bnnStat.index == 0 ? bnnStat.index+1 : 0)].BANNER_TYPE : bnn.NEXT_TYPE}"/>
														<c:if test="${_lang  eq 'es'}">
															<c:set var="prevBtnName" value="${'BUSINESS' eq prevBtnName ? 'NEGOCIO' : 'HISTORY' eq prevBtnName ? 'HISTORIA' : 'BRANDING' eq prevBtnName ? 'VALOR' : 'PROJECT' eq prevBtnName ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
															<c:set var="nextBtnName" value="${'BUSINESS' eq nextBtnName ? 'NEGOCIO' : 'HISTORY' eq nextBtnName ? 'HISTORIA' : 'BRANDING' eq nextBtnName ? 'VALOR' : 'PROJECT' eq nextBtnName ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
														</c:if>
													</c:if>
												</c:if>
											</div>
										</c:when>
										<c:otherwise>
											<div class="swiper-slide slide0${bnnStat.count}">
												<c:if test="${not empty bnn.SUB_IMG1}"><div class="slide-img" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG1}"/>')"></div></c:if>
												<c:if test="${not empty bnn.SUB_IMG2}"><div class="slide-img" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG2}"/>')"></div></c:if>
												<c:if test="${not empty bnn.SUB_IMG3}"><div class="slide-img" style="background-image:url('<c:url value="${WEB_URL }"/><c:out value="${bnn.SUB_IMG3}"/>')"></div></c:if>
												<div class="txt-wrap">
													<c:if test="${not empty bnn.WEB_TITLE1 || not empty bnn.WEB_SUB_TITLE1}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE1}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE1}" escapeXml="flase"/></p>
													</div>
													</c:if>
													<c:if test="${not empty bnn.WEB_TITLE2 || not empty bnn.WEB_SUB_TITLE2}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE2}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE2}" escapeXml="flase"/></p>
													</div>
													</c:if>
													<c:if test="${not empty bnn.WEB_TITLE3 || not empty bnn.WEB_SUB_TITLE3}">
													<div class="txt-list">
														<strong class="slide-tit"><c:out value="${bnn.WEB_TITLE3}" escapeXml="flase"/></strong>
														<p class="slide-txt"><c:out value="${bnn.WEB_SUB_TITLE3}" escapeXml="flase"/></p>
													</div>
													</c:if>
												</div>
												<!-- s: 20200903 서브텍스트 1개 추가-->
												<c:choose>
													<c:when test="${not empty bnn.WEB_URL1 && not empty bnn.LINK_BTN_NAME1}">
														<div class="btn-wrap">
															<a class="bttn-link active" href="<c:out value="${bnn.WEB_URL1}"/>">
																<span class="txt02"><c:out value="${bnn.LINK_BTN_NAME1}"/></span>
																<em class="line" aria-hidden="true"></em>
															</a>
														</div>
													</c:when>
													<c:when test="${not empty bnn.WEB_URL2 && not empty bnn.LINK_BTN_NAME2}">
														<div class="btn-wrap">
															<a class="bttn-link active" href="<c:out value="${bnn.WEB_URL2}"/>">
																<span class="txt02"><c:out value="${bnn.LINK_BTN_NAME2}"/></span>
																<em class="line" aria-hidden="true"></em>
															</a>
														</div>
													</c:when>
													<c:when test="${not empty bnn.WEB_URL3 && not empty bnn.LINK_BTN_NAME3}">
														<div class="btn-wrap">
															<a class="bttn-link active" href="<c:out value="${bnn.WEB_URL3}"/>">
																<span class="txt02"><c:out value="${bnn.LINK_BTN_NAME3}"/></span>
																<em class="line" aria-hidden="true"></em>
															</a>
														</div>
													</c:when>
												</c:choose>
												<!-- s: 20200903 서브텍스트 1개 추가-->
												<c:if test="${fn:length(bannerList) > 1 }">
													<c:set var="prevBtnName1" value="${empty bnn.PREV_TYPE ? bannerList[(bnnStat.index == 0 ? fn:length(bannerList)-1 : bnnStat.index-1)].BANNER_TYPE : bnn.PREV_TYPE}"/>
													<c:set var="nextBtnName1" value="${empty bnn.NEXT_TYPE ? bannerList[(bnnStat.index == 0 ? bnnStat.index+1 : 0)].BANNER_TYPE : bnn.NEXT_TYPE}"/>
													<c:if test="${_lang  eq 'es'}">
														<c:set var="prevBtnName1" value="${'BUSINESS' eq prevBtnName1 ? 'NEGOCIO' : 'HISTORY' eq prevBtnName1 ? 'HISTORIA' : 'BRANDING' eq prevBtnName1 ? 'VALOR' : 'PROJECT' eq prevBtnName1 ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
														<c:set var="nextBtnName1" value="${'BUSINESS' eq nextBtnName1 ? 'NEGOCIO' : 'HISTORY' eq nextBtnName1 ? 'HISTORIA' : 'BRANDING' eq nextBtnName1 ? 'VALOR' : 'PROJECT' eq nextBtnName1 ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
													</c:if>
													<span class="prev-slide" aria-hidden="true"><c:out value="${prevBtnName1}"/></span>
													<span class="next-slide" aria-hidden="true"><c:out value="${nextBtnName1}"/></span>
													<c:if test="${bnnStat.count < 2}">
														<c:set var="prevBtnName" value="${empty bnn.PREV_TYPE ? bannerList[(bnnStat.index == 0 ? fn:length(bannerList)-1 : bnnStat.index-1)].BANNER_TYPE : bnn.PREV_TYPE}"/>
														<c:set var="nextBtnName" value="${empty bnn.NEXT_TYPE ? bannerList[(bnnStat.index == 0 ? bnnStat.index+1 : 0)].BANNER_TYPE : bnn.NEXT_TYPE}"/>
														<c:if test="${_lang  eq 'es'}">
															<c:set var="prevBtnName" value="${'BUSINESS' eq prevBtnName ? 'NEGOCIO' : 'HISTORY' eq prevBtnName ? 'HISTORIA' : 'BRANDING' eq prevBtnName ? 'VALOR' : 'PROJECT' eq prevBtnName ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
															<c:set var="nextBtnName" value="${'BUSINESS' eq nextBtnName ? 'NEGOCIO' : 'HISTORY' eq nextBtnName ? 'HISTORIA' : 'BRANDING' eq nextBtnName ? 'VALOR' : 'PROJECT' eq nextBtnName ? 'PROYECTOS' : 'TRABAJE EN DOHWA'  }"/>
														</c:if>
													</c:if>
												</c:if>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<c:if test="${fn:length(bannerList) > 1 }">
							<button class="swiper-button-prev bttn-swiper" type="button"><span class="slide-name"><c:out value="${prevBtnName }"/></span></button>
							<button class="swiper-button-next bttn-swiper" type="button"><span class="slide-name"><c:out value="${nextBtnName }"/></span></button>
							</c:if>
							<!-- 20200807 slide 영역 전면 수정 start-->
						</div>
						<!-- 20200804 스크롤 수정 start-->
						<div class="noti-scroll">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<!-- 20200804 스크롤 수정 end-->
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
					<div class="main-cont-wrap">
						<div class="main-cont-box business">
							<i class="bg" aria-hidden="true"></i>
							<div class="box-inner">
								<span class="box-decs">
									<strong>01 <spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></strong>
									DOHWA ENGINEERING
								</span>
								<h2 class="box-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.001" text="BUSINESS" /></h2>
								<p class="tit-desc"><spring:message code="FRONT.COMMON.MENU.MAIN.002" text="초일류 종합엔지니어링 기업 도화의 세계를 향한 도전은 계속됩니다." /></p>
								<ul class="business-list">
									<li>
										<div class="img-area" id="list01"></div>
										<div class="txt-area">
											<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.003" text="Water Division" /></span>
											<a class="tit" href="<c:url value="/business#MARKET_001" />">
												<spring:message code="FRONT.COMMON.MENU.MAIN.004" text="물 부문" />
												<em class="ico-arr" aria-hidden="true"></em>
											</a>
											<ul class="sub-list">
												<c:forEach items="${market001}" var="code" varStatus="codeStat">
													<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/>&nbsp;</a></li>
												</c:forEach>
											</ul>
										</div>
									</li>
									<li>
										<div class="img-area" id="list02"></div>
										<div class="txt-area">
											<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.005" text="Urban Division" /></span>
											<a class="tit" href="<c:url value="/business#MARKET_002" />">
												<spring:message code="FRONT.COMMON.MENU.MAIN.006" text="도시부문" />
												<em class="ico-arr" aria-hidden="true"></em>
											</a>
											<ul class="sub-list">
												<c:forEach items="${market002}" var="code" varStatus="codeStat">
													<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/>&nbsp;</a></li>
												</c:forEach>
											</ul>
										</div>
									</li>
									<li>
										<div class="img-area" id="list03"></div>
										<div class="txt-area">
											<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.007" text="Transportation Division" /></span>
											<a class="tit" href="<c:url value="/business#MARKET_003" />">
												<spring:message code="FRONT.COMMON.MENU.MAIN.008" text="교통부문" />
												<em class="ico-arr" aria-hidden="true"></em>
											</a>
											<ul class="sub-list">
												<c:forEach items="${market003}" var="code" varStatus="codeStat">
													<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/></a></li>
												</c:forEach>
											</ul>
										</div>
									</li>
									<li>
										<div class="img-area" id="list04"></div>
										<div class="txt-area">
											<span class="tit-eng"><spring:message code="FRONT.COMMON.MENU.MAIN.009" text="Energy Division" /></span>
											<a class="tit" href="<c:url value="/business#MARKET_004" />">
												<spring:message code="FRONT.COMMON.MENU.MAIN.010" text="에너지부문" />
												<em class="ico-arr" aria-hidden="true"></em>
											</a>
											<ul class="sub-list">
												<c:forEach items="${market004}" var="code" varStatus="codeStat">
													<li><a href="#none"><c:out value="${_lang eq 'ko' ? code.koText : _lang eq 'en' ? code.enText : code.esText }"/></a></li>
												</c:forEach>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="main-cont-box project">
							<div class="box-inner">
								<span class="box-decs">
									<strong>02 <spring:message code="FRONT.COMMON.MENU.MAIN.011" text="PROJECT" /></strong>
									DOHWA ENGINEERING
								</span>
								<h2 class="box-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.011" text="PROJECT" /></h2>
								<p class="tit-desc"><spring:message code="FRONT.COMMON.MENU.MAIN.012" text="도화의 세계를 향한 도전은 계속됩니다." /></p>
								<div class="list-type-gallery">
									<c:forEach items="${projectList }" var="prj" varStatus="prjStat">
										<c:if test="${prjStat.index < 8 }">
											<c:choose>
												<c:when test="${prjStat.index == 0 || prjStat.index == 6 }">
													<div class="list-item wide-type">
														<a class="list-link" href="<c:url value="/business/project/" /><c:out value="${prj.seq }" />">
															<div class="list-img-wrap"><img src="<c:url value="${WEB_URL}" /><c:out value="${not empty prj.mainFileName1 ? prj.mainFileName1 : prj.filePath}" />" /></div>
															<p class="list-tit"><span class="line-clamp txt"><c:out value="${prj.projectMlVO.title }" /></span></p>
															<em class="bg" aria-hidden="true"></em>
														</a>
													</div>
												</c:when>
												<c:otherwise>
													<div class="list-item">
														<a class="list-link" href="<c:url value="/business/project/" /><c:out value="${prj.seq }" />">
															<div class="list-img-wrap"><img src="<c:url value="${WEB_URL}" /><c:out value="${not empty prj.mainFileName2 ? prj.mainFileName2 : prj.filePath}" />" /></div>
															<p class="list-tit"><span class="line-clamp txt"><c:out value="${prj.projectMlVO.title }" /> </span></p>
															<em class="bg" aria-hidden="true"></em>
														</a>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</div>
								<a class="bttn-more style01" href="<c:url value="/business/project"/>">
									<em class="ico-more" aria-hidden="true"></em>
									<span class="hide-txt"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span>
								</a>
							</div>
						</div>
						<div class="main-cont-box news">
							<div class="box-inner">
								<span class="box-decs">
									<strong>03 <spring:message code="FRONT.COMMON.MENU.MAIN.013" text="NEWS" /></strong>
									DOHWA ENGINEERING
								</span>
								<h2 class="box-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.013" text="NEWS" /></h2>
								<p class="tit-desc">
									<spring:message code="FRONT.COMMON.MENU.MAIN.014" text="세상을 아름답게 디자인하는 도화의 새로운 소식을 만나보세요." />
									<!-- 20200729 텍스트 수정 -->
								</p>
								<div class="news-list">
									<c:forEach items="${newsList }" var="news" varStatus="newsStat">
										<c:if test="${newsStat.index < 4 }">
											<div class="news-item">
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
												<strong class="list-tit"><c:out value="${news.title }"></c:out></strong>
												<c:if test="${not empty news.url }">
													<a class="bttn-link-bd" href="<c:out value="${news.url }" />" target="_blank"><spring:message code="FRONT.COMMON.MENU.MAIN.015" text="언론사 바로가기" /></a>
												</c:if>
												<c:if test="${empty news.url }">
													<a class="bttn-link-bd" href="/prroom/news/<c:out value="${news.seq }" />"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.014" text="자세히 보기" /></a>
												</c:if>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<a class="bttn-more style01"  href="<c:url value="/prroom/news"/>">
									<em class="ico-more" aria-hidden="true"></em>
									<span class="hide-txt"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span>
								</a>
							</div>
						</div>
						<div class="main-cont-box carrer">
							<div class="box-inner">
								<span class="box-decs">
									<strong>04 <spring:message code="FRONT.COMMON.MENU.MAIN.016" text="CAREER" /></strong>
									DOHWA ENGINEERING
								</span>
								<h2 class="box-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.016" text="CAREER" /></h2>
								<p class="tit-desc">
									<spring:message code="FRONT.COMMON.MENU.MAIN.017" text="열정과 패기가 넘치는 창의적인 인재를 환영합니다." />
								</p>
								<div class="txt-box">
									<spring:message code='FRONT.COMMON.MENU.MAIN.018' text='<div class="txt-box">
									        <p class="txt">
									                <span class="txt01">
									                        사람이 최우선이라는
									                        <span class="txt-green">‘인간 중심의 사고’</span>
									                        는 60년 동안
									                </span>
									        </p>
									        <p class="txt"><span class="txt01">정도 경영을 하게 한 힘이었으며, 진취적인 행동과</span></p>
									        <p class="txt">
									                <span class="txt01">
									                        <span class="txt-blue">‘창의적인 사고’</span>
									                        는 미래를 개척해 나가는 원동력입니다.
									                </span>
									        </p>
									        <p class="txt">
									                <span class="txt01">
									                        <span class="txt-orange">‘도화인의 화합’</span>
									                        을 통해 글로벌 종합 엔지니어링 회사로 도약하겠습니다.
									                </span>
									        </p>
									</div>' />
									
								</div>
								<div class="btn-wrap">
									<a class="bttn type01 style01" href="<c:url value="/recruit/procedure" />">
										<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.019" text="채용안내 바로가기" /></span>
										<em class="ico01" aria-hidden="true"></em>
									</a>
									<c:choose>
										<c:when test="${'ko' eq _lang}">
											<a class="bttn type01 style01" href="<c:url value="https://dohwa.recruiter.co.kr/appsite/company/index"/>" target="_blank">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
										</c:when>
										<c:when test="${'en' eq _lang}">
											<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwwiYlD3VrB_sNYaH2iqR3PPY-dvXzR5b6aIVUj9udEwdTXXF9_Ele1K_n10Gnc8y8TPA/exec"/>" target="_blank">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
										</c:when>
										<c:otherwise>
											<a class="bttn type01 style01" href="<c:url value="https://script.google.com/macros/s/AKfycbwFFqqueySvUYaw5c6h7Uyy5dOfRBYwet4NLrOmaLcdEhE2JRw_z7vuI0J0rDgxSreYqg/exec"/>" target="_blank">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
										</c:otherwise>
									</c:choose>
									
									<!-- 
									<a class="bttn type01 style01" href="<c:url value="http://recruiter.dohwa.co.kr" />" target="_blank">
										<span class="txt01"><spring:message code="FRONT.COMMON.MENU.MAIN.020" text="채용사이트 바로가기" /></span>
										<em class="ico01" aria-hidden="true"></em>
									</a>
									 -->
								</div>
							</div>
						</div>
						<div class="main-cont-box company">
							<div class="box-inner">
								<h2 class="box-tit"><spring:message code="FRONT.COMMON.MENU.MAIN.021" text="지속가능경영" /></h2>
								<p class="tit-desc"><spring:message code="FRONT.COMMON.MENU.MAIN.022" text="고객과 파트너 모두에게 최고의 기술과 품질을 바탕으로 정성을 다하는 기업이 되겠습니다" /></p>
								<div class="box-btm">
									<div class="box-btm-inner">
										<strong><spring:message code="FRONT.COMMON.MENU.MAIN.023" text="나눔경영" /></strong>
										<a class="bttn-link-bd" href="<c:url value="/aboutus/csr_01"/>">
											<span><spring:message code="FRONT.COMMON.MENU.MAIN.024" text="나눔경영 바로가기" /></span>
											<em class="ico-arr" aria-hidden="true"></em>
										</a>
									</div>
									<div class="box-btm-inner">
										<strong><spring:message code="FRONT.COMMON.MENU.MAIN.025" text="안전/품질경영" /></strong>
										<a class="bttn-link-bd" href="<c:url value="/aboutus/csr_02"/>">
											<span><spring:message code="FRONT.COMMON.MENU.MAIN.026" text="안전/품질경영 바로가기" /></span>
											<em class="ico-arr" aria-hidden="true"></em>
										</a>
									</div>
									<div class="box-btm-inner">
										<strong><spring:message code="FRONT.COMMON.MENU.MAIN.027" text="윤리준법경영" /></strong>
										<a class="bttn-link-bd" href="<c:url value="/aboutus/csr_03"/>">
											<span><spring:message code="FRONT.COMMON.MENU.MAIN.028" text="윤리준법경영 바로가기" /></span>
											<em class="ico-arr" aria-hidden="true"></em>
										</a>
									</div>
								</div>
							</div>
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
									<div class="grid-line" aria-hidden="true"></div>
								</div>
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
						</div>
					</div>
				</div>
			</div>
			<%--//컨텐츠 영역 종료 --%>
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<div class="dimm"></div>
		<script src="/inc/js/jquery.js"></script>
		<script src="/inc/js/jquery.mousewheel.min.js"></script>
		<script src="/inc/js/ScrollMagic.min.js"></script>
		<script src="/inc/js/TweenMax.min.js"></script>
		<script src="/inc/js/animation.gsap.js"></script>
		<script src="/inc/js/swiper.min.js"></script>
		<script src="/inc/js/ComponentUI.js"></script>
		<script src="/inc/js/lottie.js"></script>
		<script src="/inc/js/jquery.scrollbar.min.js"></script>
		<script src="/inc/js/countUp.min.js"></script>
		<script src="/inc/js/common.js"></script>
		<script src="/inc/js/main.js" type="text/javascript" charset="utf-8"></script>
		<%@ include file="/WEB-INF/views/front/layout/common_utils_js.jsp" %> <!-- 추후 js 파일로 import할 예정 -->
		<script>
			//var component = new ComponentUI();
			//component.modalPopUp(".lypopup-wrap");
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		
		var PopupTop = parseInt($('.lypopup-wrap').css('top'));
		var PopupLeft = parseInt($('.lypopup-wrap').css('left'));
		var modalTop = 0;
		var modalLeft = 0;
		
		$(function() {
			$(document).ready(function(){
				$('.lypopup-wrap').each(function(){
					
					
					// 오늘 하루 열지 않기
					var $lypopup = $(this);
					
					if(modalTop > 0){
						modalTop = PopupTop+30;
						modalLeft = PopupLeft+50;	
					}else{
						modalTop = PopupTop;
						modalLeft = PopupLeft;
					}
					
					$(this).css({ 'top': modalTop, 'left': modalLeft });
					
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
																	
					$lypopup.find('.btn-close').on('click', function(e){
						$lypopup.hide();
					});
					
					$lypopup.find('.layer-close').on('click', function(e){
						$lypopup.hide();
					});
				});

			});

		});
		</script>
	</body>
</html>