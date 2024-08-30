<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<div class="pr" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.002" text="홍보센터" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.022" text="Scroll" /></span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
							<div class="grid-ico-wrap" aria-hidden="true">
								<div class="grid-ico" aria-hidden="true"></div>
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
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
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
									<li><a class="item" href="<c:url value="/prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.003" text="CI소개" /></a></li>
									<li class="active"><a class="item" href="<c:url value="/prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.004" text="최신뉴스" /></a></li>
									<!--<c:if test="${'ko' eq _lang}">
										<li><a class="item" href="<c:url value="/prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.024" text="보도자료" /></a></li>
									</c:if>-->
									<li><a class="item" href="<c:url value="/prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.005" text="기업브로슈어" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.006" text="홍보영상" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents no-btm-type clfix">
							<span class="page-decs">
								<strong>04 <spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.001" text="PR ROOM" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont first-cont">
								<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.008" text="최신뉴스 검색" /></h3>
								<div class="search-area">
									<div class="dropdown-item">
										<button class="bttn-dropdown" type="button" role="button"><span><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.009" text="전체" /></span></button>
										<ul class="dropdown-list">
											<li data-code=""><a class="dropdown-menu" href="javascript:void(0);"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.009" text="전체" /></a></li>
											<li data-code="02"><a class="dropdown-menu" href="javascript:void(0);"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.010" text="수상" /></a></li>
											<li data-code="01"><a class="dropdown-menu" href="javascript:void(0);"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.011" text="영업" /></a></li>
											<li data-code="03"><a class="dropdown-menu" href="javascript:void(0);"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.012" text="사회공헌" /></a></li>
											<li data-code="99"><a class="dropdown-menu" href="javascript:void(0);"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.013" text="기타" /></a></li>
										</ul>
									</div>
									<div class="search-box">
										<span class="input-txt">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.014" text="검색어를 입력하세요" var="searchTextPlaceholder"/>
											<input name="searchText" placeholder="${searchTextPlaceholder}" autocomplete="false"/>
										</span>

										<button class="bttn-search" type="button">
											<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.008" text="최신뉴스 검색" /></span>
											<em class="ico-search" aria-hidden="true"></em>
										</button>
									</div>
								</div>
							</div>
							<div class="section-cont">
								<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.015" text="최신뉴스 검색결과" /></h3>
								<div class="table-wrap-type01">
									<table class="table-col-type02">
										<caption>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.016" text="구분" /></span>
											<span class="txt03"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.018" text="제목" /></span>
										
											<c:if test="${'ko' eq _lang}">
												<span class="txt04"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.019" text="출처" /></span>
											</c:if>
										
											<span class="txt02"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.023" text="등록일" /></span>
										</caption>
										<colgroup>
											<col style="width:11%" />
											<col style="width:auto" />
											
											<c:if test="${'ko' eq _lang}">
												<col style="width:17%" />
											</c:if>
											
											<col style="width:14%" />											
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.016" text="구분" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.018" text="제목" /></th>
											
											<c:if test="${'ko' eq _lang}">
												<th><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.019" text="출처" /></th>
											</c:if>
											
												<th><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.023" text="등록일" /></th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
									<div class="table-btn-wrap more">
										<button class="bttn type01 style01 more" type="button" role="button" title="<spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.021" text="최신뉴스 목록 더보기" />">
											<div class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></div>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
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
			var _lang = '<c:out value="${_lang}"/>';
			var _rpp = '<c:out value="${rpp}"/>';
			var _temp = {};
			var _moreCheck = false;
			var _backCheck = false;
			var _c = 0;
			var _r = Number(_rpp);
			
			$('.bttn-search').off('click').on('click', function() {
				var idx = 0;
				try {
					idx = component.selectBox(".bttn-dropdown").getIndex();
				} catch(e) { idx = 0; }

				_moreCheck = false;
				_c = 0;
				_r = Number(_rpp);
				_temp.searchType = $('.dropdown-list li').eq(idx).data('code');
				_temp.searchText = $('input[name=searchText]').val();
				
				news().removeStorage();
				
				if(!$('button.more').is(':visible')) {
					$('button.more').show();
				}
				
				news().get({ u : 'list', searchType : $('.dropdown-list li').eq(idx).data('code'), searchText : $('input[name=searchText]').val() });
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
				news().removeStorage();
				
				news().get({ u : 'more', offsetStartNumber : _c, rowPerPage : _r
					,searchType : _temp.searchType
					,searchText : _temp.searchText
				});
			});

			$('tbody').off('click').on('click', '[data-href]', function() {
				if(typeof $(this).attr('target') !== 'string') {
					sessionStorage.setItem("news",
						JSON.stringify({ c : _c, r : _r, url : $(this).data('href'), searchType : _temp.searchType,
						searchText : _temp.searchText }));
				}
				
				$(this).attr('href', $(this).data('href'));
			});
			
			function news() {
				var _s = '';
				
				function removeStorage() {
					if(null !== sessionStorage.getItem("news")) {
						sessionStorage.removeItem("news");
					}
				}
				function get(o) {
					var u = o.u;
					delete o.u;
					$.ajax({
						url : '/prroom/news/' + u,
						type : 'post',
						dataType: 'json',
						data: JSON.stringify(o),
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
							_s += '<tr>';
							_s += 	'<td class="bold">';

							if('01' === item.typeCd) {
								_s += 	'<span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.008" text="영업" /></span>';
							} else if('02' === item.typeCd) {
								_s += 	'<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.009" text="수상" /></span>';
							} else if('03' === item.typeCd) {
								_s += 	'<span class="news-label green"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.010" text="사회공헌" /></span>';
							} else {
								_s += 	'<span class="news-label gray"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.002.011" text="기타" /></span>';
							}

							if('ko' === _lang) {
								_target = 'target="_blank"';
								_url = item.url;
							} else {
								_url = '/prroom/news/'+ item.seq;
							}

							_s +=	'</td>';
							_s += 	'<td class="left"><a class="txt-link" href="javascript:void(0);" data-href="'+ _url +'" '+ _target +'><div class="line-clamp">'+ item.title +'</div></a></td>';

							if('ko' === _lang) {
								_s += 	'<td>'+ item.refr +'</td>';
							}

							_s += 	'<td>'+ item.strRegDt +'</td>';
							_s += '</tr>';
							
							_n -= 1;
							
							$('.table-btn-wrap.more').show();
						}
						
					} else if(0 === data.list.length && !_moreCheck) {
						
						var _colspan = '3';
						if('ko' === _lang) {
							_colspan = '4';
						}
						
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

					if(typeof data.list !== 'undefined' && data.count <= $('tbody tr').length) {
						$('button.more').hide();
					}
					
					$(window).trigger('resize');
					
					if(currScrollTop){
						 $(document).scrollTop(currScrollTop);
					}
				}

				function back() {
					var obj = JSON.parse(sessionStorage.getItem("news"));
					sessionStorage.removeItem("news");
					
					if(obj.hasOwnProperty('searchType')) {
						var _type = obj.searchType;
						var _idx = 0;
						if('' !== _type) {
							try {
								_idx = $('.dropdown-list li[data-code="'+ _type +'"]').data('index');
								$('.dropdown-list li[data-code="'+ _type +'"]').trigger('click');
							} catch(e) {}

							_temp.searchType = obj.searchType;
						}
					}
					
					if(obj.hasOwnProperty('searchText')) {
						$('input[name="searchText"]').val(obj.searchText);
						_temp.searchText = obj.searchText;
					}
					
					_backCheck = true;
					_c = 0;
					_r = 0 === obj.r ? Number(_rpp) : 0 !== obj.c ? (obj.c + Number(_rpp)) : obj.r;
					
					news().get({ u : 'list',  offsetStartNumber : _c, rowPerPage : _r
						,searchType : obj.hasOwnProperty('searchType') ? obj.searchType : ''
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

				if(null !== sessionStorage.getItem("news")) {
					var obj = JSON.parse(sessionStorage.getItem("news"));
					var seq = (typeof obj.url !== 'undefined') ? obj.url.substring(obj.url.lastIndexOf('/') + 1) : 0;
					if(Number(seq) === Number('<c:out value="${newsPrevPageSeq}"/>')) {
						news().back();
					} else {
						news().get({ u : 'list' });
					}
				} else {
					news().get({ u : 'list' });
				}

			} catch(e) {}
			
		</script>
	</body>
</html>