<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
		<div class="business" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual business01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.002" text="사업소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.017" text="Scroll" /></span>
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
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<li><a class="item" href="<c:url value="/business" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.003" text="Overview" /></a></li>
									<li class="active"><a class="item" href="<c:url value="/business/project" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.004" text="Project" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents business-cont-wrap clfix">
							<span class="page-decs">
								<strong>02 <spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont first-cont">
								<div class="filter-wrap">
									<button class="bttn-filter" type="button">
										<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.007" text="SMART FILTER" /></span>
										<em class="ico ico-filter" aria-hidden="true"></em>
									</button>
									<div class="filter-inner">
										<div class="filter-cont-area">
											<div class="filter-list-cont _market">
												<div class="filter-list-tit">
													<strong><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.008" text="Market" /></strong>
													<button class="filter-all" type="button">
														<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></span>
													</button>
												</div>
												<ul class="filter-list-wrap">
													<c:forEach var="depth01" items="${projectItemList}">
													<c:if test="${'PROJECT_ITEM' ne depth01.parentCode}">
														<c:if test="${'MARKET' eq depth01.parentCode}">
															<li class="filter-list">
																<div class="filter-depth01-item value-01">
																	<button class="bttn-filter-sel" type="button" data-code="<c:out value="${depth01.code}" />">
																		<span class="filter-txt"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></span>
																	</button>
																</div>

																<c:set var="colCount" value="0" />
																<c:forEach var="depth02" items="${projectItemList}" varStatus="status">
																	<c:if test="${depth01.code eq depth02.parentCode}">
																	<c:set var="colCount" value="${colCount + 1}" />
																	</c:if>
																</c:forEach>

																<c:set var="strColCount">${colCount}</c:set>
																<ul class="filter-list-depth02 col-<c:if test="${1 == fn:length(strColCount)}">0</c:if><c:out value="${strColCount}" /> value-04">
																<c:forEach var="depth02" items="${projectItemList}">
																	<c:if test="${depth01.code eq depth02.parentCode}">
																	<li class="filter-depth02-item">
																		<button class="bttn-filter-sel" type="button" data-code="<c:out value="${depth02.code}" />">
																			<span class="filter-txt"><c:out value="${'ko' eq _lang ? depth02.koText : 'en' eq _lang ? depth02.enText : 'es' eq _lang ? depth02.esText : ''}" /></span>
																		</button>
																	</li>
																	</c:if>
																</c:forEach>
																</ul>
															</li>
														</c:if>
													</c:if>
													</c:forEach>
												</ul>
											</div>
											<div class="filter-list-cont _service">
												<div class="filter-list-tit">
													<strong><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.010" text="Service" /></strong>
													<button class="filter-all" type="button">
														<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></span>
													</button>
												</div>
												<ul class="filter-list-wrap col-06">
													<c:forEach var="depth01" items="${projectItemList}">
													<c:if test="${'SERVICE' eq depth01.parentCode}">
													<li class="filter-list">
														<div class="filter-depth01-item value-02">
															<button class="bttn-filter-sel" type="button" data-code="<c:out value="${depth01.code}" />">
																<span class="filter-txt"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></span>
															</button>
														</div>
													</li>
													</c:if>
													</c:forEach>
												</ul>
											</div>
											<div class="filter-list-cont _region">
												<div class="filter-list-tit">
													<strong><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.011" text="Region" /></strong>
													<button class="filter-all" type="button">
														<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></span>
													</button>
												</div>
												<ul class="filter-list-wrap">
												<c:forEach var="depth01" items="${projectItemList}">
												<c:if test="${'PROJECT_ITEM' ne depth01.parentCode}">
													<c:if test="${'REGION' eq depth01.parentCode}">
														<li class="filter-list">
															<div class="filter-depth01-item value-03">
																<button class="bttn-filter-sel" type="button" data-code="<c:out value="${depth01.code}" />">
																	<span class="filter-txt"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></span>
																</button>
															</div>
															<ul class="filter-list-depth02 value-05">
															<c:forEach var="depth02" items="${projectItemList}">
																<c:if test="${depth01.code eq depth02.parentCode}">
																<li class="filter-depth02-item">
																	<button class="bttn-filter-sel" type="button" data-code="<c:out value="${depth02.code}" />">
																		<span class="filter-txt"><c:out value="${'ko' eq _lang ? depth02.koText : 'en' eq _lang ? depth02.enText : 'es' eq _lang ? depth02.esText : ''}" /></span>
																	</button>
																</li>
																</c:if>
															</c:forEach>
															</ul>
														</li>
													</c:if>
												</c:if>
												</c:forEach>
												</ul>
											</div>
										</div>
										<div class="filter-bttn-area">
											<button class="bttn-reset" type="button">
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.012" text="초기화" /></span>
												<em class="ico ico-reset"></em>
											</button>
											<button class="bttn-search" type="button">
												<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.013" text="선택 값으로 검색" /></span>
												<em class="ico ico-search"></em>
											</button>
										</div>
									</div>
								</div>
								<div class="project-list-wrap">
									<div class="list-type-thumbnail">
										<ul></ul>
										<div class="bttn-area center _more_div">
											<a class="bttn type01 style01 _more" href="javascript:void(0);" role="button"><span class="txt01"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.015" text="더보기" /></span></a>
										</div>
									</div>
								</div>
							</div>
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
			//- overview project 영역 images size
			$(".business-project-slide .slide").each(function() {
				var $this = $(this),
					$box = $this.find(".list-img-wrap"),
					$img = $this.find(".list-link").find("img"),
					divAspect = $box.height() / $box.width(),
					imgAspect = $img.height() / $img.width();
				if (imgAspect <= divAspect) {
					//가로가 긴 경우 세로를 박스에 맞추고 가로 크롭
					$img.addClass("img-w");
				} else {
					//세로가 긴 경우 가로를 박스에 맞추고 세로 크롭
					$img.addClass("img-h");
				}
			});
			//- project 목록 images size
			$(".list-type-thumbnail li").each(function() {
				var $this = $(this),
					$box = $this.find(".list-img-wrap"),
					$img = $this.find(".list-link").find("img"),
					divAspect = $box.height() / $box.width(),
					imgAspect = $img.height() / $img.width();
				if (imgAspect <= divAspect) {
					//가로가 긴 경우 세로를 박스에 맞추고 가로 크롭
					$img.addClass("img-w");
				} else {
					//세로가 긴 경우 가로를 박스에 맞추고 세로 크롭
					$img.addClass("img-h");
				}
			});

			//필터 검색기능
			var SmartFilter = function() {
				var el, openBtn, filterListCont, resetBtn, selectSearch;
				var valObj;

				this.init = function() {
					el = $(".filter-wrap");
					openBtn = el.children(".bttn-filter");
					filterListCont = el.find(".filter-list-cont");
					resetBtn = el.find(".bttn-reset");
					selectSearch = el.find(".bttn-search");

					valObj = {
						type1: [],
						type2: [],
						type3: [],
						type4: [],
						type5: []
					};

					// 각 섹션별 작업
					filterListCont.each(function(_i) {
						// 섹션 내부의 리스트를 기준으로 버튼에 인덱스를 지정.
						_setBtnIndexInFilterListCont(filterListCont.eq(_i), _i);
						// 섹션 내부의 버튼 active / inactive.
						_btnControl(filterListCont.eq(_i));
					});

					// smart filter 열고 닫기
					openBtn.on("click", function() {
						if (!el.hasClass("open")) {
							el.addClass("open");
						} else {
							el.removeClass("open");
// 							_reset();
						}
					});

					// 초기화 버튼
					resetBtn.on("click", function() {
						_reset();
					});

					// 선택값 검색
					selectSearch.on("click", function() {
						_getResultValue();
						_project().search();
					});

					// 더보기
					$('a._more').off('click').on("click", function() {
						_project().more();
					});

					// 상세
					$('div.list-type-thumbnail ul').off('click').on("click", '[data-href]', function() {
						_project().view($(this).data('href'));
					});
				};

				this.reset = function() {
					_reset();
				};

				// 활성화할 버튼의 data-index 값을 넣어주세요.
				// ex) smartFilter.activeBtn('001');
				this.activeBtn = function(code) {
					$("[data-index=" + code + "]").addClass("active");
				};

				this.getResultValue = function() {
					return _getResultValue();
				};

				// 섹션 내부의 리스트를 기준으로 버튼에 인덱스를 지정.
				// 리스트별 버튼 depth1 , depth2 를 가져옴.
				// 섹션 -> 리스트 -> 버튼 순으로 타고 들어감.
				function _setBtnIndexInFilterListCont(_cont, _contIndex) {
					var _filterListCont = $(_cont);
					var _filterList = _filterListCont.find(".filter-list");
					var defaultRule = "";

					// list
					_filterList.each(function(_listIndex) {
						var _btnDepth1 = _filterList.eq(_listIndex).find(".filter-depth01-item .bttn-filter-sel");
						var _btnDepth2 = _filterList.eq(_listIndex).find(".filter-depth02-item .bttn-filter-sel");

						defaultRule += "0";

						// btn depth1
						var rule01 = defaultRule + (_contIndex + 1);
						_btnDepth1.attr("data-index", rule01);

						// btn depth2
						_btnDepth2.each(function(_btnIndex) {
							var rule02 = rule01 + (_btnIndex + 1);
							_btnDepth2.eq(_btnIndex).attr("data-index", rule02);
						});
					});
				}

				function _getResultValue() {
					valObj.type1 = [];
					var activeBtn01 = $(".value-01").find(".active");
					for (var _i = 0; _i < activeBtn01.length; _i++) {
						var activeIndex = activeBtn01.eq(_i).attr("data-code");
						valObj.type1.push(activeIndex);
					}

					valObj.type2 = [];
					var activeBtn02 = $(".value-02").find(".active");
					for (var _i = 0; _i < activeBtn02.length; _i++) {
						var activeIndex = activeBtn02.eq(_i).attr("data-code");
						valObj.type2.push(activeIndex);
					}

					valObj.type3 = [];
					var activeBtn03 = $(".value-03").find(".active");
					for (var _i = 0; _i < activeBtn03.length; _i++) {
						var activeIndex = activeBtn03.eq(_i).attr("data-code");
						valObj.type3.push(activeIndex);
					}

					valObj.type4 = [];
					var activeBtn04 = $(".value-04").find(".active");
					for (var _i = 0; _i < activeBtn04.length; _i++) {
						var activeIndex = activeBtn04.eq(_i).attr("data-code");
						valObj.type4.push(activeIndex);
					}

					valObj.type5 = [];
					var activeBtn05 = $(".value-05").find(".active");
					for (var _i = 0; _i < activeBtn05.length; _i++) {
						var activeIndex = activeBtn05.eq(_i).attr("data-code");
						valObj.type5.push(activeIndex);
					}

					return valObj;
				}

				// 섹션 내부의 버튼 active / inactive.
				function _btnControl(_cont) {
					var allBtn = _cont.find(".filter-all");
					var listBtn = _cont.find(".filter-depth01-item .bttn-filter-sel");
					var btn = _cont.find(".filter-depth02-item .bttn-filter-sel");

					// 섹션 전체 버튼
					allBtn.on("click", function() {
						var _thisAllBtn = $(this);

						if (!_thisAllBtn.hasClass("active")) {
							_thisAllBtn.addClass("active");
							listBtn.addClass("active");
							btn.removeClass("active").addClass("fake-active");
						} else {
							_thisAllBtn.removeClass("active");
							listBtn.removeClass("active");
							btn.removeClass("fake-active");
						}
					});

					// 리스트 전체 선택 버튼
					listBtn.on("click", function() {
						var _thisListBtn = $(this);
						var _thisBtn = $(this)
							.parent()
							.next(".filter-list-depth02")
							.find(".bttn-filter-sel");

						allBtn.removeClass("active");

						if (!_thisListBtn.hasClass("active")) {
							_thisListBtn.addClass("active");
							_thisBtn.removeClass("active").addClass("fake-active");
						} else {
							_thisListBtn.removeClass("active");
							_thisBtn.removeClass("fake-active");
						}
					});

					// 각 세부 버튼
					btn.on("click", function() {
						var _thisListBtn = $(this)
							.parents(".filter-list")
							.find(".filter-depth01-item .bttn-filter-sel");
						var _thisBtn = $(this);
						var _thisBtnAll = $(this)
							.parents(".filter-list-depth02")
							.find(".bttn-filter-sel");

						allBtn.removeClass("active");
						_thisListBtn.removeClass("active");
						_thisBtnAll.removeClass("fake-active");

						if (!_thisBtn.hasClass("active")) {
							//- _thisBtnAll.removeClass('fake-active active');
							_thisBtn.removeClass("fake-active").addClass("active");
						} else {
							_thisBtn.removeClass("active");
						}

						if ($(this).parents(".filter-list-depth02").find(".bttn-filter-sel.active").length >= _thisBtnAll.length) {
							_thisListBtn.addClass("active");
							_thisBtnAll.removeClass("active").addClass("fake-active");
						}
					});
				}

				var _rpp = '<c:out value="${rpp}"/>';
				var _checked = false;
				var _c = Number(_rpp);
				var _r = Number(_rpp);
				var _type1 = [];
				var _type2 = [];
				var _type3 = [];
				var _type4 = [];
				var _type5 = [];
				var _searchType = '<c:out value="${searchType}"/>';
				function _reset() {
					var activeBtn = el.find(".active");
					activeBtn.removeClass("active");
					$(".bttn-filter-sel").removeClass("fake-active");
					
					_searchType = '';
					window.history.pushState("", "", window.location.pathname);
				}

				this.projectBack = function () {
					_project().back();
				};

				this.projectSearch = function () {
					_project().search();
				};

				function _project() {

					function removeStorage() {
						if(null !== sessionStorage.getItem("project")) {
							sessionStorage.removeItem("project");
						}
					}

					// 검색 버튼
					function search() {
						_type1 = [];
						_type2 = [];
						_type3 = [];
						_type4 = [];
						_type5 = [];

						_type1 = valObj.type1.slice(0, valObj.type1.length);
						_type2 = valObj.type2.slice(0, valObj.type2.length);
						_type3 = valObj.type3.slice(0, valObj.type3.length);
						_type4 = valObj.type4.slice(0, valObj.type4.length);
						_type5 = valObj.type5.slice(0, valObj.type5.length);
						_c = 0;
						_r = Number(_rpp);

						if($('button.bttn-filter').closest('div').hasClass('open')) {
							_searchType = '';
							window.history.pushState("", "", window.location.pathname);
							
							$('button.bttn-filter').closest('div').removeClass('open');
						}

						// overview에서 왔을떄
						if('' !== _searchType && 0 === _type1.length) {
							_type1.push(_searchType);
							setButton({ type1 : [_searchType],
								type2 : [],
								type3 : [],
								type4 : [],
								type5 : [] });
						}

						$('div.list-type-thumbnail ul').empty();

						removeStorage();

						if(!$('._more_div').is(':visible')) {
							$('._more_div').show();
						}
						
						get({ path : '/list'});
					}

					// 상세에서 왔을때
					function back() {
						var obj = JSON.parse(sessionStorage.getItem("project"));
						sessionStorage.removeItem("project");
						
						_checked = true;
						_type1 = obj.type1;
						_type2 = obj.type2;
						_type3 = obj.type3;
						_type4 = obj.type4;
						_type5 = obj.type5;
						_c = 0;
						_r = 0 === obj.r ? Number(_rpp) : 0 !== obj.c ? (obj.c + Number(_rpp)) : obj.r;

						$('div.list-type-thumbnail ul').empty();

						setButton(obj);
						get({ path : '/list', focus : obj.url});
					}

					// 더보기
					function more() {
						// 상세에서 온건지
						if(_checked && 0 === _c) {
							_c = _r;
							_checked = false;
						} else {
							_c += Number(_rpp);
						}

						_r = Number(_rpp);

						removeStorage();

						get({ path : '/more', type : '' });
					}

					// 상세
					function view(url) {
						sessionStorage.setItem("project",
							JSON.stringify({ c : _c, r : _r, url : url,
											 type1 : _type1, type2 : _type2,
											 type3 : _type3, type4 : _type4, type5 : _type5}));

						window.location.href = url;
					}

					// 조회
					function get(o) {
						$.ajax({
							url : '/business/project' + o.path,
							type : 'post',
							dataType: 'json',
							data: JSON.stringify({
								offsetStartNumber : _c,
								rowPerPage : _r,
								type1 : _type1,
								type2 : _type2,
								type3 : _type3,
								type4 : _type4,
								type5 : _type5
							}),
							contentType: 'application/json',
							success : function(data) {
								set(data, o.type, o.focus);
							},
							error : function(jqXHR) {
								console.log(jqXHR);
							}
						});
					}

					// 추가
					function set(data, type, focus) {
						var firstDataHref = "";
						var s = '';
						if(typeof data.list !== 'undefined' && 0 == data.list.length) {
							_c = _c - Number(_rpp);
						}
						if(typeof data.list !== 'undefined' && 0 < data.list.length) {
							for(var i in data.list) {
								var item = data.list[i];

								s += '<li>';
								s += 	'<a class="list-link" href="javascript:void(0);" data-href="<c:url value="/business/project/" />'+ item.seq +'" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.014" text="자세히 보기" />">';
								s += 		'<div class="list-img-wrap"><img src="<c:url value="${WEB_URL}" />'+ item.mainFileName2 +'" alt="'+ item.ml.title +'" /></div>';
								s += 		'<div class="list-txt"><span class="line-clamp">'+ item.ml.title +'</span></div>';
								s += 		'<em class="bg" aria-hidden="true"></em>';
								s +=	'</a>';
								s += '</li>';
								
								if(i == 0) {
									firstDataHref = '<c:url value="/business/project/" />'+ item.seq;
								}
							}

						} else if((typeof data.list === 'undefined' || 0 === data.list.length) && 0 === $('div.list-type-thumbnail ul li').length) {
							s += '<li class="no-data">';
							s += 	'<i class="ico-nodata"></i>';
							s += 	'<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.016" text="검색 결과가 없습니다." /></span>';
							s += '</li>';

							$('._more_div').hide();
						}
						
						var currScrollTop = $(document).scrollTop();
						$('div.list-type-thumbnail ul').append(s);
						
						if(typeof data.list !== 'undefined' && data.count <= $('div.list-type-thumbnail ul li').length) {
							$('._more_div').hide();
						}
						
						var idx = 0;
						$('div.list-type-thumbnail ul li').not('.on').each(function(i, o) {
							var $this = $(this);
							if(i % 8 === 0) {
								idx = 0;
							}
							
							idx += 85;
							setTimeout(function() {
								$this.addClass('on');
							}, idx);
						});
						
						$(window).trigger('resize');
						
						
						console.log('firstDataHref', firstDataHref);
						
						// 좀 전에 봤던 프로젝트 썸네일 위치로 이동
						if(!StringUtils.isEmpty(focus)){
							$('div.project-list-wrap a.list-link').each(function(){
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

					// 검색 조건
					function setButton(obj) {
						var _t1 = obj.type1;
						var _t2 = obj.type2;
						var _t3 = obj.type3;
						var _t4 = obj.type4;
						var _t5 = obj.type5;

						// MARKET
						if(0 < _t1.length) {
							$('.filter-depth01-item.value-01').find('button').each(function() {
								var button = $(this);
								var code = $(button).data('code');
								for(var i in _t1) {
									var item = _t1[i];
									if(code === item) {
										$(button).addClass('active');
										$('.filter-list-depth02.value-04').find('button[data-code*="'+ code +'"]').addClass('fake-active');
									}
								}
							});
						} else {
							$('.filter-list-depth02.value-04').find('button').each(function() {
								var button = $(this);
								var code = $(button).data('code');
								for(var i in _t4) {
									var item = _t4[i];
									if(code === item) {
										$(button).addClass('active');
									}
								}
							});
						}

						// SERVICE
						if(0 < _t2.length) {
							$('.filter-depth01-item.value-02').find('button').each(function() {
								var button = $(this);
								var code = $(button).data('code');
								for(var i in _t2) {
									var item = _t2[i];
									if(code === item) {
										$(button).addClass('active');
									}
								}
							});
						}

						// REGION
						if(0 < _t3.length) {
							$('.filter-depth01-item.value-03').find('button').each(function() {
								var button = $(this);
								var code = $(button).data('code');
								for(var i in _t3) {
									var item = _t3[i];
									if(code === item) {
										$(button).addClass('active');
										$('.filter-list-depth02.value-05').find('button[data-code*="'+ code +'"]').addClass('fake-active');
									}
								}
							});
						} else {
							$('.filter-list-depth02.value-05').find('button').each(function() {
								var button = $(this);
								var code = $(button).data('code');
								for(var i in _t5) {
									var item = _t5[i];
									if(code === item) {
										$(button).addClass('active');
									}
								}
							});
						}
					}

					return {
						more : more,
						search : search,
						back : back,
						view : view
					}
				}

			};

			window.smartFilter = new SmartFilter();
			smartFilter.init();

			try {

				if(null !== sessionStorage.getItem("project")) {
					var obj = JSON.parse(sessionStorage.getItem("project"));
					var seq = (typeof obj.url !== 'undefined') ? obj.url.substring(obj.url.lastIndexOf('/') + 1) : 0;
					if(Number(seq) === Number('<c:out value="${projectPrevPageSeq}"/>')) {
						smartFilter.projectBack();
					} else {
						smartFilter.projectSearch();
					}
				} else {
					smartFilter.projectSearch();
				}

			} catch(e) {}

		</script>
	</body>
</html>