<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<%@ include file="/WEB-INF/views/mobile/layout/head.jsp"%>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/dataviz.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/material.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/kelly.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/dark.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/frozen.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/moonrisekingdom.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/spiritedaway.js?ver=20200717-eac'></script>
<script type='text/javascript'
	src='//cdn.amcharts.com/lib/4/themes/animated.js?ver=20200717-eac'></script>
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
		<%@ include file="/WEB-INF/views/mobile/layout/header.jsp"%>
		<!-- 본 컨텐츠 시작 입니다 -->
		<div id="container">
			<div id="content" role="main">
				<div class="page-visual invest01 visual-area">
					<div class="page-title-sec">
						<span class="title-main-sub"><spring:message
								code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
						<h2 class="title-main">
							<spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" />
						</h2>
						<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></em> --%>
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
						<!--s: 20200903 depth 메뉴명 변경-->
						<ul class="tab-list">
							<li><a class="item"
								href="<c:url value="${mobileStartPath}invest/finance" />"
								data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
							<li><a class="item"
								href="<c:url value="${mobileStartPath}invest/eAnno" />"
								data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
							<li><a class="item"
								href="<c:url value="${mobileStartPath}invest/ir" />" data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
							<li class="active"><a class="item"
								href="<c:url value="${mobileStartPath}invest/stock" />"
								data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
						</ul>
						<!--e: 20200903 depth 메뉴명 변경-->
					</div>
				</div>
				<!-- s: 20200903 depth3 탭 추가-->
				<div class="tab-menu-type02">
					<ul class="tab-list tab-list-3depth">
						<li class="active"><a class="item" href="#none"><span
								class="txt" data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.004.002" text="주주구성" /></span></a></li>
						<li><a class="item" href="#none"><span class="txt"
								data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.004.004" text="주주총회" /></span></a></li>
						<li><a class="item" href="#none"><span class="txt"
								data-id=""><spring:message
										code="FRONT.COMMON.MENU.INVEST.004.003" text="배당현황" /></span></a></li>
					</ul>
				</div>
				<!-- e: 20200903 depth3 탭 추가-->
				<div class="contents">
					<div class="section-cont">
						<h3 class="title-sect sp-type02">
							<spring:message code="FRONT.COMMON.MENU.INVEST.004.002"
								text="주주구성" />
						</h3>
						<div class="shareholder-info-wrap">
							<p class="shareholder-desc-txt">
								<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.001"
									text="기준" />
								:
								<c:out value="${baseDate1}" />
							</p>
							<div class="shareholder-info-box">
								<div class="inner-box">
									<span class="shareholder_tit"><spring:message
											code="FRONT.COMMON.MENU.INVEST.004.001.002.MOB" text="발행주식총수" /></span>
									<strong class="shareholder_cont"> <span
										class="color-point-03">33,720,000</span> <em class="unit"><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.001.003" text="주" /></em>
									</strong>
								</div>
								<div class="inner-box">
									<span class="shareholder_tit"><spring:message
											code="FRONT.COMMON.MENU.INVEST.004.001.004.MOB"
											text="발행주식액면총액" /></span> <strong class="shareholder_cont">
										<span class="color-point-03">16,860</span> <em class="unit"><spring:message
												code="FRONT.COMMON.CURRENCY.04" text="백 만원" /></em>
									</strong>
								</div>
							</div>
						</div>
					</div>
					<div class="section-cont">
						<div class="chart-box">
							<h3 class="title-sect sp-type02">
								<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.005"
									text="주식분포 현황" />
							</h3>
							<p class="chart-desc-txt">
								<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.001"
									text="기준" />
								:
								<c:out value="${shcp.stdDate }" />
							</p>
							<div class="chart-area">
								<div id="chartdiv" style="width: 100%; min-height: 550px;"></div>
							</div>
						</div>
					</div>
					<div class="section-cont">
						<div class="table-box">
							<h3 class="title-sect sp-type02">
								<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.006"
									text="주식소유현황" />
							</h3>
							<p class="table-desc-txt">
								<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.001"
									text="기준" />
								:
								<c:out value="${shcp.stdDate }" />
							</p>
							<div class="table-wrap-type01">
								<table class="table-col-type01">
									<caption>
										<span class="txt01"><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.001.006" text="주식소유현황" /></span>
										<span class="txt02">:<spring:message
												code="FRONT.COMMON.MENU.INVEST.004.001.007" text="성명" /></span> <span
											class="txt03">,<spring:message
												code="FRONT.COMMON.MENU.INVEST.004.001.008" text="소유주식수" /></span>
										<span class="txt04">,<spring:message
												code="FRONT.COMMON.MENU.INVEST.004.001.009" text="지분율" /></span>
									</caption>
									<colgroup>
										<col style="width: 33.33%" />
										<col style="width: 33.33%" />
										<col />
									</colgroup>
									<thead>
										<tr>
											<th><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.001.007" text="성명" /></th>
											<th><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.001.008" text="소유주식수" /></th>
											<th><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.001.009" text="지분율" /></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty shcp.stockOwnerList}">
											<c:forEach items="${shcp.stockOwnerList }" var="owner">
												<tr>
													<td><c:out value="${owner.name }" /></td>
													<td><fmt:formatNumber value="${owner.showCnt }"
															pattern="#,###" /></td>
													<td><fmt:formatNumber value="${owner.showRatio }"
															pattern="#,###.00" />%</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="contents">
					<div class="section-cont">
						<div class="menu-selectbox">
							<span class="selectbox"> <select title="">
									<c:forEach items="${shmtList}" var="shmt" varStatus="stat">
										<option value="<c:out value="${stat.index }"/>"
											<c:if test="${stat.first }">selected="selected"</c:if>><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.002.001" text="제 {0}기"
												arguments="${shmt.title }" /></option>
									</c:forEach>
							</select>
							</span>
						</div>
						<c:forEach items="${shmtList}" var="shmt" varStatus="stat">
							<div
								class="inner-tab-cont <c:if test="${stat.first }">active</c:if>">
								<h3 class="title-sect">
									<spring:message code="FRONT.COMMON.MENU.INVEST.004.002.002"
										text="제 {0}기 주주총회" arguments="${shmt.title }" />
								</h3>
								<div class="list-type-dot">
									<ul>
										<li><strong class="list-tit"><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.004" text="주주총회 일시" />
												:</strong> <span class="list-txt"><c:out
													value="${shmt.meetDate }" /></span></li>
										<li><strong class="list-tit"><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.005" text="주주총회 장소" />
												:</strong> <span class="list-txt"><c:out
													value="${shmt.meetPlace }" /></span></li>
									</ul>
								</div>
								<div class="table-wrap-type01">
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.002"
													text="제 {0}기 주주총회" /></span> <span class="txt02">:<spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.006" text="의안내용" /></span>
											<span class="txt03">,<spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.007" text="결의내용" /></span>
										</caption>
										<colgroup>
											<col style="width: 71.9%" />
											<col />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message
														code="FRONT.COMMON.MENU.INVEST.004.002.006" text="의안내용" /></th>
												<th><spring:message
														code="FRONT.COMMON.MENU.INVEST.004.002.007" text="결의내용" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${shmt.stockMeetList}" var="meet"
												varStatus="statb">
												<tr class="left">
													<td><c:out value="${meet.agnd }" /></td>
													<td><c:out value="${meet.rslt }" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="table-btn-wrap">
										<button class="bttn type01 style01" type="button"
											title="자료 다운로드"
											onclick="CommonUtils.downloadByFileId('<c:out value="${shmt.fileId }"/>', true);">
											<span class="txt01"><spring:message
													code="FRONT.COMMON.MENU.INVEST.004.002.003"
													text="제 {0}기 주주총회 자료 다운로드" arguments="${shmt.title }" /></span> <em
												class="ico download" aria-hidden="true"></em>
										</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="contents">
					<div class="section-cont">
						<h3 class="title-sect">
							<spring:message code="FRONT.COMMON.MENU.INVEST.004.003.001"
								text="배당금 정보" />
						</h3>
						<div class="chart-box">
							<div class="tit-area">
								<strong class="chart-tit"><spring:message
										code="FRONT.COMMON.MENU.INVEST.004.003.002" text="주당순이익" /></strong> <span
									class="chart-unit"><spring:message
										code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message
										code="FRONT.COMMON.CURRENCY.01" text="원" /></span>
							</div>
							<div class="chart-area">
								<div id="chartNtpsAmt" style="width: 100%; height: 235px;"></div>
							</div>
						</div>
						<div class="chart-box">
							<div class="tit-area">
								<strong class="chart-tit"><spring:message
										code="FRONT.COMMON.MENU.INVEST.004.003.003" text="주당현금배당액" /></strong>
								<span class="chart-unit"><spring:message
										code="FRONT.COMMON.UNIT" text="단위" /> : <spring:message
										code="FRONT.COMMON.CURRENCY.01" text="원" /></span>
							</div>
							<div class="chart-area">
								<div id="chartCdpsAmt" style="width: 100%; height: 235px;"></div>
							</div>
						</div>
						<div class="table-wrap-type01">
							<table class="table-col-type01">
								<caption>
									<span class="txt01"><spring:message
											code="FRONT.COMMON.MENU.INVEST.004.003.001" text="배당금 정보" /></span>
									<span class="txt02">:<spring:message
											code="FRONT.COMMON.MENU.INVEST.004.003.004" text="구분" /></span> <span
										class="txt03">,<spring:message
											code="FRONT.COMMON.YEAR.02" text="{0}년" /></span> <span
										class="txt04">,<spring:message
											code="FRONT.COMMON.YEAR.02" text="{0}년" /></span> <span
										class="txt04">,<spring:message
											code="FRONT.COMMON.YEAR.02" text="{0}년" /></span>
								</caption>
								<colgroup>
									<col style="width: 31%" />
									<c:choose>
										<c:when test="${dvstCnt == 3 }">
											<col />
											<col />
										</c:when>
										<c:when test="${dvstCnt == 2 }">
											<col />
										</c:when>
									</c:choose>
									<col />
								</colgroup>
								<thead>
									<tr>
										<th><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.004" text="구분" /></th>
										<c:if test="${not empty firstDvst}">
											<th><spring:message code="FRONT.COMMON.YEAR.02"
													text="{0}년" arguments="${firstDvst.yyyy }" /></th>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<th><spring:message code="FRONT.COMMON.YEAR.02"
													text="{0}년" arguments="${secondDvst.yyyy }" /></th>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<th><spring:message code="FRONT.COMMON.YEAR.02"
													text="{0}년" arguments="${lastDvst.yyyy }" /></th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.005" text="주당액면가액" />(<spring:message
												code="FRONT.COMMON.CURRENCY.01" text="원" />)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.pvpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.pvpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.pvpsAmt }" /></td>
										</c:if>
									</tr>
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.006" text="당기순이익" />
											(<spring:message code="FRONT.COMMON.CURRENCY.04" text="백만원" />)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.nticAmt }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.nticAmt }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.nticAmt }" /></td>
										</c:if>
									</tr>
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.002" text="주당순이익" />
											(<spring:message code="FRONT.COMMON.CURRENCY.01" text="원" />)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.ntpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.ntpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.ntpsAmt }" /></td>
										</c:if>
									</tr>
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.007" text="현금배당금총액" />
											(<spring:message code="FRONT.COMMON.CURRENCY.04" text="백만원" />)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.tcdvAmt }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.tcdvAmt }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.tcdvAmt }" /></td>
										</c:if>
									</tr>
									<!-- 
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.008" text="현금배당성향" />
											(%)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.cdpoRatio }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.cdpoRatio }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.cdpoRatio }" /></td>
										</c:if>
									</tr>
									 -->
									 <tr>
										<td><spring:message code="FRONT.COMMON.MENU.INVEST.004.003.008" text="현금배당성향" /> (%)</td>
									
										<c:if test="${not empty firstDvst}">
											<td>
												<c:choose>
													<c:when test="${empty firstDvst.cdpoRatio or firstDvst.cdpoRatio == 0.0}">
														-
													</c:when>
													<c:otherwise>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${firstDvst.cdpoRatio}" />
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
									
										<c:if test="${not empty secondDvst}">
											<td>
												<c:choose>
													<c:when test="${empty secondDvst.cdpoRatio or secondDvst.cdpoRatio == 0.0}">
														-
													</c:when>
													<c:otherwise>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${secondDvst.cdpoRatio}" />
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
									
										<c:if test="${not empty lastDvst}">
											<td>
												<c:choose>
													<c:when test="${empty lastDvst.cdpoRatio or lastDvst.cdpoRatio == 0.0}">
														-
													</c:when>
													<c:otherwise>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${lastDvst.cdpoRatio}" />
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
									</tr>
									 
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.009" text="현금배당수익률" />
											(%)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.cdpoRate }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.cdpoRate }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.cdpoRate }" /></td>
										</c:if>
									</tr>
									<tr>
										<td><spring:message
												code="FRONT.COMMON.MENU.INVEST.004.003.010" text="주당 현금배당금" />
											(<spring:message code="FRONT.COMMON.CURRENCY.01" text="원" />)</td>
										<c:if test="${not empty firstDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${firstDvst.cdpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty secondDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${secondDvst.cdpsAmt }" /></td>
										</c:if>
										<c:if test="${not empty lastDvst}">
											<td class="right"><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${lastDvst.cdpsAmt }" /></td>
										</c:if>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 본 컨텐츠 끝 -->
		<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp"%>
	<%--// 퍼블파트에서 작성한 JS  --%>
	<script>
			var component = new ComponentUI();
			component.tabContent(".tab-list-3depth", ".contents");

			$(".tab-list .item").on("click", function() {
				setTimeout(function() {
					contentsGridFunction.reset();
				}, 0);
			});

			var changeSelectCnt = (function() {
				var el, list, cnt;

				(function init() {
					el = $(".section-cont");
					selectBox = el.find("select");
					cnt = el.find(".inner-tab-cont");

					setSelectIndex();

					selectBox.on("change", function() {
						var _actvieIndex = getSelectIndex();

						cnt.css("display", "none");
						cnt.eq(_actvieIndex).css("display", "block");

						setTimeout(function() {
							contentsGridFunction.reset();
						}, 0);
					});
				})();

				function setSelectIndex() {
					list = selectBox.find("option");

					list.each(function(_i) {
						$(this).attr("data-index", _i);
					});
				}

				function getSelectIndex(_target) {
					var _thisIndex;

					_target = selectBox;
					_thisIndex = _target.find("option:selected").attr("data-index");

					return _thisIndex;
				}
			})();
		</script>
	<%--// 차트 데이터 생성 --%>
	<script>
		var chartdivData = [
			{"category": "<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.010" text="최대주주/특수관계인" />","value": <c:out value="${shcp.lgshRatio }"/>},
			{"category": "<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.011" text="기타주주" />","value": <c:out value="${shcp.otshRatio }"/>},
			/*{"category": "<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.012" text="주요주주(10%)/1인" />","value": <c:out value="${shcp.mjshRatio }"/>},*/
			{"category": "<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.013" text="자기주식" />","value": <c:out value="${shcp.trshRatio }"/>},
			{"category": "<spring:message code="FRONT.COMMON.MENU.INVEST.004.001.014" text="우리주식" />","value": <c:out value="${shcp.orshRatio }"/>},
		];
		var chartNtpsAmtData = [
			<c:if test="${not empty firstDvst}">{ "year": "<c:out value="${firstDvst.yyyy}"/>","value": <c:out value="${firstDvst.ntpsAmt}"/>},</c:if>
			<c:if test="${not empty secondDvst}">{ "year": "<c:out value="${secondDvst.yyyy}"/>","value": <c:out value="${secondDvst.ntpsAmt}"/>},</c:if>
			<c:if test="${not empty lastDvst}">{ "year": "<c:out value="${lastDvst.yyyy}"/>","value": <c:out value="${lastDvst.ntpsAmt}"/>},</c:if>
			];
		var chartCdpsAmtData = [
			<c:if test="${not empty firstDvst}">{ "year": "<c:out value="${firstDvst.yyyy}"/>","value": <c:out value="${firstDvst.cdpsAmt}"/>},</c:if>
			<c:if test="${not empty secondDvst}">{ "year": "<c:out value="${secondDvst.yyyy}"/>","value": <c:out value="${secondDvst.cdpsAmt}"/>},</c:if>
			<c:if test="${not empty lastDvst}">{ "year": "<c:out value="${lastDvst.yyyy}"/>","value": <c:out value="${lastDvst.cdpsAmt}"/>},</c:if>
			];
		</script>
	<%--// 화면 로딩 완료 후 스크립트 처리 --%>
	<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				AmChartUtils.createBarChart('chartNtpsAmt', chartNtpsAmtData);
				AmChartUtils.createBarChart('chartCdpsAmt', chartCdpsAmtData);
				$('#chartdiv').css('height',  $( window ).width()+'px');
				AmChartUtils.createPieChart('chartdiv', chartdivData, 'MOBILE');
			});
		});
		</script>
</body>
</html>