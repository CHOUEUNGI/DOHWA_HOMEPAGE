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
		<div class="pr press-introduce" id="wrap">
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
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.004" text="CI최신뉴스" /></a></li>
								<!--<c:if test="${'ko' eq _lang}">
									<li class="active"><a class="item" href="<c:url value="${mobileStartPath}prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.024" text="보도자료" /></a></li>
								</c:if>-->
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.005" text="기업브로슈어" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.006" text="홍보영상" /></a></li>
							</ul>
						</div>
					</div>
					
					<div class="contents no-btm-type">
						<div class="section-cont press">
							<h3 class="hide-txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.002.001.015" text="최신뉴스 검색결과" /></h3>
							<ul></ul>
							<div class="table-btn-wrap _more_div">
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
			var _rpp = 3;
			var _temp = {};
			var _moreCheck = false;
			var _backCheck = false;
			var _c = 0;
			var _r = Number(_rpp);
			
			/*$('.bttn-search').off('click').on('click', function() {
				var idx = 0;

				_moreCheck = false;
				_c = 0;
				_r = Number(_rpp);
				_temp.searchText = $('input[name=searchText]').val();
				
				press().removeStorage();
				
				if(!$('button.more').is(':visible')) {
					$('button.more').show();
				}
				
				press().get({ u : 'list', searchText : $('input[name=searchText]').val() });
			});*/
			
			// 더보기
			$('._more_div').off('click').on('click', function() {
				// 상세에서 올때
				if(_backCheck && 0 === _c) {
					_c = _r;
					_backCheck = false;
				} else {
					_c += Number(_rpp);
				}

				_r = Number(_rpp);
				
				_moreCheck = true;
				press().removeStorage();
				
				press().get({ u : 'more', offsetStartNumber : _c, rowPerPage : _r });
			});
			
			// 상세
			$('div.section-cont ul').off('click').on("click", '[data-href]', function() {
				view($(this).data('href'));
			});
			
			// 상세
			function view(url) {
				sessionStorage.setItem("mPress", JSON.stringify({ c : _c, r : _r, url : url}));
				window.location.href = url;
			}
			
		function press() {
			var _s = '';
			
			function removeStorage() {
				if(null !== sessionStorage.getItem("mPress")) {
					sessionStorage.removeItem("mPress");
				}
			}
			
			function get(o) {
				var u = o.u;
				delete o.u;
				$.ajax({
					url : '${mobileStartPath}prroom/press/' + u,
					type : 'post',
					dataType: 'json',
					data: JSON.stringify({
						offsetStartNumber : _c,
						rowPerPage : _r
					}),
					contentType: 'application/json',
					success : function(data) {
						set(data, o.focus);
					},
					error : function(jqXHR) {
						console.log(jqXHR);
					}
				});
			}
		
			function set(data, focus) {
				var firstDataHref = "";
				var s = '';

				if(typeof data.list !== 'undefined' && 0 == data.list.length) {
					_c = _c - Number(_rpp);
				}
				
				if(typeof data.list !== 'undefined' && 0 < data.list.length) {
					for(var i in data.list) {
						var item = data.list[i];
						s += '<li>';
						s += '	<div class="press-cont">';
						s += '		<p><span style="color:#004442; font-size:0.9rem; font-weight:bold;">'+ item.writeDt +'</span></p>';
						s +='			<a class="list-link" href="javascript:void(0);" data-href="<c:url value="${mobileStartPath}prroom/press/" />'+ item.seq +'" title="">';
						s += '		<h3 class="title-sect"><p>'+ item.titleMo +'</p></h3>';
						s += '		<div class="cont-box ci-mean-box">';
						if(item.mainFileName1!=null) {
						s += '				<span class="img"><img src="<c:url value="${WEB_URL}" />'+ item.mainFileName1 +'" alt="'+ item.titleMo +'" />';	
						}else{
						s += '				<span class="img"><img src="/images/common/press_view_logo.png" alt="'+ item.titleMo +'" /></span>';
						}
						s += '			</a>';
						s += '		</div>';
						s += '		<div class="cont-desc">';
						s +='			<a class="list-link" href="javascript:void(0);" data-href="<c:url value="${mobileStartPath}prroom/press/" />'+ item.seq +'" title="">';
						s += '				<p>'+ item.cont +'</p>';
						s += '			</a>';
						s += '		</div>';
						s += '	</div>';
						s += '</li>';
						
						if(i == 0) {
							firstDataHref = '<c:url value="${mobileStartPath}prroom/press/" />'+ item.seq;
						}
					}
				} else if(0 === data.list.length && !_moreCheck) {
					s += '<li class="no-data">';
					s += 	'<i class="ico-nodata"></i>';
					s += 	'<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.016" text="검색 결과가 없습니다." /></span>';
					s += '</li>';
					
					$('._more_div').hide();
				}
				
				var currScrollTop = $(document).scrollTop();
				$('div.section-cont ul').append(s);

				if(typeof data.list !== 'undefined' && data.count <= $('div.section-cont ul li').length) {
					$('._more_div').hide();
				}
				
				$(window).trigger('resize');
				
				console.log('firstDataHref', firstDataHref);
				
				// 좀 전에 봤던 프로젝트 썸네일 위치로 이동
				if(!StringUtils.isEmpty(focus)){
					$('div.section-cont a.list-link').each(function(){
						if($(this).data('href') == focus){
							$('html, body').stop().animate({scrollTop : ($(this).offset().top - (($(window).height() - $(this).height()) / 2))}, 1000);
						}
					});
				} else {
					if(currScrollTop){
						 $(document).scrollTop(currScrollTop);
					}
				}
			}

			function back() {
				var obj = JSON.parse(sessionStorage.getItem("mPress"));
				sessionStorage.removeItem("mPress");
				
				
				_backCheck = true;
				_c = 0;
				_r = 0 === obj.r ? Number(_rpp) : 0 !== obj.c ? (obj.c + Number(_rpp)) : obj.r;
				
				$('div.section-cont ul').empty();
				press().get({ u : 'list',  offsetStartNumber : _c, rowPerPage : _r, focus : obj.url });
			}
			
			return  {
				get : get,
				back : back,
				removeStorage : removeStorage
			}
		}			
			var component = new ComponentUI();
			component.selectBox(".bttn-dropdown", 250);
			
			/* 페이지 로딩 시 조회 */
			try {
				if(null !== sessionStorage.getItem("mPress")) {
					var obj = JSON.parse(sessionStorage.getItem("mPress"));
					var seq = (typeof obj.url !== 'undefined') ? obj.url.substring(obj.url.lastIndexOf('/') + 1) : 0;
					if(Number(seq) === Number('<c:out value="${pressPrevPageSeq}"/>')) {
						press().back();
					} else {
						press().get({ u : 'list' });
					}
				} else {
					press().get({ u : 'list' });
				}

			} catch(e) {}
			
			
		</script>
	</body>
</html>