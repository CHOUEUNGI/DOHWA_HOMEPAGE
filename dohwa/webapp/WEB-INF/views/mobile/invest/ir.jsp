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
					<div class="page-visual invest01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" /></h2>
							<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></em> --%>
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
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/eAnno" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
								<li class="active"><a class="item" href="<c:url value="${mobileStartPath}invest/ir" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
								<li><a class="item" href="<c:url value="${mobileStartPath}invest/stock" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
							</ul>
							<!--e: 20200903 depth 메뉴명 변경-->
						</div>
					</div>
					<!-- s: 20200903 depth3 탭 추가-->
						<div class="tab-menu-type02">
							<ul class="tab-list tab-list-3depth">
								<li class="active">
									<a class="item" href="#none"><span class="txt" data-id="">IR Book</span></a>
								</li>
								<li>
									<a class="item" href="#none"><span class="txt" data-id="">Annual Report</span></a>
								</li>
								<li>
									<a class="item" href="#none"><span class="txt" data-id="">Analyst Report</span></a>
								</li>
							</ul>
						</div>
						<!-- e: 20200903 depth3 탭 추가-->
					<div class="contents">
						<div class="section-cont">
							<div class="down-box-wrap" id="box_ir">
								<!-- <div class="down-box">
									<a class="btn-down-box" href="#none">
										<strong class="down-box-tit">
											<span class="line-clamp">
												2020년 도화엔지니어링 1Q IR Book
											</span>
										</strong>
										<span class="bttn bttn-download">
											<em class="ico download" aria-hidden="true"></em>
											다운로드
										</span>
									</a>
								</div> -->
							</div>
							<div class="board-list-btns more" style="display:none">
								<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('ir', 'box_ir')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
							</div>
						</div>
					</div>
					<div class="contents">
						<div class="section-cont">
							<div class="down-box-wrap" id="box_annr">
								<!-- <div class="down-box">
									<a class="btn-down-box" href="#none">
										<strong class="down-box-tit">
											<span class="line-clamp">
												2020년
												<br />
												도화엔지니어링
												<br />
												제 58기 영업보고서
											</span>
										</strong>
										<span class="bttn bttn-download">
											<em class="ico download" aria-hidden="true"></em>
											다운로드
										</span>
									</a>
								</div> -->
							</div>
							<div class="board-list-btns more" style="display:none">
								<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('anar', 'box_annr')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
							</div>
						</div>
					</div>
					<div class="contents">
						<div class="section-cont">
							<ul class="board-list"  id="li_anar">
								<!-- <li class="list-item">
									<span class="txt-top">2020-05-18</span>
									<p class="txt-title"><span class="line-clamp">현대차증권 리서치 리포트</span></p>
									<a class="bttn bttn-download" href="#none">
										<em class="ico download"></em>
										다운로드
									</a>
								</li> -->
							</ul>
							<div class="board-list-btns more" style="display:none">
								<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('anar', 'li_anar')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
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
			component.tabContent(".tab-list-3depth", ".contents");

			$(".tab-list .item").on("click", function() {
				setTimeout(function() {
					contentsGridFunction.reset();
				}, 0);
			});
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				getInvRef("ir", "box_ir");		//IR Book
				getInvRef("annr", "box_annr");	//Annual Report
				getInvRef("anar", "li_anar");	//Analyst Report
			});
		});
		</script>
	</body>
</html>