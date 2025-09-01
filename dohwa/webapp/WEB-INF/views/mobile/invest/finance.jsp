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
		<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
		<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/dataviz.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/material.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/kelly.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/dark.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/frozen.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/moonrisekingdom.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/spiritedaway.js?ver=20200717-eac'></script>
		<script type='text/javascript' src='//cdn.amcharts.com/lib/4/themes/animated.js?ver=20200717-eac'></script>
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
		<div class="invest" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual visual-area invest01">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" /></h2>
							<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></em> --%>
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
						<div class="tab-menu-type01 center">
							<ul class="tab-list">
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}invest/finance" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/eAnno" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/ir" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/stock" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
							</ul>
						</div>
					</div>
					<div class="tab-menu-type02">
						<ul class="tab-list tab-list-3depth">
							<li class="active">
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001.001" text="주요경영실적" /></span></a>
							</li>
							<li>
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001.002" text="요약재무재표" /></span></a>
							</li>
							<li>
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001.003" text="신용등급" /></span></a>
							</li>
						</ul>
					</div>
					<div class="contents">
						<div class="section-cont">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.004" text="수주 및 수주잔고" /></h3>
							<div class="chart-box">
								<div class="tit-area">
									<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.005" text="신규수주" /></strong>
									<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
								</div>
								<div class="chart-area"><div id="chartNewOrdrAmt" style="width:100%; height:100%; min-height: 255px"></div></div>
							</div>
							<div class="chart-box">
								<div class="tit-area">
									<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.006" text="수주잔고" /></strong>
									<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
								</div>
								<div class="chart-area"><div id="chartOrdrBcklAmt" style="width:100%; height:100%; min-height: 255px"></div></div>
							</div>
						</div>
						<div class="section-cont">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.001" text="매출 및 영업이익" />
								<span class="title-sub">(<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.024" text="연결재무제표 기준" />)</span>
							</h3>
							<div class="chart-box">
								<div class="tit-area">
									<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.002" text="매출액" /></strong>
									<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
								</div>
								<div class="chart-area"><div id="chartSalesAmt" style="width:100%; height:100%; min-height: 255px"></div></div>
							</div>
							<div class="chart-box">
								<div class="tit-area">
									<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.003" text="영업이익" /></strong>
									<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
								</div>
								<div class="chart-area"><div id="chartOprtIncmAmt" style="width:100%; height:100%; min-height: 255px"></div></div>
							</div>
						</div>
					</div>
					<div class="contents full-type type01">
						<div class="financial-summary">
							<div class="summary-inner">
								<h3 class="title-sect">
									<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.001" text="{0}년 요약 재무제표" arguments="${lastVO.yyyy}"/>
									<span class="title-sub type02">(<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.024" text="연결재무제표 기준" />)</span>
								</h3>
								<ul class="financial-summary-item clfix">
									<li class="rnd-wh">
										<span class="inner">
											<em class="financial-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.002" text="자산" /></em>
											<spring:message code="FRONT.COMMON.CURRENCY.05" text="KRW" />
											<strong class="financial-cont"><span class="num" id="assets"><c:set var="assets" value="${lastVO.totAsstAmt}"/></span></strong>
											<em class="unit"><spring:message code="FRONT.COMMON.CURRENCY.03" text="억" /></em>
										</span>
									</li>
									<li class="rnd-wh">
										<span class="inner">
											<em class="financial-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.003" text="부채" /></em>
											<spring:message code="FRONT.COMMON.CURRENCY.05" text="KRW" />
											<strong class="financial-cont"><span class="num" id="liabilities"><c:set var="liabilities" value="${lastVO.totLbltAmt}"/></span></strong>
											<em class="unit"><spring:message code="FRONT.COMMON.CURRENCY.03" text="억" /></em>
										</span>
									</li>
									<li class="rnd-bl">
										<span class="inner">
											<em class="financial-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.004" text="자기자본"/></em>
											<spring:message code="FRONT.COMMON.CURRENCY.05" text="KRW" />
											<strong class="financial-cont"><span class="num" id="capital"><c:set var="capital" value="${lastVO.totCptlAmt }"/></span></strong>
											<em class="unit"><spring:message code="FRONT.COMMON.CURRENCY.03" text="억" /></em>
										</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="content-inner">
							<div class="section-cont">
								<h3 class="title-sect">
									<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.012" text="재무상태표"/>
									<span class="title-sub">(<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.024" text="연결재무제표 기준" />)</span>
								</h3>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.013" text="자산총계"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary4" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.014" text="부채총계"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary5" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.015" text="자본총계"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary6" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="table-box">
									<p class="table-desc-txt"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></p>
									<div class="table-wrap-type01">
										<table class="table-col-type01">
											<caption>
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.012" text="재무상태표"/></span>
												<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></span>
												<span class="txt03">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></span>
												<span class="txt04">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></span>
												<span class="txt05">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></span>
											</caption>
											<colgroup>
												<col style="width:29.1%" />
												<col />
												<col />
												<col />
											</colgroup>
											<thead>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></th>
													<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></th>
													<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></th>
													<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.015" text="자본총계"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.totCptlAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.totCptlAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.totCptlAmt }" pattern="#,###" /></td>
												</tr>
											</tfoot>
											<tbody>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.016" text="유동자산"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.currAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.currAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.currAsstAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.017" text="비유동자산"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.nonCurrAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.nonCurrAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.nonCurrAsstAmt }" pattern="#,###" /></td>
												</tr>
												<tr class="total-cell">
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.013" text="자산총계"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.totAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.totAsstAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.totAsstAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.018" text="유동부채"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.currLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.currLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.currLbltAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.019" text="비유동부채"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.nonCurrLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.nonCurrLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.nonCurrLbltAmt }" pattern="#,###" /></td>
												</tr>
												<tr class="total-cell">
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.014" text="부채총계"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.totLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.totLbltAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.totLbltAmt }" pattern="#,###" /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="section-cont">
								<h3 class="title-sect">
									<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.005" text="손익계산서"/>
									<span class="title-sub">(<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.024" text="연결재무제표 기준" />)</span>
								</h3>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.008" text="영업수익"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary1" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.003" text="영업이익" /></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary2" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.007" text="당기순이익"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></span>
									</div>
									<div class="chart-area">
										<div id="chartSummary3" style="width:100%; height:100%; min-height: 255px"></div>
									</div>
								</div>
								<div class="table-box">
									<p class="table-desc-txt"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message code="FRONT.COMMON.CURRENCY.02" text="억원" /></p>
									<div class="table-wrap-type01">
										<em class="table-scroll-hint active"></em>
										<table class="table-col-type01">
											<caption>
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.008" text="손익계산서" /></span>
												<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></span>
												<span class="txt03">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></span>
												<span class="txt04">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></span>
												<span class="txt05">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></span>
											</caption>
											<colgroup>
												<col style="width:44.5vw" />
												<col style="width:21.6vw" />
												<col style="width:21.6vw" />
												<col style="width:21.6vw" />
											</colgroup>
											<thead>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></th>
													<th class="right"><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></th>
													<th class="right"><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></th>
													<th class="right"><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.007" text="당기순이익"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.netIncmAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.netIncmAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.netIncmAmt }" pattern="#,###" /></td>
												</tr>
											</tfoot>
											<tbody>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.008" text="영업수익"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.oprtRvnsAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.oprtRvnsAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.oprtRvnsAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.010" text="영업비용"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.oprtAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.oprtAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.oprtAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.001.003" text="영업이익" /></td>
													<td class="right"><fmt:formatNumber value="${firstVO.oprtIncmAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.oprtIncmAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.oprtIncmAmt }" pattern="#,###" /></td>
												</tr>
												<tr>
													<td><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.011" text="법인세비용 차감전순이익"/></td>
													<td class="right"><fmt:formatNumber value="${firstVO.incmBftxExpnAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${secondVO.incmBftxExpnAmt }" pattern="#,###" /></td>
													<td class="right"><fmt:formatNumber value="${lastVO.incmBftxExpnAmt }" pattern="#,###" /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="section-cont">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.020" text="주요지표"/></h3>
								<div class="chart-box">
									<div class="tit-area">
										<strong class="chart-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.021" text="수익성지표"/></strong>
										<span class="chart-unit"><spring:message code="FRONT.COMMON.UNIT" text="단위" /> : %</span>
									</div>
									<div class="chart-area">
										<div id="chartSummary7" style="width:100%; height:100%; min-height: 333px"></div>
									</div>
								</div>
								<div class="table-wrap-type01">
									<em class="table-scroll-hint active"></em>
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.020" text="주요지표"/></span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></span>
											<span class="txt05">,<spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></span>
										</caption>
										<colgroup>
											<col style="width:13.1vw" />
											<col style="width:21.6vw" />
											<col style="width:21.6vw" />
											<col style="width:21.6vw" />
											<col style="width:21.6vw" />
										</colgroup>
										<thead>
											<tr>
												<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.009" text="구분"/></th>
												<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${firstVO.yyyy}"/></th>
												<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${secondVO.yyyy}"/></th>
												<th><spring:message code="FRONT.COMMON.YEAR.03" text="{0}년" arguments="${lastVO.yyyy}"/></th>
											</tr>
										</thead>
											<tbody>
												<tr>
													<td rowspan="4">
														<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.022" text="수익성"/>
													</td>
													<td>ROE</td>
													<c:choose>
														<c:when test="${firstVO.roe == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${firstVO.roe}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${secondVO.roe == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${secondVO.roe}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${lastVO.roe == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${lastVO.roe}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
												</tr>
											
												<tr>
													<td>PER</td>
													<c:choose>
														<c:when test="${firstVO.per == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${firstVO.per}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${secondVO.per == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${secondVO.per}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${lastVO.per == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${lastVO.per}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
												</tr>
											
												<tr>
													<td>PBR</td>
													<c:choose>
														<c:when test="${firstVO.pbr == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${firstVO.pbr}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${secondVO.pbr == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${secondVO.pbr}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${lastVO.pbr == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${lastVO.pbr}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
												</tr>
										
												<tr class="table-role-sum">
													<th><spring:message code="FRONT.COMMON.MENU.INVEST.001.002.023" text="영업이익률"/></th>
													<c:choose>
														<c:when test="${firstVO.oprtMrgn == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${firstVO.oprtMrgn}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${secondVO.oprtMrgn == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${secondVO.oprtMrgn}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${lastVO.oprtMrgn == 0}"><td>-</td></c:when>
														<c:otherwise><td><fmt:formatNumber value="${lastVO.oprtMrgn}" pattern="0.00#" /></td></c:otherwise>
													</c:choose>
												</tr>
											</tbody>
										<!--  
										<tbody>
											<tr>
												<td rowspan="4">
													<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.022.MOB" text="수<br />익<br />성"/>
												</td>
												<td>ROE</td>
												<td><fmt:formatNumber value="${firstVO.roe }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${secondVO.roe }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${lastVO.roe }" pattern="0.00#" /></td>
											</tr>
											<tr>
												<td>PER</td>
												<td><fmt:formatNumber value="${firstVO.per }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${secondVO.per }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${lastVO.per }" pattern="0.00#" /></td>
											</tr>
											<tr>
												<td>PBR</td>
												<td><fmt:formatNumber value="${firstVO.pbr }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${secondVO.pbr }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${lastVO.pbr }" pattern="0.00#" /></td>
											</tr>
											<tr class="table-role-sum">
												<th>
													<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.023.MOB" text="영업<br />이익률"/>
												</th>
												<td><fmt:formatNumber value="${firstVO.oprtMrgn }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${secondVO.oprtMrgn }" pattern="0.00#" /></td>
												<td><fmt:formatNumber value="${lastVO.oprtMrgn }" pattern="0.00#" /></td>
											</tr>
										</tbody>
										-->
									</table>
								</div>
							</div>
						</div>
					</div>
					<%--신용등급정보 --%>
					<c:import url="./inc/inc_credit_${_lang}.jsp"/>	<%--신용등급정보는 매년 html 자체를 수정해야 하는 화면이므로 메시지 프로퍼티로 빼지 않고 include jsp 형태로 작업함 --%>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<%--// 퍼블파트에서 작성한 JS  --%>
		<script>
			var component = new ComponentUI();
			component.tabContent(".tab-list-3depth", ".contents", function() {
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

				new CountUp("assets", 0, ${assets} /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
				new CountUp("liabilities", 0, ${liabilities} /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
				new CountUp("capital", 0, ${capital} /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
			});

			$(window).on("scroll", function() {
				var winTop = $(window).scrollTop();

				if (winTop > 0) {
					$(".header_content").addClass("on");
				} else {
					$(".header_content").removeClass("on");
				}
			});

			$(".tab-list .item").on("click", function() {
				setTimeout(function() {
					contentsGridFunction.reset();
				}, 0);
			});
		</script>
		<%--// 주요 차트 데이터 생성.  --%>
		<script type="text/javascript">
			var arrSalesAmt = [];
			var arrOprtIncmAmt = [];
			var arrNewOrdrAmt = [];
			var arrOrdrBcklAmt = [];
			<c:if test="${not empty listJson}">
			var listJson = <c:out value="${listJson}" escapeXml="false"/>;
			</c:if>
			<c:if test="${empty listJson}">
			var listJson = [];
			</c:if>
			if(listJson && listJson.length && listJson.length > 0){
				// 역순으로 정렬
				listJson.sort(function(a,b){
					return StringUtils.stringToNumber(a.yyyy) - StringUtils.stringToNumber(b.yyyy);
				});
				listJson.forEach(function(o, i){
					arrSalesAmt.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.salesAmt)});
					arrOprtIncmAmt.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.oprtIncmAmt)});
					arrNewOrdrAmt.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.newOrdrAmt)});
					arrOrdrBcklAmt.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.ordrBcklAmt)});
				});
			}
		</script>

		<%--// 요약 차트 데이터 생성.  --%>
		<script type="text/javascript">
			var arrSummary1 = [];
			var arrSummary2 = [];
			var arrSummary3 = [];
			var arrSummary4 = [];
			var arrSummary5 = [];
			var arrSummary6 = [];
			var arrSummary7 = [];

			<c:if test="${not empty summaryListJson}">
			var summaryListJson = <c:out value="${summaryListJson}" escapeXml="false"/>;
			</c:if>
			<c:if test="${empty summaryListJson}">
			var summaryListJson = [];
			</c:if>
			if(summaryListJson && summaryListJson.length && summaryListJson.length > 0){
				//linechart datasets
				// 역순으로 정렬
				summaryListJson.sort(function(a,b){
					return StringUtils.stringToNumber(a.yyyy) - StringUtils.stringToNumber(b.yyyy);
				});
				summaryListJson.forEach(function(o, i){
					arrSummary1.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.oprtRvnsAmt)});
					arrSummary2.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.oprtIncmAmt)});
					arrSummary3.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.netIncmAmt)});
					arrSummary4.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.totAsstAmt)});
					arrSummary5.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.totLbltAmt)});
					arrSummary6.push({"year" : StringUtils.nvl(o.yyyy), "value" : StringUtils.stringToNumber(o.totCptlAmt)});
					arrSummary7.push({"year": StringUtils.nvl(o.yyyy), "ROE": StringUtils.stringToNumber(o.roe), "PER": StringUtils.stringToNumber(o.per), "PBR": StringUtils.stringToNumber(o.pbr), "<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.023" text="영업이익률"/>": StringUtils.stringToNumber(o.oprtMrgn)});
				});
			}
		</script>

		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				//주요 경영실적 차트 생성
				AmChartUtils.createBarChart("chartSalesAmt", arrSalesAmt);
				AmChartUtils.createBarChart("chartOprtIncmAmt", arrOprtIncmAmt);
				AmChartUtils.createBarChart("chartNewOrdrAmt", arrNewOrdrAmt);
				AmChartUtils.createBarChart("chartOrdrBcklAmt", arrOrdrBcklAmt);

				// 요약 재무제표 차트 생성
				AmChartUtils.createBarChart("chartSummary1", arrSummary1);
				AmChartUtils.createBarChart("chartSummary2", arrSummary2);
				AmChartUtils.createBarChart("chartSummary3", arrSummary3);
				AmChartUtils.createBarChart("chartSummary4", arrSummary4);
				AmChartUtils.createBarChart("chartSummary5", arrSummary5);
				AmChartUtils.createBarChart("chartSummary6", arrSummary6);
				AmChartUtils.createLineChart("chartSummary7", arrSummary7, [{"val":"ROE", "cate":"year"},{"val":"PER", "cate":"year"},{"val":"PBR", "cate":"year"},{"val":"<spring:message code="FRONT.COMMON.MENU.INVEST.001.002.023" text="영업이익률"/>", "cate":"year"}]);

			});
		});
		</script>
	</body>
</html>