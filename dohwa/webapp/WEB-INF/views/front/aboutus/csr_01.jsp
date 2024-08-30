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
	<style type="text/css">  
	    table {width:500px;}  
	    .hide {display:none;}  
	    .show {display:table-row;}  
	    .item td {cursor:pointer;}  
   </style>  
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
		<div class="intro csr" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
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
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
								</ul>
							</div>
						</div>
						<div class="contents full-type no-btm-type clfix">
							<span class="page-decs page-decs-type02">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont csr-share">
								<div class="content-inner">
									<!-- s: 20200814 추가 -->
									<div class="tab-menu-type02">
										<ul class="tab-list tab-list-3depth">
											<li class="active"><a class="item" href="javascript:void(0);" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.003" text="나눔경영" /></span></a></li>
											<li><a class="item" href="/aboutus/csr_02"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.004" text="안전/품질경영" /></span></a></li>
											<li><a class="item" href="/aboutus/csr_03"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.005" text="윤리준법경영" /></span></a></li>
										</ul>
									</div>
									<!-- e: 20200814 추가 -->
									<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.008" text="나눔경영" /></h3>
									<p class="title-main">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.009" text="㈜도화엔지니어링은 &lsquo;인본, 화합을 중시하는<br />나눔경영&rsquo;을 중시합니다." />
									</p>
									<p class="cont-desc">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.010" text="매 해 임직원들의 자발적 참여로 운영되는 &lsquo;봉사동호회&rsquo;를 토대로 국내 뿐만 아니라 인도네시아, 탄자니아, 페루, 캄보디아 등 다양한 국가에 나눔경영을 실천하고 있습니다.<br />앞으로도 ㈜도화엔지니어링은 인본을 중시하는 지속가능 체계 속에서 진정성 있는 나눔 활동의 확대를 위해 더욱 노력하겠습니다." />
									</p>
								</div>
								<div class="sub-visual">
									<div id="bg" aria-hidden="true"></div>
									<em class="hide-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.011" text="Sharing Management" /></em>
								</div>
								<div class="content-inner">
									<div class="csr-cont">
										<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.012" text="사회공헌" /></h4>
										<div class="desc-area">
											<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.013" text="기업의 경제적 이윤 추구에 머무르지 않고, 신뢰받는 사회구성원으로서 함께 하는 지역사회와 소통하고 협력하며 행복을 추구합니다." /></p>
											<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.014" text="임직원의 자발적인 참여로 조성된 기금 지원, 취약계층을 후원하고 환경과 문화를 보존하는 봉사 활동 등은 상생의 가치를 이어가고자 하는 도화의 의지입니다." /></p>
										</div>
									</div>
									<div class="csr-cont">
										<div class="csr-txtbox fl">
											<h5 class="title-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.015" text="봉사활동" /></h5>
											<div class="csr-imgbox"><img src="/images/pc/img_csr_share01.jpg" alt="" /></div>
											<div class="desc-area">
												<p>
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.016" text="2015년 임직원 60명이 뜻을 모아 설립한 &lsquo;도화 봉사동호회&rsquo;가 주축이 되어, 매년 초 운영 계획을 수립하고 사회 전반에 걸쳐 관심이 필요한 이들을 대상으로 다방면의 활동을 펼치고 있습니다. 매월 정기총회를 통해 독거노인 &middot; 탈북민 등 소외계층을 위한 김장 담그기, 환경 보존을 위한 자연정화 활동, 역사문화탐방, 컴퓨터 및 전산장비 기부, 태극기달기 등 직접 찾아가는 희망 봉사 활동을 정기적으로 실천해 왔습니다. 앞으로도 도화는 지역사회의 상생과 행복한 미래에 보탬이 되는 진정성 있는 나눔으로 기여하겠습니다." />
												</p>
											</div>
										</div>
										<div class="csr-txtbox fl">
											<h5 class="title-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.017" text="희망나눔기금" /></h5>
											<div class="csr-imgbox"><img src="/images/pc/img_csr_share02.jpg" alt="" /></div>
											<div class="desc-area">
												<p><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.018" text="임직원의 자발적인 참여로 이루어진 &lsquo;도화희망나눔기금&rsquo;은 매월 급여 중 기부한 일정 금액으로 조성되며, 이 기금으로 국내 &middot; 외에서 다양한 사회공헌 활동을 전개하고 있습니다. 현재 임직원의 약 62%인 1,200명 이상이 도화희망나눔기금에 동참하고 있으며, 임직원이 기부한 금액만큼 회사도 동일 금액을 후원, 그 나눔이 두 배가 되는 일명 ‘매칭 그랜트 방식’으로 운영되고 있습니다." /></p>
											</div>
										</div>
									</div>
									<div class="fund-box" id="fund-box"></div>
									<div class="section-cont social-activty">
										<h4 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.025" text="사회공헌 주요활동" /></h4>
										<div class="table-wrap-type01">
											<table class="table-col-type02 donate">
												<caption>
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.045" text="구분" /></span>
													<span class="txt03"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.046" text="활동내용" /></span>
													<span class="txt02"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.047" text="기간" /></span>
												</caption>
												<colgroup>
													<col style="width:13%" />
													<col style="width:auto" />
													<col style="width:13%" />											
												</colgroup>
												<thead>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.045" text="구분" /></th>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.046" text="활동내용" /></th>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.047" text="기간" /></th>
													</tr>
												</thead>
												<tbody>
												<!-- <tr class="title">
													<td>
													<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.049" text="봉사활동" /></span>
													</td>
													<td><div>제목1</div></td>
													<td>2021.05.10</td>
												</tr>
												<tr class="hide">
													<td></td>
													<td style="text-align:left;">
															<span><img width="100%" src="/images/common/press_view_logo.png" alt="'+ item.title +'" /></span>
															<span>내용1</span>
													</td>
													<td></td>
												</tr>
												<tr class="title">
													<td>
													<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.049" text="봉사활동" /></span>
													</td>
													<td><div>제목2</div></td>
													<td>2021.05.12</td>
												</tr>
												<tr class="hide">
													<td></td>
													<td style="text-align:left;">
															<span><img width="100%" src="/images/common/press_view_logo.png" alt="'+ item.title +'" /></span>
															<span>내용2</span>
													</td>
													<td></td>
												</tr>
												<tr class="title">
													<td>
													<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.049" text="봉사활동" /></span>
													</td>
													<td><div>제목3</div></td>
													<td>2021.05.20</td>
												</tr>
												<tr class="hide">
													<td></td>
													<td style="text-align:left;">
															<span><img width="100%" src="/images/common/press_view_logo.png" alt="'+ item.title +'" /></span>
															<span>내용3</span>
													</td>
													<td></td>
												</tr> -->
												</tbody>
											</table>
											<div class="table-btn-wrap more">
												<button class="bttn type01 style01 more" type="button" role="button" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.021" text="최신뉴스 목록 더보기" />">
													<div class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></div>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->
						<!-- s : 20200813 grid mixin 추가-->
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
						<!-- e : 20200813 grid mixin 추가-->
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
	</body>
	<script type="text/javascript">
	var _lang = '<c:out value="${_lang}"/>';
	var component = new ComponentUI();
	var _rpp = 5;
	var _temp = {};
	var _moreCheck = false;
	var _backCheck = false;
	var _c = 0;
	var _r = Number(_rpp);
	var article = (".donate .show");
	var secondTrRow = 0;
	
	// 아코디언 
	$(document).on('click', '.donate .title td', function(){
		var myArticle = $(this).parents().next("tr");
		var prevArticle = myArticle.prev("tr");
		var nextTd = myArticle.children();
		var cont = nextTd.eq(1).text();
		var clickTrRow = $(this).closest('tr').prevAll().length; // 클릭한 row
		
		if(clickTrRow==secondTrRow){
			$('tbody').find('tr').eq(clickTrRow).find("td:eq(1)").css('font-weight','bold');	
		}else{
			$('tbody').find('tr').eq(clickTrRow).find("td:eq(1)").css('font-weight','bold');
			$('tbody').find('tr').eq(secondTrRow).find("td:eq(1)").css('font-weight','');
			secondTrRow = clickTrRow; 
		}
		
	    // 내용없는 경우 아코디언효과 비활성화 
		if(cont.trim()!=''){
			if($(myArticle).hasClass('hide')) { 
		        $(article).removeClass('show').addClass('hide');
		        $(myArticle).removeClass('hide').addClass('show');
		    } 
		    else { 
		        $(myArticle).addClass('hide').removeClass('show');
		    } 
		}
	});
	
	$('button.more').off('click').on('click', function() {
		// 상세에서 올때
		if(_backCheck && 0 === _c) {
			_c = _r;
			_backCheck = false;
		} else {
			_c += Number(_rpp);
		}

		_r = Number(_rpp);
		
		_moreCheck = true;
		donate().removeStorage();
		
		donate().get({ u : 'more', offsetStartNumber : _c, rowPerPage : _r });
	});

	function donate() {
		var _s = '';
		
		function removeStorage() {
			if(null !== sessionStorage.getItem("donate")) {
				sessionStorage.removeItem("donate");
			}
		}
		function get(o) {
			var u = o.u;
			delete o.u;
			$.ajax({
				url : 'donate/' + u,
				type : 'post',
				dataType: 'json',
				data: JSON.stringify({
					offsetStartNumber : _c,
					rowPerPage : _r
				}),
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
			if(!_moreCheck) {
				$('tbody').empty();
			}
			
			if(typeof data.list !== 'undefined' && 0 == data.list.length) {
				_c = _c - Number(_rpp);
			}
			
			if(typeof data.list !== 'undefined' && 0 < data.list.length) {
				var _n = !_moreCheck ? data.count : Number($($('tbody').find('tr:last')).find('td').eq(1).text()) - 1;
				for(var i in data.list) {
					var _target = '';
					var _url = '';
					var item = data.list[i];

					_s += '<tr class="title">';
					_s += 	'<td>';
					if('01' === item.typeCd) {
						if('ko'===_lang){
							_s += 	'<span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.048" text="희망나눔기금" /></span>';
						}else if('en'===_lang){
							_s += 	'<span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.054" text="희망나눔기금" /></span>';
						}else{
							_s += 	'<span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.056" text="희망나눔기금" /></span>';
						}
					} else if('02' === item.typeCd) {
						if('ko'===_lang){
							_s += 	'<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.049" text="봉사활동" /></span>';	
						}else if('en'===_lang){
							_s += 	'<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.053" text="봉사활동" /></span>';
						}else{
							_s += 	'<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.001.055" text="봉사활동" /></span>';
						}
					}else{
					}
					_s +=	'</td>';
					if('ko'===_lang){
						_s += 	'<td class="boldtt"><div style="text-align:left;">'+ item.koTitle +'</div></td>';	
					}else if('en'===_lang){
						_s += 	'<td class="boldtt"><div style="text-align:left;">'+ item.enTitle +'</div></td>';
					}else{
						_s += 	'<td class="boldtt"><div style="text-align:left;">'+ item.esTitle +'</div></td>';
					}
					
					if('ko'===_lang || 'es'===_lang){
						_s += 	'<td style="color:#004442; font-size:1.1rem;">'+ item.writeDt +'</td>';	
					}else{
						_s += 	'<td style="color:#004442; font-size:1.1rem;">'+ item.writeDtEn +'</td>';
					}
					_s += '</tr>';
					if(item.mainFileName2!=null) {
						_s += '<tr class="hide">';
						_s += '<td></td>';
						_s += 	'<td style="text-align:left;">';
						if('ko'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.koCont +'</p></div>';	
						}else if('en'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.enCont +'</p></div>';
						}else{
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.esCont +'</p></div>';
						}
						_s += '		<div style="position:relative; width:100%; height:280px; float:right;"><img align="left" style="width:49.5%; height:100%;" src="<c:url value="${WEB_URL}" />'+ item.mainFileName1 +'" alt="'+ item.title +'" /><img align="right" style="width:49.5%; height:100%;" src="<c:url value="${WEB_URL}" />'+ item.mainFileName2 +'" alt="'+ item.title +'" /></div>';
						_s += 	'</td>';
						_s += '<td></td>';
						_s += '</tr>';
					}else if(item.mainFileName1!=null){
						_s += '<tr class="hide">';
						_s += '<td></td>';
						_s += 	'<td style="text-align:left;">';
						if('ko'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.koCont +'</p></div>';	
						}else if('en'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.enCont +'</p></div>';
						}else{
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.esCont +'</p></div>';
						}
						_s += '		<div style="position:relative; width:100%; height:280px; float:right;"><img align="center" style="width:49.5%; height:100%;" src="<c:url value="${WEB_URL}" />'+ item.mainFileName1 +'" alt="'+ item.title +'" /></div>';
						_s += 	'</td>';
						_s += '<td></td>';
						_s += '</tr>';
					}else{
						_s += '<tr class="hide">';
						_s += '<td></td>';
						_s += 	'<td style="text-align:left;">';
						if('ko'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.koCont +'</p></div>';	
						}else if('en'===_lang){
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.enCont +'</p></div>';
						}else{
							_s += '		<div style="position:relative; width:100%; height:100%; float:left; padding-bottom:20px;"><p>'+ item.esCont +'</p></div>';
						}
						_s += 	'</td>';
						_s += '<td></td>';
						_s += '</tr>';
					}
					
					_n -= 1;
					
					$('.table-btn-wrap.more').show();
				}
				
			} else if(0 === data.list.length && !_moreCheck) {
				_s += '<td colspan="'+ _colspan +'">';
				_s +=     '<div class="no-data">';
				_s +=         '<i class="ico-nodata"></i>';
				_s +=         '<span><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.020" text="검색 결과가 없습니다." /></span>';
				_s +=     '</div>';
				_s += '</td>';
				
				$('.table-btn-wrap.more').hide();
			}
			
			var currScrollTop = $(document).scrollTop();
			$('tbody').append(_s);

			if(typeof data.list !== 'undefined' && (data.count*2) <= $('tbody tr').length) {
				$('button.more').hide();
			}
			
			$(window).trigger('resize');
			
			if(currScrollTop){
				 $(document).scrollTop(currScrollTop);
			}
		}

		function back() {
			var obj = JSON.parse(sessionStorage.getItem("donate"));
			sessionStorage.removeItem("donate");
			
			_backCheck = true;
			_c = 0;
			_r = 0 === obj.r ? Number(_rpp) : 0 !== obj.c ? (obj.c + Number(_rpp)) : obj.r;
			
			news().get({ u : 'list',  offsetStartNumber : _c, rowPerPage : _r
				,searchText : obj.hasOwnProperty('searchText') ? obj.searchText : '' });
		}
		
		return  {
			get : get,
			back : back,
			removeStorage : removeStorage
		}
	}
	
	var component = new ComponentUI();
	component.selectBox(".bttn-dropdown", 250);
	
	
	try {

		if(null !== sessionStorage.getItem("donate")) {
			var obj = JSON.parse(sessionStorage.getItem("donate"));
			var seq = (typeof obj.url !== 'undefined') ? obj.url.substring(obj.url.lastIndexOf('/') + 1) : 0;
			if(Number(seq) === Number('<c:out value="${donatePrevPageSeq}"/>')) {
				donate().back();
			} else {
				donate().get({ u : 'list' });
			}
		} else {
			donate().get({ u : 'list' });
		}

	} catch(e) {}
	
	

	</script>
</html>