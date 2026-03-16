<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="<%=response.getLocale().getLanguage()%>">
<head>
<%@ include file="/WEB-INF/views/front/layout/head.jsp"%>
</head>
<body>
	<div class="invest" id="wrap">
		<%@ include file="/WEB-INF/views/front/layout/header.jsp"%>
		<div id="container">
			<div id="content" role="main">
				<div class="page-visual invest01 visual-area">
					<div class="page-title-sec">
						<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
						<h2 class="title-main">
							<spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" />
						</h2>
					</div>
					<div class="noti-scroll none">
						<span class="txt">Scroll</span> <span class="ico01" aria-hidden="true"></span> <span class="ico02" aria-hidden="true"></span>
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
				<div class="contents-wrap" style="position: relative">
					<div class="page-tab-section">
						<div class="tab-menu-type01 center">
							<c:choose>
								<c:when test="${'ko' eq _lang}">
									<ul class="tab-list">
										<li><a class="item" href="<c:url value="/invest/director" />"><spring:message code="FRONT.COMMON.MENU.INVEST.005" text="경영정보" /></a></li>
										<li><a class="item" href="<c:url value="/invest/finance" />"><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
										<li class="active"><a class="item" href="<c:url value="/invest/eAnno" />"><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
										<li><a class="item" href="<c:url value="/invest/ir" />"><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
										<li><a class="item" href="<c:url value="/invest/stock" />"><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="tab-list">
										<li><a class="item" href="<c:url value="/invest/finance" />"><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
										<li class="active"><a class="item" href="<c:url value="/invest/eAnno" />"><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
										<li><a class="item" href="<c:url value="/invest/ir" />"><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
										<li><a class="item" href="<c:url value="/invest/stock" />"><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="tab-menu-type02">
						<ul class="tab-list tab-list-3depth">
							<li class="active"><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.001" text="전자공고" /></span></a></li>
							<li><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.002" text="전자공시" /></span></a></li>
							<li><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003" text="주가정보" /></span></a></li>
						</ul>
					</div>
					<div class="contents contents-2depth clfix">
						<span class="page-decs"> <strong>03 INVESTORS</strong> DOHWA ENGINEERING</span>
						<div class="section-cont">
							<div class="down-box-wrap" id="box_eAnno"></div>
							<div class="table-btn-wrap more" style="display: none; text-align: center; margin-top: 60px;">
								<button class="bttn type01 style01" type="button" onclick="getInvRef('eAnno', 'box_eAnno')">
									<span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span>
								</button>
							</div>
						</div>
					</div>
					<div class="contents contents-2depth clfix">
						<span class="page-decs"> <strong>03 INVESTORS</strong> DOHWA ENGINEERING</span>
						<div class="section-cont">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.002.002.001" text="공시자료" /></h3>
							<div class="iframe-cont" style="text-align: center;">
								<iframe style="min-width: 735px; min-height: 906px;" frameborder="0" name="IR" scrolling="no" src="https://dart.fss.or.kr/html/search/SearchCompanyIR3_M.html?textCrpNM=00114552" title="전자공고시스템 공시자료"></iframe>
							</div>
						</div>
					</div>
					<div class="contents contents-2depth clfix">
						<span class="page-decs"> <strong>03 INVESTORS</strong> DOHWA ENGINEERING</span>
						<div class="section-cont">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.002.004" text="주가정보" /></h3>
							<div class="stock-info-box">
								<div class="stock-now">
									<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.001" text="현재가" /></span>
									<span class="stock-num up" id="stock_curJuka"></span>
								</div>
								<ul class="stock-info-list">
									<li>
										<div class="row-type">
											<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량" /></span>
											<span class="stock-num color-point-03" id="stock_volume"></span>
										</div>
										<div class="row-type">
											<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비" /></span>
											<span class="stock-num up"> <em class="ico stock-net-change"></em> <span id="stock_debi"></span></span>
										</div>
									</li>
									<li><span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.004" text="시가" /></span> <span class="stock-num" id="stock_startJuka"></span></li>
									<li><span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.005" text="고가" /></span> <span class="stock-num" id="stock_highJuka"></span></li>
									<li><span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.006" text="저가" /></span> <span class="stock-num" id="stock_lowJuka"></span></li>
									<li><span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.007" text="거래대금" /></span> <span class="stock-num" id="stock_money"></span></li>
								</ul>
							</div>
							<div class="table-wrap-type01">
								<table class="table-col-type01">
									<colgroup>
										<col style="width: 17%" />
										<col style="width: 17%" />
										<col />
									</colgroup>
									<tbody>
										<tr><th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가" /></th><td class="right" id="stock_prevJuka"></td></tr>
										<tr><th rowspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.009" text="52주" /></th><th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.010" text="최고" /></th><td class="right" id="stock_high52"></td></tr>
										<tr><th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.011" text="최저" /></th><td class="right" id="stock_low52"></td></tr>
										<tr><th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.012" text="상한가" /></th><td class="right" id="stock_upJuka"></td></tr>
										<tr><th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.013" text="하한가" /></th><td class="right" id="stock_downJuka"></td></tr>
										<tr><th colspan="2">PER</th><td class="right" id="stock_per"></td></tr>
										<tr><th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.014" text="상장주식수" /></th><td class="right" id="stock_amount"></td></tr>
										<tr><th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.015" text="액면가" /></th><td class="right" id="stock_faceJuka"></td></tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="section-cont">
							<div class="tab-menu-type02 basic">
								<ul class="tab-list tab-list-4depth">
									<li class="active"><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.016" text="일자별 시세" /></span></a></li>
									<li><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.017" text="시간대별 체결가" /></span></a></li>
									<li><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.018" text="호가" /></span></a></li>
									<li><a class="item" href="#none"><span class="txt"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.019" text="회원사별 거래" /></span></a></li>
								</ul>
							</div>
							<div class="inner-tab-cont active" id="stockInfoTab1">
								<div class="table-wrap-type01">
									<table class="table-col-type01">
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.020" text="종가" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.004" text="시가" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.005" text="고가" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.006" text="저가" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.007" text="거래대금" /></th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
							</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/front/layout/after_script.jsp"%>

	<script>
		var component = new ComponentUI();
		component.tabContent(".tab-list-3depth", ".contents", function(i) {
			if ($(".tab-list-3depth li:last").hasClass('active') && StringUtils.isEmpty($('#stock_curJuka').text())) {
				getKRXDataAjax();
			}
		});
		component.tabContent(".tab-list-4depth", ".inner-tab-cont");

		$(function() {
			$(document).ready(function() {
				// 오류 수정됨: 문자열 내 줄바꿈 제거
				getInvRef("eAnno", "box_eAnno"); 
			});
		});

		$('ul.tab-list').off('click').on('click', function() {
			$(window).trigger('resize');
		});

		function getKRXDataAjax() {
			$.ajax({
				url : '/invest/getKRXDataAjax',
				type : 'post',
				data : {},
				dataType : 'json',
				success : function(data) {
					if (data.success && data.krxResponse) {
						// 주가 정보 바인딩
						if (data.krxResponse.stockInfoResponse) {
							var kDungRak = StringUtils.nvl(data.krxResponse.stockInfoResponse.dungRak, '3');
							$.each(data.krxResponse.stockInfoResponse, function(k, v) {
								$('#stock_' + k).html(StringUtils.nvl(v, '-'));
								if (k === 'debi') {
									$('#stock_' + k).parent().removeClass('up down');
									if (kDungRak == '2') $('#stock_' + k).parent().addClass('up');
									else if (kDungRak == '5') $('#stock_' + k).parent().addClass('down');
								}
							});
						}
						// 일자별 시세 바인딩 (이하 생략 - 원본 로직 동일)
					}
				},
				error : function(jqXHR) { console.log(jqXHR); }
			});
		}
	</script>
</body>
</html>