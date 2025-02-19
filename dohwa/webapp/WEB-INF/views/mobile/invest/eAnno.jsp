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
		<div class="invest" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual visual-area invest01">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" /></h2>
							<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></em> --%>
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
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/finance" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}invest/eAnno" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/ir" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/stock" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
							</ul>
							<!--e: 20200903 depth 메뉴명 변경-->
						</div>
					</div>
					<!-- s: 20200903 depth3 탭 추가-->
					<div class="tab-menu-type02">
						<ul class="tab-list tab-list-3depth">
							<li class="active">
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002.001" text="전자공고" /></span></a>
							</li>
							<li>
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002.002" text="전자공시" /></span></a>
							</li>
							<li>
								<a class="item" href="#none"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002.003" text="주가정보" /></span></a>
							</li>
						</ul>
					</div>
					<!-- e: 20200903 depth3 탭 추가-->
					<div class="contents">
						<div class="section-cont">
							<div class="down-box-wrap" id="box_eAnno">
								<!-- <div class="down-box">
									<a class="btn-down-box" href="#none">
										<strong class="down-box-tit"><span class="line-clamp">제 58기 결산공고</span></strong>
										<span class="bttn bttn-download">
											<em class="ico download" aria-hidden="true"></em>
											<span class="txt">다운로드</span>
										</span>
									</a>
								</div> -->
							</div>
						</div>
						<div class="table-btn-wrap more" style="display:none; text-align: center; margin-top: 60px;">
							<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('eAnno', 'box_eAnno')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
						</div>
					</div>
					<div class="contents">
						<div class="section-cont">
							<%-- <h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.002.002.001" text="공시자료" /></h3>
							<div class="iframe-cont">
							</div> --%>
							<iframe style="width:100%;height: 1012px;margin-top:-60px" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" src="https://dart.fss.or.kr/html/search/SearchCompanyIR3_M.html?textCrpNM=00114552"></iframe>
						</div>
					</div>
					<div class="contents">
						<div class="section-cont">
							<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003" text="주가정보" /></h3>
							<div class="stock-info-box">
								<div class="stock-now">
									<div class="stock-now-point clfix">
										<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.001" text="현재가"/></span>
										<span class="stock-num up" id="stock_curJuka"></span>
									</div>
									<div class="stock-now-row">
										<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></span>
										<span class="stock-num color-point-03" id="stock_volume"></span>
										<span class="stock-tit"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비"/></span>
										<span class="stock-num up">
											<em class="ico stock-net-change"></em>
											<span id="stock_debi"></span>
										</span>
									</div>
								</div>
								<ul class="stock-info-list">
									<li>
										<span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.004" text="시가"/></span>
										<span class="stock-num" id="stock_startJuka"></span>
									</li>
									<li>
										<span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.005" text="고가"/></span>
										<span class="stock-num" id="stock_highJuka"></span>
									</li>
									<li>
										<span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.006" text="저가"/></span>
										<span class="stock-num" id="stock_lowJuka"></span>
									</li>
									<li>
										<span class="stock-info"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.007" text="거래대금"/></span>
										<span class="stock-num" id="stock_money"></span>
									</li>
								</ul>
							</div>
							<div class="table-wrap-type01">
								<table class="table-col-type01 border-top-style02">
									<caption>
										<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003" text="주가정보" /></span>
										<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가"/></span>
										<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.009" text="52주"/></span>
										<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.010" text="최고"/></span>
										<span class="txt05">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.011" text="최저"/></span>
										<span class="txt06">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.012" text="상한가"/></span>
										<span class="txt07">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.013" text="하한가"/></span>
										<span class="txt08">,PER</span>
										<span class="txt09">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.014" text="상장주식수"/></span>
										<span class="txt10">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.015" text="액면가"/></span>
									</caption>
									<colgroup>
										<col style="width:24%" />
										<col style="width:26%" />
										<col />
									</colgroup>
									<tbody>
										<tr>
											<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가"/></th>
											<td class="right" id="stock_prevJuka"></td>
										</tr>
										<tr>
											<th rowspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.009" text="52주"/></th>
											<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.010" text="최고"/></th>
											<td class="right" id="stock_high52"></td>
										</tr>
										<tr>
											<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.011" text="최저"/></th>
											<td class="right" id="stock_low52"></td>
										</tr>
										<tr>
											<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.012" text="상한가"/></th>
											<td class="right" id="stock_upJuka"></td>
										</tr>
										<tr>
											<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.013" text="하한가"/></th>
											<td class="right" id="stock_downJuka"></td>
										</tr>
										<tr>
											<th colspan="2">PER</th>
											<td class="right" id="stock_per"></td>
										</tr>
										<tr>
											<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.014" text="상장주식수"/></th>
											<td class="right" id="stock_amount"></td>
										</tr>
										<tr>
											<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.015" text="액면가"/></th>
											<td class="right" id="stock_faceJuka"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="section-cont">
							<div class="menu-selectbox">
								<span class="selectbox">
									<select title="" id="selectStockInfoTab">
										<option value="stockInfoTab1"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.016" text="일자별 시세"/></option>
										<option value="stockInfoTab2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.017" text="시간대별 체결가"/></option>
										<option value="stockInfoTab3"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.018" text="호가"/></option>
										<option value="stockInfoTab4"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.019" text="회원사별 거래"/></option>
									</select>
								</span>
							</div>
							<div class="inner-tab-cont active" id="stockInfoTab1">
								<div class="table-wrap-type01">
									<em class="table-scroll-hint active"></em>
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.016" text="일자별 시세"/></span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가"/></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.020" text="종가"/></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비"/></span>
											<span class="txt05">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.004" text="시가"/></span>
											<span class="txt06">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.005" text="고가"/></span>
											<span class="txt07">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></span>
											<span class="txt08">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.007" text="거래대금"/></span>
										</caption>
										<colgroup>
											<col style="width:29.4vw" />
											<col style="width:21.3vw" />
											<col style="width:21.3vw" />
											<col style="width:20vw" />
											<col style="width:20vw" />
											<col style="width:20vw" />
											<col style="width:25vw" />
											<col style="width:32vw" />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.008" text="전일종가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.020" text="종가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.004" text="시가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.005" text="고가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.006" text="저가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.007" text="거래대금"/></th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr>
												<td>2020/06/26</td>
												<td>8,010</td>
												<td class="right down">
													<em class="ico stock-net-change"><span class="hide-txt">하락</span></em>
													<span>40</span>
												</td>
												<td class="right">8,090</td>
												<td class="right">8,130</td>
												<td class="right">7,960</td>
												<td class="right">42,994</td>
												<td class="right">344,480,220</td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>
							<div class="inner-tab-cont" id="stockInfoTab2">
								<div class="table-wrap-type01">
									<em class="table-scroll-hint active"></em>
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.017" text="시간대별 체결가"/></span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.023" text="시간"/></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.024" text="체결가"/></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비"/></span>
											<span class="txt05">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.025" text="매도호가"/></span>
											<span class="txt06">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.026" text="매수호가"/></span>
											<span class="txt07">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.027" text="체결량"/></span>
										</caption>
										<colgroup>
											<col style="width:24.8vw" />
											<col style="width:22vw" />
											<col style="width:22vw" />
											<col style="width:22vw" />
											<col style="width:22vw" />
											<col style="width:25vw" />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.023" text="시간"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.024" text="체결가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.003" text="전일대비"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.025" text="매도호가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.026" text="매수호가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.027" text="체결량"/></th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr>
												<td>17:50:40</td>
												<td class="right">7,860</td>
												<td class="right up">
													<em class="ico stock-net-change"><span class="hide-txt">상승</span></em>
													<span>40</span>
												</td>
												<td class="right">8,090</td>
												<td class="right">8,130</td>
												<td class="right">8,010</td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>
							<div class="inner-tab-cont" id="stockInfoTab3">
								<div class="table-wrap-type01">
									<%-- 호가는 매도,매수 5개씩 고정이므로 테이블은 유지하고 값만 js에서 채운다. --%>
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.018" text="호가"/></span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.028" text="매도잔량"/></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.018" text="호가"/></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.029" text="매수잔량"/></span>
										</caption>
										<colgroup>
											<col style="width:33.33%" />
											<col style="width:33.33%" />
											<col />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.028" text="매도잔량"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.018" text="호가"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.029" text="매수잔량"/></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
												<td class="right" rowspan="5"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right" rowspan="5"></td>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
											<tr>
												<td class="right"></td>
												<td class="right"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="inner-tab-cont" id="stockInfoTab4">
								<div class="table-wrap-type01">
									<em class="table-scroll-hint active"></em>
									<table class="table-col-type01">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.019" text="회원사별 거래"/></span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.030" text="매도상위"/> <spring:message code="FRONT.COMMON.MENU.INVEST.002.003.032" text="증권사"/></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.030" text="매도상위"/> <spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.031" text="매수상위"/> <spring:message code="FRONT.COMMON.MENU.INVEST.002.003.032" text="증권사"/></span>
											<span class="txt05">,<spring:message code="FRONT.COMMON.MENU.INVEST.002.003.031" text="매수상위"/> <spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></span>
										</caption>
										<colgroup>
											<col style="width:28vw" />
											<col style="width:23vw" />
											<col style="width:28vw" />
											<col style="width:23vw" />
										</colgroup>
										<thead class="bg">
											<tr>
												<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.030" text="매도상위"/></th>
												<th colspan="2"><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.031" text="매수상위"/></th>
											</tr>
											<tr class="border-top">
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.032" text="증권사"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.032" text="증권사"/></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.002.003.002" text="거래량"/></th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr>
												<td>미래에셋대우</td>
												<td class="right">10,208</td>
												<td>미래에셋대우</td>
												<td class="right">10,208</td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<%--// 퍼블파트에서 작성한 JS  --%>
		<script>
		var component = new ComponentUI();
		component.tabContent(".tab-list-3depth", ".contents", function(i){
			if($(".tab-list-3depth li:last").hasClass('active') && StringUtils.isEmpty($('#stock_curJuka').text())){
				getKRXDataAjax();	// 주가정보를 보여주기.
			}
		});
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				getInvRef("eAnno", "box_eAnno");	//전자공고 파일 리스트 조회 및 리스트 그리기.

				// 주가정보내의 탭 핸들링
				$('.inner-tab-cont').hide();
				$('.inner-tab-cont:first').show();
				$('#selectStockInfoTab').on('change', function(){
					$('.inner-tab-cont').hide();
					$('#'+$(this).val()).show();
				});
			});
		});

		// 주가정보(KRX) 추가
		function getKRXDataAjax(){
			$.ajax({
				url : '/invest/getKRXDataAjax',
				type : 'post',
				data : {},
				dataType: 'json',
				success : function(data) {
					if(data.success){
						//stock_faceJuka
						if(data.krxResponse){
							// 주가 정보
							if(data.krxResponse.stockInfoResponse){
								var kDungRak = StringUtils.nvl(data.krxResponse.stockInfoResponse.dungRak,'3');
								$.each(data.krxResponse.stockInfoResponse, function(k, v){
									$('#stock_'+k).html(StringUtils.nvl(v, '-'));
									if(k === 'debi'){
										$('#stock_'+k).parent().removeClass('up').removeClass('down');
										if(kDungRak == '2'){	//day_Dungrak : 2(상승),3(동일),5(하락)
											$('#stock_'+k).parent().addClass('up');
										} else if(kDungRak == '3'){	//day_Dungrak : 2(상승),3(동일),5(하락)
										} else if(kDungRak == '5'){	//day_Dungrak : 2(상승),3(동일),5(하락)
											$('#stock_'+k).parent().addClass('down');
										}
									}
								});
							}

							//일자별 시세
							var stockHtml1 = '';
							if(data.krxResponse.dailyStockResponse && data.krxResponse.dailyStockResponse.length){
								data.krxResponse.dailyStockResponse.forEach(function(o, i){
									stockHtml1 += '<tr>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_Date,'-')+'</td>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_EndPrice,'-')+'</td>';
									if(StringUtils.nvl(o.day_Dungrak,'3') == '2'){	//day_Dungrak : 2(상승),3(동일),5(하락)
										stockHtml1 += '	<td class="up">';
									} else if(StringUtils.nvl(o.day_Dungrak,'3') == '3'){	//day_Dungrak : 2(상승),3(동일),5(하락)
										stockHtml1 += '	<td class="">';
									} else if(StringUtils.nvl(o.day_Dungrak,'3') == '5'){	//day_Dungrak : 2(상승),3(동일),5(하락)
										stockHtml1 += '	<td class="down">';
									}
									stockHtml1 += '		<em class="ico stock-net-change"></em>';
									stockHtml1 += '		<span>'+StringUtils.nvl(o.day_getDebi,'-')+'</span>';
									stockHtml1 += '	</td>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_Start,'-')+'</td>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_High,'-')+'</td>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_Low,'-')+'</td>';
									stockHtml1 += '	<td>'+StringUtils.nvl(o.day_Volume,'-')+'</td>';
									stockHtml1 += '	<td class="right">'+StringUtils.nvl(o.day_getAmount,'-')+'</td>';
									stockHtml1 += '</tr>';
								});
							}
							$('#stockInfoTab1 tbody').html(stockHtml1);

							//시간대별 시세
							var stockHtml2 = '';
							if(data.krxResponse.timeConcludeResponse && data.krxResponse.timeConcludeResponse.length){
								data.krxResponse.timeConcludeResponse.forEach(function(o, i){
									stockHtml2 += '<tr>';
									stockHtml2 += '	<td>'+StringUtils.nvl(o.time,'-')+'</td>';
									stockHtml2 += '	<td>'+StringUtils.nvl(o.negoprice,'-')+'</td>';
									if(StringUtils.nvl(o.dungrak,'3') == '2'){	//dungrak : 2(상승),3(동일),5(하락)
										stockHtml2 += '	<td class="up">';
									} else if(StringUtils.nvl(o.dungrak,'3') == '3'){	//dungrak : 2(상승),3(동일),5(하락)
										stockHtml2 += '	<td class="">';
									} else if(StringUtils.nvl(o.dungrak,'3') == '5'){	//dungrak : 2(상승),3(동일),5(하락)
										stockHtml2 += '	<td class="down">';
									}
									stockHtml2 += '		<em class="ico stock-net-change"></em>';
									stockHtml2 += '		<span>'+StringUtils.nvl(o.debi,'-')+'</span>';
									stockHtml2 += '	</td>';
									stockHtml2 += '	<td>'+StringUtils.nvl(o.sellprice,'-')+'</td>';
									stockHtml2 += '	<td>'+StringUtils.nvl(o.buyprice,'-')+'</td>';
									stockHtml2 += '	<td>'+StringUtils.nvl(o.amount,'-')+'</td>';
									stockHtml2 += '</tr>';
								});

							}
							$('#stockInfoTab2 tbody').html(stockHtml2);

							// 호가
							if(data.krxResponse.hogaResponse){
								for(var trIdx = 0; trIdx < 5; trIdx++){
									$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(0).html(StringUtils.nvl(data.krxResponse.hogaResponse['medoJan'+trIdx],'-'));
									$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(1).html(StringUtils.nvl(data.krxResponse.hogaResponse['medoHoka'+trIdx],'-'));
									//$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(2).html();
								}

								for(trIdx = 5; trIdx < 10; trIdx++){
									if(trIdx == 5){
										//$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(0).html();
										$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(1).html(StringUtils.nvl(data.krxResponse.hogaResponse['mesuHoka'+(trIdx-5)],'-'));
										$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(2).html(StringUtils.nvl(data.krxResponse.hogaResponse['mesuJan'+(trIdx-5)],'-'));
									} else {
										$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(0).html(StringUtils.nvl(data.krxResponse.hogaResponse['mesuHoka'+(trIdx-5)],'-'));
										$('#stockInfoTab3 tbody tr').eq(trIdx).find('td').eq(1).html(StringUtils.nvl(data.krxResponse.hogaResponse['mesuJan'+(trIdx-5)],'-'));
									}

								}
							}

							// 회원사별 거래
							var stockHtml4 = '';
							if(data.krxResponse.askPriceResponses && data.krxResponse.askPriceResponses.length){
								data.krxResponse.askPriceResponses.forEach(function(o, i){
									stockHtml4 += '<tr>';
									stockHtml4 += '	<td>'+StringUtils.nvl(o.member_memdoMem,'-')+'</td>';
									stockHtml4 += '	<td>'+StringUtils.nvl(o.member_memdoVol,'-')+'</td>';
									stockHtml4 += '	<td>'+StringUtils.nvl(o.member_memsoMem,'-')+'</td>';
									stockHtml4 += '	<td>'+StringUtils.nvl(o.member_mesuoVol,'-')+'</td>';
									stockHtml4 += '</tr>';
								});

							}
							$('#stockInfoTab4 tbody').html(stockHtml4);
						}

					}
				},
				error : function(jqXHR) {
					console.log(jqXHR);
				}
			});
		}
		</script>
	</body>
</html>