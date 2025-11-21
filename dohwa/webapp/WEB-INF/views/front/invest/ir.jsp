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
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual invest01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.INVEST.000" text="INVESTORS" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.INVEST" text="투자정보" /></h2>
							<!-- s: 20200814 추가 -->
							<%-- <em class="title-depth2"><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></em> --%>
							<!-- e: 20200814 추가 -->
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
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<!--s: 20200903 depth 메뉴명 변경-->
								<c:choose>
									<c:when test="${'ko' eq _lang}">
										<ul class="tab-list">
											<li><a class="item" href="<c:url value="/invest/director" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.005" text="경영정보" /></a></li>
											<li><a class="item" href="<c:url value="/invest/finance" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
											<li><a class="item" href="<c:url value="/invest/eAnno" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
											<li class="active"><a class="item" href="<c:url value="/invest/ir" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
											<li><a class="item" href="<c:url value="/invest/stock" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="tab-list">
											<li><a class="item" href="<c:url value="/invest/finance" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.001" text="재무정보" /></a></li>
											<li><a class="item" href="<c:url value="/invest/eAnno" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.002" text="전자공고 및 공시" /></a></li>
											<li class="active"><a class="item" href="<c:url value="/invest/ir" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.003" text="IR 자료실" /></a></li>
											<li><a class="item" href="<c:url value="/invest/stock" />" data-id=""><spring:message code="FRONT.COMMON.MENU.INVEST.004" text="주식 및 주주정보" /></a></li>
										</ul>
									</c:otherwise>
								</c:choose>						
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
						<div class="contents clfix">
							<span class="page-decs">
								<strong>03 INVESTORS</strong>
								DOHWA ENGINEERING
							</span>
							<div class="section-cont">
								<div class="down-box-wrap" id="box_ir"></div>
								<div class="down-box-wrap more" style="display:none; text-align: center; margin-top: 60px;">
									<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('ir', 'box_ir')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
								</div>
							</div>
						</div>
						<div class="contents clfix">
							<span class="page-decs">
								<strong>03 INVESTORS</strong>
								DOHWA ENGINEERING
							</span>
							<div class="section-cont">
								<div class="table-wrap-type01">
									<table class="table-col-type02">
										<caption>
											<span class="txt01">Annual Report</span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.001" text="제목" /></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.002" text="파일" /></span>
										</caption>
										<colgroup>
											<col style="width:80%" />
											<col />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.003.001.001" text="제목" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.003.001.002" text="파일" /></th>
											</tr>
										</thead>
										<tbody id="list_annr">
											<!-- <tr>
												<td class="left"><span class="line-clamp">제58기 결산공고</span></td>
												<td>
													<a class="bttn-download" href="#none">
														<em class="ico download"></em>
														다운로드
													</a>
												</td>
											</tr> -->
										</tbody>
									</table>
									<div class="table-btn-wrap more" style="display:none">
										<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('annr', 'list_annr')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
									</div>
								</div>
							</div>
						</div>
						<div class="contents clfix">
							<span class="page-decs">
								<strong>03 INVESTORS</strong>
								DOHWA ENGINEERING
							</span>
							<div class="section-cont">
								<div class="table-wrap-type01">
									<table class="table-col-type02">
										<caption>
											<span class="txt01">Annual Report</span>
											<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.001" text="제목" /></span>
											<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.002" text="파일" /></span>
											<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.INVEST.003.001.003" text="발간일" /></span>
										</caption>
										<colgroup>
											<col style="width:73%" />
											<col style="width:13%" />
											<col />
										</colgroup>
										<thead>
											<tr>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.003.001.001" text="제목" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.003.001.002" text="파일" /></th>
												<th><spring:message code="FRONT.COMMON.MENU.INVEST.003.001.003" text="발간일" /></th>
											</tr>
										</thead>
										<tbody id="list_anar"></tbody>
									</table>
									<div class="table-btn-wrap more" style="display:none">
										<button class="bttn type01 style01" type="button" title="목록 더보기" onclick="getInvRef('anar', 'list_anar')"><span class="txt01"><spring:message code="FRONT.COMMON.BUTTON.MORE" text="더보기" /></span></button>
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
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
		<%--// 퍼블파트에서 작성한 JS  --%>
		<script>
			var component = new ComponentUI();
			component.tabContent(".tab-list-3depth", ".contents");
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				getInvRef("ir", "box_ir");		//IR Book
				getInvRef("annr", "list_annr");	//Annual Report
				getInvRef("anar", "list_anar");	//Analyst Report
			});
		});
		</script>
	</body>
</html>