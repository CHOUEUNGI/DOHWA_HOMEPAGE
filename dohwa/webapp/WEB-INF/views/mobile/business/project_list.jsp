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
		<div class="business" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual business01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.BUSINESS.001.001" text="BUSINESS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.002" text="사업소개" /></h2>
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
								<li><a class="item" href="<c:url value="${mobileStartPath}business" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.003" text="Overview" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}business/project" />" data-id=""><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.004" text="Project" /></a></li>
							</ul>
						</div>
					</div>
					<div class="contents full-type business-cont-wrap">
						<div class="section-cont first-cont">
							<div class="filter-btn-wrap">
								<button class="bttn-filter" type="button">
									<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.007" text="SMART FILTER" /></span>
									<em class="ico ico-filter" aria-hidden="true"></em>
								</button>
							</div>
							<div class="project-list-wrap">
								<div class="list-type-thumbnail">
									<ul class="clfix list-thumbnail"></ul>
									<div class="bttn-area center _more_div">
										<a class="bttn type01 style02 _more" href="javascript:void(0);" role="button">
											<span class="ico more"></span>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.015" text="더보기" /></span>
										</a>
									</div>
								</div>
							</div>
							<div class="filter-wrap">
								<div class="filter-inner">
									<div class="filter-cont-area">
										<div class="filter-list-cont">
											<div class="filter-list-tit">
												<button class="bttn-filter-tit" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.008" text="Market" /></button>
											</div>
											<div class="filter-list-wrap">
												<div class="filter-list-box">
													<ul class="filter-list-depth01">

													<c:set var="depth01Index" value="0" />
													<c:forEach var="depth01" items="${projectItemList}" varStatus="status">
													<c:if test="${'PROJECT_ITEM' ne depth01.parentCode && 'MARKET' eq depth01.parentCode}">
														<li class="filter-depth01-item <c:if test="${0 == depth01Index}">active</c:if>">
															<button class="filter-btn" type="button" data-code="<c:out value="${depth01.code}" />"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></button>
														</li>
														<c:set var="depth01Index" value="${depth01Index + 1}" />
													</c:if>
													</c:forEach>

													</ul>
												</div>
												<div class="filter-list-box depth-box open">

												<c:set var="depth01Index" value="0" />
												<c:forEach var="depth01" items="${projectItemList}">
												<c:if test="${'PROJECT_ITEM' ne depth01.parentCode && 'MARKET' eq depth01.parentCode}">
													<ul class="filter-list-depth02 ui-checkbox-ul <c:if test="${0 == depth01Index}">active</c:if>">

													<c:set var="depth02Index" value="0" />
													<c:forEach var="depth02" items="${projectItemList}">
													<c:if test="${depth01.code eq depth02.parentCode}">
														<c:if test="${0 == depth02Index}">
														<li class="filter-depth02-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel value-01 chkAll" type="checkbox" id="chk-group-1-all-<c:out value="${depth01Index}"/>" data-code="<c:out value="${depth01.code}" />" />
																<label class="filter-txt" for="chk-group-1-all-<c:out value="${depth01Index}"/>"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></label>
															</span>
														</li>
														</c:if>
														<li class="filter-depth02-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel value-04 chkEtc" type="checkbox" id="chk-group-1-etc-<c:out value="${depth01Index}"/>-<c:out value="${depth02Index}"/>" data-code="<c:out value="${depth02.code}" />" />
																<label class="filter-txt" for="chk-group-1-etc-<c:out value="${depth01Index}"/>-<c:out value="${depth02Index}"/>"><c:out value="${'ko' eq _lang ? depth02.koText : 'en' eq _lang ? depth02.enText : 'es' eq _lang ? depth02.esText : ''}" /></label>
															</span>
														</li>
														<c:set var="depth02Index" value="${depth02Index + 1}" />
													</c:if>
													</c:forEach>
													</ul>
													<c:set var="depth01Index" value="${depth01Index + 1}" />
												</c:if>
												</c:forEach>

												</div>
											</div>
										</div>
										<div class="filter-list-cont">
											<div class="filter-list-tit">
												<button class="bttn-filter-tit" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.010" text="Service" /></button>
											</div>
											<div class="filter-list-wrap">
												<div class="filter-list-box full-box">
													<ul class="filter-list-depth01 ui-checkbox-ul">

													<c:set var="depth01Index" value="0" />
													<c:forEach var="depth01" items="${projectItemList}">
													<c:if test="${'PROJECT_ITEM' ne depth01.parentCode && 'SERVICE' eq depth01.parentCode}">
														<c:if test="${0 == depth01Index}">
														<li class="filter-depth01-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel chkAll" type="checkbox" id="chk-group-2-all-<c:out value="${depth01Index}"/>" />
																<label class="filter-txt" for="chk-group-2-all-<c:out value="${depth01Index}"/>"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></label>
															</span>
														</li>
														</c:if>
														<li class="filter-depth01-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel value-02 chkEtc" type="checkbox" id="chk-group-2-etc-<c:out value="${depth01Index}"/>" data-code="<c:out value="${depth01.code}" />" />
																<label class="filter-txt" for="chk-group-2-etc-<c:out value="${depth01Index}"/>"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></label>
															</span>
														</li>
														<c:set var="depth01Index" value="${depth01Index + 1}" />
													</c:if>
													</c:forEach>

													</ul>
												</div>
											</div>
										</div>
										<div class="filter-list-cont">
											<div class="filter-list-tit">
												<button class="bttn-filter-tit" type="button"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.011" text="Region" /></button>
											</div>
											<div class="filter-list-wrap">
												<div class="filter-list-box">
													<ul class="filter-list-depth01">

													<c:set var="depth01Index" value="0" />
													<c:forEach var="depth01" items="${projectItemList}" varStatus="status">
													<c:if test="${'PROJECT_ITEM' ne depth01.parentCode && 'REGION' eq depth01.parentCode}">
														<li class="filter-depth01-item <c:if test="${0 == depth01Index}">active</c:if>">
															<button class="filter-btn" type="button" data-code="<c:out value="${depth01.code}" />"><c:out value="${'ko' eq _lang ? depth01.koText : 'en' eq _lang ? depth01.enText : 'es' eq _lang ? depth01.esText : ''}" /></button>
														</li>
														<c:set var="depth01Index" value="${depth01Index + 1}" />
													</c:if>
													</c:forEach>

													</ul>
												</div>
												<div class="filter-list-box depth-box open">

												<c:set var="depth01Index" value="0" />
												<c:forEach var="depth01" items="${projectItemList}">
												<c:if test="${'PROJECT_ITEM' ne depth01.parentCode && 'REGION' eq depth01.parentCode}">
													<ul class="filter-list-depth02 ui-checkbox-ul <c:if test="${0 == depth01Index}">active</c:if>">

													<c:set var="depth02Index" value="0" />
													<c:forEach var="depth02" items="${projectItemList}">
													<c:if test="${depth01.code eq depth02.parentCode}">
														<c:if test="${0 == depth02Index}">
														<li class="filter-depth02-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel value-03 chkAll" type="checkbox" id="chk-group-3-all-<c:out value="${depth01Index}"/>" data-code="<c:out value="${depth01.code}" />" />
																<label class="filter-txt" for="chk-group-3-all-<c:out value="${depth01Index}"/>"><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.009" text="전체" /></label>
															</span>
														</li>
														</c:if>
														<li class="filter-depth02-item">
															<span class="input-checkbox right">
																<input class="bttn-filter-sel value-05 chkEtc" type="checkbox" id="chk-group-3-etc-<c:out value="${depth01Index}"/>-<c:out value="${depth02Index}"/>" data-code="<c:out value="${depth02.code}" />" />
																<label class="filter-txt" for="chk-group-3-etc-<c:out value="${depth01Index}"/>-<c:out value="${depth02Index}"/>"><c:out value="${'ko' eq _lang ? depth02.koText : 'en' eq _lang ? depth02.enText : 'es' eq _lang ? depth02.esText : ''}" /></label>
															</span>
														</li>
														<c:set var="depth02Index" value="${depth02Index + 1}" />
													</c:if>
													</c:forEach>
													</ul>
													<c:set var="depth01Index" value="${depth01Index + 1}" />
												</c:if>
												</c:forEach>

												</div>
											</div>
										</div>
									</div>
									<div class="filter-bttn-area">
										<button class="bttn-reset" type="button"><span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.012" text="초기화" /></span></button>
										<button class="bttn-search" type="button">
											<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.013" text="선택 값으로 검색" /></span>
											<em class="ico ico-search"></em>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
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

			var SmartFilter = function() {
				var filterBtn, filterWrap, filterList;

				var dimm;

				var valObj;

				var zIndex;
				
				this.init = function() {
					filterBtn = $(".bttn-filter");
					filterWrap = $(".filter-wrap");
					filterList = filterWrap.find(".filter-list-cont");

					valObj = {
						type1: [],
						type2: [],
						type3: [],
						type4: [],
						type5: []
					};

					dimm = $(".dimm");

					zIndex = 0;
					
					setValue();

					// control filter wrap
					filterBtn.on("click", function() {
						openWrap();
					});

					dimm.on("click", function() {
						closeWrap();
					});

					// work for each list
					for (var _i = 0; _i < filterList.length; _i++) {
						(function(_i) {
							var currentList = filterList.eq(_i),
								filterListBtn = currentList.find(".bttn-filter-tit");

							// active current list
							filterListBtn.on("click", function() {
								activeList(currentList);
							});

							// active 1depth, 2depth of current list
							currentList.find(".filter-depth01-item").on("click", function() {
								var _thisIndex = $(this).index();

								active1depth(currentList, _thisIndex);
								active2depth(currentList, _thisIndex);
							});

							// click check all btn
							currentList.find(".bttn-filter-sel.chkAll").on("click", function() {
								checkAllBtn($(this));
							});

							// click check btn
							currentList.find(".bttn-filter-sel.chkEtc").on("click", function() {
								checkBtn($(this));
							});
						})(_i);
					}

					// click init btn
					$(".bttn-reset").on("click", function() {
						_reset();
					});

					// click search btn
					$(".bttn-search").on("click", function() {
						_getResultValue();
						_project().search();
					});

					// 더보기
					$('a._more').off('click').on("click", function() {
						_project().more();
					});

					// 상세
					$('ul.list-thumbnail').off('click').on("click", '[data-href]', function() {
						_project().view($(this).data('href'));
					});
				};

				this.reset = function() {
					_reset();
				};

				// 활성화할 버튼의 data-index 값을 넣어주세요.
				// ex) smartFilter.activeBtn('001');
				this.activeBtn = function(code) {
					$("[data-index=" + code + "]")
						.prop("checked", true)
						.addClass("checked");
				};

				this.getResultValue = function() {
					return _getResultValue();
				};

				function setValue() {
					filterList = $(".filter-wrap .filter-list-cont");

					filterList.each(function(i) {
						var _currentList = $(this);

						var _defaultValue = "";
						_indexValue = i;
						_btnWrap = _currentList.find(".ui-checkbox-ul");

						_btnWrap.each(function() {
							// 전체 버튼 인덱스
							var _thisWrap = $(this),
								_chkAll = _thisWrap.find(".chkAll"),
								_chkEtc = _thisWrap.find(".chkEtc");

							var _chkAllValue;

							_defaultValue += "0";
							_chkAllValue = _defaultValue + (_indexValue + 1);

							_chkAll.attr("data-index", _chkAllValue);

							// 그 이외의 버튼 인덱스
							_chkEtc.each(function(_btnIndex) {
								_chkEtcValue = _chkAllValue + (_btnIndex + 1);

								$(this).attr("data-index", _chkEtcValue);
							});
						});
					});
				}

				function _getResultValue() {
					valObj.type1 = [];
					var activeBtn01 = filterWrap.find(".value-01.checked");
					for (var _i = 0; _i < activeBtn01.length; _i++) {
						var activeIndex = activeBtn01.eq(_i).attr("data-code");
						valObj.type1.push(activeIndex);
					}

					valObj.type2 = [];
					var activeBtn02 = filterWrap.find(".value-02.checked");
					for (var _i = 0; _i < activeBtn02.length; _i++) {
						var activeIndex = activeBtn02.eq(_i).attr("data-code");
						valObj.type2.push(activeIndex);
					}

					valObj.type3 = [];
					var activeBtn03 = filterWrap.find(".value-03.checked");
					for (var _i = 0; _i < activeBtn03.length; _i++) {
						var activeIndex = activeBtn03.eq(_i).attr("data-code");
						valObj.type3.push(activeIndex);
					}

					valObj.type4 = [];
					var activeBtn04 = filterWrap.find(".value-04.checked");
					for (var _i = 0; _i < activeBtn04.length; _i++) {
						var activeIndex = activeBtn04.eq(_i).attr("data-code");
						valObj.type4.push(activeIndex);
					}

					valObj.type5 = [];
					var activeBtn05 = filterWrap.find(".value-05.checked");
					for (var _i = 0; _i < activeBtn05.length; _i++) {
						var activeIndex = activeBtn05.eq(_i).attr("data-code");
						valObj.type5.push(activeIndex);
					}

					var tempType4 = valObj.type4.slice(0, valObj.type4.length);
					for(var i in valObj.type1) {
						var item1 = valObj.type1[i];
						for(var j in tempType4) {
							var item2 = tempType4[j];
							if(-1 < item2.indexOf(item1)) {
								valObj.type4.splice(item2.indexOf(item1), 1);
							}
						}
					}

					var tempType5 = valObj.type5.slice(0, valObj.type5.length);
					for(var i in valObj.type3) {
						var item1 = valObj.type3[i];
						for(var j in tempType5) {
							var item2 = tempType5[j];
							if(-1 < item2.indexOf(item1)) {
								valObj.type5.splice(item2.indexOf(item1), 1);
							}
						}
					}

					return valObj;
				}

				function openWrap() {
					disabledScroll();

					filterWrap.addClass("open").css("z-index", 101);
					TweenMax.fromTo(filterWrap, 0.8, { y: filterWrap.height() }, { y: 0, ease: Power4.easeOut });

					TweenMax.fromTo(dimm, 0.8, { opacity: 0, display: "block" }, { opacity: 0.6, ease: Power4.easeOut });
				}

				function closeWrap() {
					activeScroll();

					TweenMax.to(filterWrap, 0.8, {
						y: filterWrap.height(),
						ease: Power4.easeOut,
						onComplete: function() {
							filterWrap.removeClass("open");
						}
					});

					TweenMax.to(dimm, 0.8, { opacity: 0, display: "none", ease: Power4.easeOut });
				}

				function activeList(currentList) {
					if (!currentList.hasClass("open")) {
						filterList.removeClass("open");
						currentList.addClass("open");
					} else {
						filterList.removeClass("open");
					}
				}

				function active1depth(currentList, i) {
					var _depth01 = currentList.find(".filter-depth01-item");

					_depth01.removeClass("active");
					_depth01.eq(i).addClass("active");
				}

				function active2depth(currentList, i) {
					var _depth02 = currentList.find(".filter-list-depth02");

					_depth02.css("opacity", 0);
					_depth02
						.eq(i)
						.addClass("active")
						.css({
							"z-index": ++zIndex,
							opacity: 1
						});
				}

				function checkAllBtn(_thisAllBtn) {
					var _chk = _thisAllBtn.is(":checked");

					if (_chk) {
						_thisAllBtn.addClass("checked");
						_thisAllBtn
							.parents(".ui-checkbox-ul")
							.find(".bttn-filter-sel.chkEtc")
							.prop("checked", true)
							.addClass("checked");
					} else {
						_thisAllBtn.removeClass("checked");
						_thisAllBtn
							.parents(".ui-checkbox-ul")
							.find(".bttn-filter-sel.chkEtc")
							.prop("checked", false)
							.removeClass("checked");
					}
				}

				function checkBtn(_thisBtn) {
					var _chk = _thisBtn.is(":checked");
					var _length = _thisBtn.parents(".ui-checkbox-ul").find(".bttn-filter-sel.chkEtc").length;
					var _chkLength;

					if (_chk) {
						_thisBtn.addClass("checked");
					} else {
						_thisBtn.removeClass("checked");
					}

					// 활성화된 버튼 갯수에 따른 전체 버튼 컨트롤
					_chkLength = _thisBtn.parents(".ui-checkbox-ul").find(".bttn-filter-sel.chkEtc.checked").length;

					if (_chkLength < _length) {
						_thisBtn
							.parents(".ui-checkbox-ul")
							.find(".bttn-filter-sel.chkAll")
							.prop("checked", false)
							.removeClass("checked");
					} else {
						_thisBtn
							.parents(".ui-checkbox-ul")
							.find(".bttn-filter-sel.chkAll")
							.prop("checked", true)
							.addClass("checked");
					}
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
					filterList
						.find(".bttn-filter-sel")
						.prop("checked", false)
						.removeClass("checked");
					
					_searchType = '';
					window.history.pushState("", "", window.location.pathname);
				}

				function disabledScroll() {
					$("html, body").css("overflow", "hidden");
				}

				function activeScroll() {
					$("html, body").removeAttr("style");
				}

				this.projectBack = function () {
					_project().back();
				};

				this.projectSearch = function () {
					_project().search();
				};

				function _project() {

					function removeStorage() {
						if(null !== sessionStorage.getItem("mProject")) {
							sessionStorage.removeItem("mProject");
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

						if($('div.filter-wrap').hasClass('open')) {
							_searchType = '';
							window.history.pushState("", "", window.location.pathname);

							$('div.dimm').trigger('click');
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

						$('ul.list-thumbnail').empty();

						removeStorage();

						if(!$('._more_div').is(':visible')) {
							$('._more_div').show();
						}
						
						get({ path : '/list'});
					}

					// 상세에서 왔을때
					function back() {
						var obj = JSON.parse(sessionStorage.getItem("mProject"));
						sessionStorage.removeItem("mProject");
						
						_checked = true;
						_type1 = obj.type1;
						_type2 = obj.type2;
						_type3 = obj.type3;
						_type4 = obj.type4;
						_type5 = obj.type5;
						_c = 0;
						_r = 0 === obj.r ? Number(_rpp) : 0 !== obj.c ? (obj.c + Number(_rpp)) : obj.r;

						$('ul.list-thumbnail').empty();

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
						sessionStorage.setItem("mProject",
							JSON.stringify({ c : _c, r : _r, url : url,
											 type1 : _type1, type2 : _type2,
											 type3 : _type3, type4 : _type4, type5 : _type5}));

						window.location.href = url;
					}

					// 조회
					function get(o) {
						$.ajax({
							url : '${mobileStartPath}business/project' + o.path,
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
						var s = '';
						if(typeof data.list !== 'undefined' && 0 == data.list.length) {
							_c = _c - Number(_rpp);
						}

						if(typeof data.list !== 'undefined' && 0 < data.list.length) {
							for(var i in data.list) {
								var item = data.list[i];

								s += '<li class="list-item">';
								s += 	'<a class="list-link" href="javascript:void(0);" data-href="<c:url value="${mobileStartPath}business/project/" />'+ item.seq +'" title="<spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.014" text="자세히 보기" />">';
								s += 		'<div class="list-img-wrap"><img src="<c:url value="${WEB_URL}" />'+ item.mainFileName2 +'" alt="'+ item.ml.title +'" /></div>';
								s += 		'<div class="list-txt"><span class="line-clamp">'+ item.ml.title +'</span></div>';
								s +=	'</a>';
								s += '</li>';
							}

						} else if((typeof data.list === 'undefined' || 0 === data.list.length) && 0 === $('ul.list-thumbnail li').length) {
							s += '<li class="no-data">';
							s += 	'<i class="ico-nodata"></i>';
							s += 	'<span><spring:message code="FRONT.COMMON.MENU.BUSINESS.002.001.016" text="검색 결과가 없습니다." /></span>';
							s += '</li>';

							$('._more_div').hide();
						}
						
						var currScrollTop = $(document).scrollTop();
						$('ul.list-thumbnail').append(s);

						if(typeof data.list !== 'undefined' && data.count <= $('ul.list-thumbnail li').length) {
							$('._more_div').hide();
						}
						
						$(window).trigger('resize');
						
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
							$('.filter-wrap').find('.bttn-filter-sel.value-01').each(function() {
								var input = $(this);
								var code = $(input).data('code');
								for(var i in _t1) {
									var item = _t1[i];
									if(code === item) {
										$(input).prop('checked', true);
										$(input).closest('ul').find('input.value-04').prop('checked', true);
									}
								}
							});
						} else {
							$('.filter-wrap').find('.bttn-filter-sel.value-04').each(function() {
								var input = $(this);
								var code = $(input).data('code');
								for(var i in _t4) {
									var item = _t4[i];
									if(code === item) {
										$(input).prop('checked', true);
									}
								}
							});
						}

						// SERVICE
						if(0 < _t2.length) {
							$('.filter-wrap').find('.bttn-filter-sel.value-02').each(function() {
								var input = $(this);
								var code = $(input).data('code');
								for(var i in _t2) {
									var item = _t2[i];
									if(code === item) {
										$(input).prop('checked', true);
										//$(input).closest('ul').find('input.value-02').prop('checked', true);
									}
								}
							});
						}

						// REGION
						if(0 < _t3.length) {
							$('.filter-wrap').find('.bttn-filter-sel.value-03').each(function() {
								var input = $(this);
								var code = $(input).data('code');
								for(var i in _t3) {
									var item = _t3[i];
									if(code === item) {
										$(input).prop('checked', true);
										$(input).closest('ul').find('input.value-05').prop('checked', true);
									}
								}
							});
						} else {
							$('.filter-wrap').find('.bttn-filter-sel.value-05').each(function() {
								var input = $(this);
								var code = $(input).data('code');
								for(var i in _t5) {
									var item = _t5[i];
									if(code === item) {
										$(input).prop('checked', true);
									}
								}
							});
						}
					}

					return {
						more : more,
						search : search,
						back : back,
						view : view,
						removeStorage : removeStorage
					}
				}
			};

			window.smartFilter = new SmartFilter();
			smartFilter.init();

			try {

				if(null !== sessionStorage.getItem("mProject")) {
					var obj = JSON.parse(sessionStorage.getItem("mProject"));
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