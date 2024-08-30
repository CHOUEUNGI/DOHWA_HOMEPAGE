<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="intro csr-tipline" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>

			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">

						<form id="form" name="form" action="/speak/result" method="get">

						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
								</ul>
							</div>
						</div>
						<div class="contents clfix">
							<span class="page-decs">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont">
								<!-- s: 20200814 추가 -->
								<div class="tab-menu-type02">
									<ul class="tab-list tab-list-3depth">
										<li><a class="item" href="/aboutus/csr_01"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.003" text="나눔경영" /></span></a></li>
										<li><a class="item" href="/aboutus/csr_02"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.004" text="안전품질경영" /></span></a></li>
										<li class="active"><a class="item" href="#" onclick="return false;"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.005.003.005" text="윤리준법경영" /></span></a></li>
									</ul>
								</div>
								<!-- e: 20200814 추가 -->
								<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.008" text="윤리경영제보라인" /></h2>
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.009" text="이용안내" /></h3>
								<div class="infouse-wrap">
									<p class="title-sub"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.010" text="최고의 기술과 품질을 바탕으로 고객에게 정성을 다하는 기업이 될 것입니다." /></p>
									<p class="infouse-desc">
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.011" text="(주)도화엔지니어링은 윤리경영 실현의 일환으로 당사 임직원의 업무 중 부당행위에 대해 대내외 제보를 받습니다." />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.012" text="제보사항은 윤리경영팀에서 독립적으로 조사합니다. 나아가 제보자 신원은 윤리경영팀장 외 확인 불가하며,제보자가 특별히 서면 동의한 경우와 법령에 의해 요구되는 경우 외엔 보호됩니다." />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.013" text="조사는 제보된 내용을 토대로 이루어지며 사실근거가 불충분한 경우 중지 또는 종결될 수 있습니다. 또한 허위 제보에 대한 조사는 통보없이 종결됩니다." />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.014" text="(주) 도화엔지니어링은 윤리경영을 실천합니다. 여러분의 소중한 제보에 감사드립니다." />
										
										<br />
										<br />
										<h2 class="title-more-sub"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.025" text="운영방침" /></h2>
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.026" text="제보 내용은 최대한 빠른 시일 내에 처리되며, 처리 결과는 별도 통보하지 않습니다." />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.027" text="안심하고 제보할 수 있도록 신분을 노출하거나 이를 암시하는 어떠한 정보도 공개하지 않습니다." />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.028" text="실명이 확인 되지 않거나, 사실에 근거하지 않은 비방, 개인 사생활과 관련한 사항은 민원으로 처리되지 않습니다." />
										
										<br />
										<br />
										<h2 class="title-more-sub"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.029" text="제보 대상" /></h2>
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.030" text="임직원의 횡령/배임" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.031" text="임직원의 부당한 업무 처리" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.032" text="금전, 금품 및 향응의 부당한 요구 및 제공 사실" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.033" text="우월적 지위를 이용한 불공정 거래 행위" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.034" text="성희롱에 따른 풍기문란 행위" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.035" text="고객 및 회사 정보 유출" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.036" text="기타 윤리강령에 위배되는 사항" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.037" text="회계정보를 허위로 작성하거나 회계정보를 위조, 변조, 훼손 또는 파기하는 행위 및 이를 지시하는 행위" />
										<br />
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.038" text="법 등 관계법규 또는 내부통제제도 위반사항" />
									</p>
									<p class="title-sub type02">
										<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.015" text="제보는 온라인을 이용해 주시고, 문의는 좌측의 제보전용 전화나 이메일을 이용해 주시길 바랍니다." />
									</p>
								</div>
								<div class="infouse-box">
									<h4 class="infouse-tit"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.016" text="제보하기" /></h4>
									<p class="infouse-txt"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.017" text="제보하고자 하는 경우,아래 작성 버튼을 클릭하여주세요." /></p>
									<div class="bttn-area center">
										<a class="bttn type01 style01" href="/speak/tipoff" onclick="return true;" role="button" write-btn>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.018" text="작성하기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</div>
								</div>
								<div class="infouse-box">
									<h4 class="infouse-tit"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.019" text="진행/결과확인" /></h4>
									<p class="infouse-txt"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.020" text="제보하신 사안의 진행 또는 결과를 확인하시고자 하는 경우, 접수 및 비밀번호를 입력하여 주세요." /></p>
									<div class="input-group">
										<span class="input-txt">
											<input type="text" name="id" title="<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.021" text="접수번호" />" placeholder="<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.021" text="접수번호" />" />
											<input type="text" style="display: none;">
										</span>
										<span class="input-txt">
											<input type="password" name="password" title="<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.022" text="비밀번호" />" placeholder="<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.022" text="비밀번호" />" />
										</span>
									</div>
									<div class="bttn-area center">
										<a class="bttn type01 style01" href="#" onclick="return false;" role="button" result-btn>
											<span class="txt01"><spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.023" text="확인하기" /></span>
											<em class="ico01" aria-hidden="true"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->

						</form>
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
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">

		$(function() {

			$('[result-btn]').on('click', function() {

				$('#form').attr('method', 'POST').submit();
			});
		});
		
		$(function() {
			$('[write-btn]').on('click', function() {
				alert("<spring:message code="FRONT.COMMON.MENU.SPEAK.001.001.024"/>");
			});
		});
		</script>
	</body>
</html>