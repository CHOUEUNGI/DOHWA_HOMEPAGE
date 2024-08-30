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
		<div class="pr pr-news" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.002" text="홍보센터" /></h2>
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
					<div class="page-tab-section">
						<div class="tab-menu-type01 center">
							<ul class="tab-list">
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.003" text="CI소개" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.004" text="최신뉴스" /></a></li>
								<!--<c:if test="${'ko' eq _lang}">
									<li><a class="item" href="<c:url value="${mobileStartPath}prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.024" text="보도자료" /></a></li>
								</c:if>-->
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.005" text="기업브로슈어" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.006" text="홍보영상" /></a></li>
							</ul>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont">
							<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.008" text="최신뉴스 검색" /></h3>
							<div class="search-area">
								<span class="selectbox">
									<select title="뉴스구분" name="searchType">
										<option value=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.009" text="전체" /></option>
										<option value="02"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.010" text="수상" /></option>
										<option value="01"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.011" text="영업" /></option>
										<option value="03"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.012" text="사회공헌" /></option>
										<option value="99"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.013" text="기타" /></option>
									</select>
								</span>
								<div class="search-box">
									<span class="input-txt">
										<spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.014" text="검색어를 입력하세요" var="searchTextPlaceholder"/>
										<input name="searchText" placeholder="${searchTextPlaceholder}" />
									</span>

									<button class="bttn-search" type="button">
										<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.008" text="최신뉴스 검색" /></span>
										<em class="ico-search" aria-hidden="true"></em>
									</button>
								</div>
							</div>
							<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.015" text="최신뉴스 검색결과" /></h3>
							<ul class="news-list-wrap"></ul>
							<div class="table-btn-wrap more">
								<button class="bttn type01 style01 _more" type="button"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
							</div>
						</div>
					</div>
					<div class="btm-full-banner">
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link.jsp" %>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script>
			var _lang = '<c:out value="${_lang}"/>';
			var _rpp = '<c:out value="${rpp}"/>';
			var _temp = {};
			var _moreCheck = false;
			var _backCheck = false;
			var _c = 0;
			var _r = Number(_rpp);

			$('.bttn-search').off('click').on('click', function() {

				_moreCheck = false;
				_c = 0;
				_r = Number(_rpp);
				_temp.searchType = $('select[name="searchType"]').val();
				_temp.searchText = $('input[name=searchText]').val();

				news().removeStorage();

				if(!$('button._more').is(':visible')) {
					$('button._more').show();
				}
				
				news().get({ u : 'list', searchType : $('select[name="searchType"]').val(), searchText : $('input[name=searchText]').val() });
			});

			$('button._more').off('click').on('click', function() {
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

			$('ul.news-list-wrap').off('click').on('click', '[data-href]', function() {
				if(typeof $(this).attr('target') !== 'string') {
					sessionStorage.setItem("mNews",
						JSON.stringify({ c : _c, r : _r, url : $(this).data('href'), searchType : _temp.searchType,
						searchText : _temp.searchText }));
				}

				$(this).attr('href', $(this).data('href'));
			});

			function news() {
				var _s = '';

				function removeStorage() {
					if(null !== sessionStorage.getItem("mNews")) {
						sessionStorage.removeItem("mNews");
					}
				}

				function get(o) {
					var u = o.u;
					delete o.u;
					$.ajax({
						url : '${mobileStartPath}prroom/news/' + u,
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
						$('ul.news-list-wrap').empty();
					}

					if(typeof data.list !== 'undefined' && 0 == data.list.length) {
						_c = _c - Number(_rpp);
					}

					if(typeof data.list !== 'undefined' && 0 < data.list.length) {

						for(var i in data.list) {
							var _target = '';
							var _url = '';
							var item = data.list[i];
							_s += '<li class="news-list-item">';

							if('01' === item.typeCd) {
								_s += 	'<span class="news-label blue"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.011" text="영업" /></span>';
							} else if('02' === item.typeCd) {
								_s += 	'<span class="news-label green-light"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.010" text="수상" /></span>';
							} else if('03' === item.typeCd) {
								_s += 	'<span class="news-label green"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.012" text="사회공헌" /></span>';
							} else {
								_s += 	'<span class="news-label gray"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.013" text="기타" /></span>';
							}

							if('ko' === _lang) {
								_target = 'target="_blank"';
								_url = item.url;
							} else {
								_url = '${mobileStartPath}prroom/news/'+ item.seq;
							}
							_s +=	'<p class="news-link"><a class="line-clamp" href="javascript:void(0);" data-href="'+ _url +'" '+ _target +'>'+ item.title +'</a></p>';

							if('ko' === _lang) {
								_s += 	'<div class="news-source"><span class="tit"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.019" text="출처" /></span><em class="txt">'+ item.refr +'</em></div>';
							}

							_s += '</li>';

							$('.table-btn-wrap.more').show();
						}

					} else if(0 === data.list.length && !_moreCheck) {
						_s += '<li class="news-list-item">';
						_s +=     '<div class="no-data">';
						_s +=         '<i class="ico-nodata" aria-hidden="true"></i>';
						_s +=         '<span><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.020" text="검색 결과가 없습니다." /></span>';
						_s +=     '</div>';
						_s += '</li>';

						$('.table-btn-wrap.more').hide();
					}

					var currScrollTop = $(document).scrollTop();
					$('ul.news-list-wrap').append(_s);

					if(typeof data.list !== 'undefined' && data.count <= $('ul.news-list-wrap li').length) {
						$('button._more').hide();
					}
					
					setTimeout(function() {
						contentsGridFunction.reset();
					}, 0);
					
					if(currScrollTop){
						 $(document).scrollTop(currScrollTop);
					}
				}

				function back() {
					var obj = JSON.parse(sessionStorage.getItem("mNews"));
					sessionStorage.removeItem("mNews");
					
					if(obj.hasOwnProperty('searchType')) {
						$('select[name="searchType"]').val(obj.searchType).prop("selected", true);
						_temp.searchType = obj.searchType;
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

			try {

				if(null !== sessionStorage.getItem("mNews")) {
					var obj = JSON.parse(sessionStorage.getItem("mNews"));
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