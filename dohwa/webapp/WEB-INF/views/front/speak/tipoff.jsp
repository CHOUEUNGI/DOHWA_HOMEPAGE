<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<%@ include file="/WEB-INF/views/front/layout/head.jsp"%>
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
		<%@ include file="/WEB-INF/views/front/layout/header.jsp"%>
		<!-- 본 컨텐츠 시작 -->
		<div id="container">

			<div id="content" role="main">
				<div class="page-visual intro06 visual-area">
					<div class="page-title-sec">
						<span class="title-main-sub"><spring:message
								code="FRONT.COMMON.MENU.SPEAK.002.001.001" text="COMPANY INFO" /></span>
						<h2 class="title-main">
							<spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" />
						</h2>
					</div>
					<div class="noti-scroll none">
						<span class="txt">Scroll</span> <span class="ico01"
							aria-hidden="true"></span> <span class="ico02" aria-hidden="true"></span>
					</div>
				</div>
				<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
				<div class="contents-wrap" style="position: relative">

					<form:form id="form" modelAttribute="speakVO" method="post"
						enctype="multipart/form-data" action="/speak/tipoffProc">
						<form:hidden path="anonymous" />
						<input type="hidden" name="lang" value="${_lang}" />

						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<%@ include
										file="/WEB-INF/views/front/layout/overview_tab_list.jsp"%>
								</ul>
							</div>
						</div>
						<div class="contents clfix">
							<span class="page-decs"> <strong><spring:message
										code="FRONT.COMMON.MENU.ABOUTUS.001.001.004" text="01 COMPANY" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005"
									text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont">
								<!-- s: 20200814 추가 -->
								<div class="tab-menu-type02">
									<ul class="tab-list tab-list-3depth">
										<li><a class="item" href="/aboutus/csr_01"><span
												class="txt" data-id=""><spring:message
														code="FRONT.COMMON.MENU.ABOUTUS.005.003.003" text="나눔경영" /></span></a></li>
										<li><a class="item" href="/aboutus/csr_02"><span
												class="txt" data-id=""><spring:message
														code="FRONT.COMMON.MENU.ABOUTUS.005.003.004" text="안전품질경영" /></span></a></li>
										<li class="active"><a class="item" href="#"
											onclick="return false;"><span class="txt" data-id=""><spring:message
														code="FRONT.COMMON.MENU.ABOUTUS.005.003.005" text="윤리준법경영" /></span></a></li>
									</ul>
								</div>
								<!-- e: 20200814 추가 -->
								<h2 class="title-main">
									<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.008"
										text="윤리경영제보라인" />
								</h2>
								<h3 class="title-sect">
									<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.009"
										text="제보하기" />
								</h3>
								<div class="tab-menu-type02">
									<ul class="tab-list">
										<li ${speakVO.anonymous eq 'N' ? 'class="active"' : '' }>
											<a class="item" href="/speak/tipoff/N"><span class="txt"
												data-id=""><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.010" text="실명" /></span></a>
										</li>
										<li ${speakVO.anonymous eq 'Y' ? 'class="active"' : '' }>
											<a class="item" href="/speak/tipoff/Y"><span class="txt"
												data-id=""><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.011" text="익명" /></span></a>
										</li>
									</ul>
								</div>
								<div class="inner-tab-cont active">

									<c:if test="${speakVO.anonymous eq 'N' }">

										<h4 class="title-sub">
											<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.012"
												text="개인정보 수집 및 이용에 대한 안내" />
										</h4>
										<div class="terms-box scrollbar-inner" tabindex="0">
											<div class="terms-inner">
												<strong><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.013"
														text="01. 수집·이용목적" /></strong>
												<p>
													<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.014"
														text="제보관련 추가 질의 및 결과 안내" />
												</p>
												<strong><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.015" text="02. 수집항목" /></strong>
												<p>
													<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.016"
														text="이름, 휴대폰번호, 이메일" />
												</p>
												<strong><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.017"
														text="03. 보유·이용기간" /></strong>
												<p>
													<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.018"
														text="수집·이용목적이 달성된 후 즉시 파기" />
												</p>
											</div>
										</div>
										<div class="agree-area tab-toggel">
											<p class="agree-desc">
												<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.019" text="개인정보 수집 및 이용에 관하여 동의하지 않으시는 경우는 익명제보를 이용해 주시길 바랍니다." />
												<br />
												<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.019.1" text="단, 익명 제보의 경우 명확한 증거물 및 자료가 없는 경우 조사가 진행되지 않을 수 있습니다. 실명 제보의 경우 제보자의 신원은 비밀이 보장됩니다." />
											</p>
											<div class="input-group">
												<span class="input-radio right"> <form:radiobutton
														path="agreeAt" id="radio-agree01" value="Y" /> <label
													for="radio-agree01"><span class="txt"><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.020" text="동의함" /></span></label>
												</span> <span class="input-radio right"> <form:radiobutton
														path="agreeAt" id="radio-agree02" value="N"
														checked="checked" /> <label for="radio-agree02"><span
														class="txt"><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.021" text="동의안함" /></span></label>
												</span>
											</div>
										</div>
										<h4 class="title-sub tab-toggel">
											<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.022"
												text="제보자" />
										</h4>
										<div class="table-wrap-type01 tab-toggel">
											<table class="table-col-type01 table-form-type">
												<caption>
													<span class="txt01"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.023" text="제보자" /></span>
													<span class="txt02"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.024" text=":이름" /></span>
													<span class="txt03"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.025" text=",휴대번호" /></span>
													<span class="txt04"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.026" text=",이메일" /></span>
													<span class="txt05"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.027" text=",회신번호" /></span>
													<span class="txt06"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.028"
															text=",비밀번호 설정" /></span> <span class="txt07"><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.029"
															text=",비밀번호 확인" /></span>
												</caption>
												<colgroup>
													<col style="width: 240px" />
													<col />
												</colgroup>
												<tbody>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.030" text="이름"
																var="name" />
															<c:out value="${name }" /></th>
														<td><span class="input-txt"> <form:input
																	path="name" title="${name }" type="text" value=""
																	maxlength="10" />
														</span> <form:errors path="name" cssStyle="color: #ff0000;" /></td>
													</tr>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.032" text="휴대번호" /></th>
														<td>
															<div class="input-group input-phone">
																<span class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.033"
																		text="휴대번호 첫번째 3자리" var="mobile1" /> <form:input
																		path="mobile1" title="${mobile1 }" type="text"
																		value="" maxlength="3" />
																</span> <span class="input-phone-dash">-</span> <span
																	class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.034"
																		text="휴대번호 두번째 4자리" var="mobile2" /> <form:input
																		path="mobile2" title="${mobile2 }" type="text"
																		value="" maxlength="4" />
																</span> <span class="input-phone-dash">-</span> <span
																	class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.035"
																		text="휴대번호 세번째 4자리" var="mobile3" /> <form:input
																		path="mobile3" title="${mobile3 }" type="text"
																		value="" maxlength="4" />
																</span>
															</div> <form:errors path="mobile1" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.036" text="이메일" /></th>
														<td>
															<div class="input-group input-email">
																<span class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.037"
																		text="이메일 아이디" var="email1" /> <form:input
																		path="email1" title="${email1 }" type="text" value=""
																		maxlength="20" />
																</span> <span class="input-email-at">&#64;</span> <span
																	class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.038"
																		text="이메일 도메인" var="email2" /> <form:input
																		path="email2" title="${email2 }" type="text" value=""
																		maxlength="20" />
																</span> <span class="input-email-domain">
																	<div class="dropdown-item">
																		<!-- 활성화 클래스 : open -->
																		<button class="bttn-dropdown" type="button"
																			role="button">
																			<span><spring:message
																					code="FRONT.COMMON.MENU.SPEAK.002.001.039"
																					text="직접입력" /></span>
																		</button>
																		<ul class="dropdown-list">
																			<li><a class="dropdown-menu" href="#"><spring:message
																						code="FRONT.COMMON.MENU.SPEAK.002.001.040"
																						text="직접입력" /></a></li>
																			<li><a class="dropdown-menu" href="#">naver.com</a></li>
																			<li><a class="dropdown-menu" href="#">gmail.com</a></li>
																			<li><a class="dropdown-menu" href="#">hanmail.net</a></li>
																		</ul>
																	</div>
																</span>
															</div> <form:errors path="email1" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.041" text="회신번호" /></th>
														<td>
															<div class="input-group w230">
																<span class="input-radio right"> <form:radiobutton
																		path="returnWay" id="radio-reply01" value="mobile"
																		checked="checked" /> <label for="radio-reply01"><span
																		class="txt"><spring:message
																				code="FRONT.COMMON.MENU.SPEAK.002.001.042" text="전화" /></span></label>
																</span> <span class="input-radio right"> <form:radiobutton
																		path="returnWay" id="radio-reply02" value="email" /> <label
																	for="radio-reply02"><span class="txt"><spring:message
																				code="FRONT.COMMON.MENU.SPEAK.002.001.043"
																				text="이메일" /></span></label>
																</span>
															</div>
														</td>
													</tr>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.044"
																text="비밀번호 설정" /></th>
														<td>
															<div class="input-password">
																<span class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.045"
																		text="비밀번호 설정" var="password" /> <form:input
																		path="password" title="${password }" type="password"
																		value="" maxlength="20" />
																</span> <em class="pw-noti"><spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.046"
																		text="진행/결과확인에 필요한 비밀번호입니다." /></em>
															</div> <form:errors path="password" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.047"
																text="비밀번호 확인" /></th>
														<td>
															<div class="input-password">
																<span class="input-txt"> <spring:message
																		code="FRONT.COMMON.MENU.SPEAK.002.001.048"
																		text="비밀번호 확인" var="passwordConfirm" /> <form:input
																		path="passwordConfirm" title="${passwordConfirm }"
																		type="password" value="" maxlength="20" />
																</span>
															</div> <form:errors path="passwordConfirm"
																cssStyle="color: #ff0000;" />
														</td>
													</tr>
												</tbody>
											</table>
										</div>

									</c:if>

									<h4 class="title-sub">
										<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.049"
											text="제보내용" />
										<c:if test="${speakVO.anonymous eq 'Y' }">
											<em class="title-noti"><spring:message
													code="FRONT.COMMON.MENU.SPEAK.002.001.050"
													text="(익명제보의 경우 제보에 따른 처리결과는 안내되지 않습니다.)" /></em>
										</c:if>
									</h4>
									<div class="table-wrap-type01">
										<table class="table-col-type01 table-form-type">
											<caption>
												<span class="txt01"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.051" text="제보내용" /></span>
												<span class="txt02"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.052" text=":제목" /></span>
												<span class="txt03"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.053" text=",대상" /></span>
												<span class="txt04"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.054" text=",일시 및 장소" /></span>
												<span class="txt05"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.055" text=",내용" /></span>
												<span class="txt06"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.056" text=",첨부파일" /></span>
											</caption>
											<colgroup>
												<col style="width: 240px" />
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.057" text="제목" /></th>
													<td><span class="input-txt"> <spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.058" text="제목"
																var="title" /> <form:input path="title"
																title="${title }" type="text" value="" maxlength="30" />
													</span> <form:errors path="title" cssStyle="color: #ff0000;" /></td>
												</tr>
												<tr>
													<th><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.059" text="대상" /></th>
													<td><span class="input-txt"> <spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.060" text="대상"
																var="who" /> <form:input path="who" title="${who }"
																type="text" value="" maxlength="30" />
													</span> <form:errors path="who" cssStyle="color: #ff0000;" /></td>
												</tr>
												<tr>
													<th><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.061" text="일시 및 장소" /></th>
													<td><span class="input-txt"> <spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.062"
																text="일시 및 장소" var="wherewhen" /> <form:input
																path="wherewhen" title="${wherewhen }" type="text"
																value="" maxlength="30" />
													</span> <form:errors path="wherewhen" cssStyle="color: #ff0000;" />
													</td>
												</tr>
												<tr>
													<th><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.063" text="내용" /></th>
													<td><span class="input-txt"> <spring:message
																code="FRONT.COMMON.MENU.SPEAK.002.001.064" text="내용"
																var="speakContent" /> <form:textarea
																path="speakContent" title="${speakContent }" />
													</span> <form:errors path="speakContent"
															cssStyle="color: #ff0000;" /></td>
												</tr>
												<tr>
													<th><spring:message
															code="FRONT.COMMON.MENU.SPEAK.002.001.065" text="첨부파일" /></th>
													<td>
														<div class="input-file">
															<label class="bttn-file-upload" for="file1"> <spring:message
																	code="FRONT.COMMON.MENU.SPEAK.002.001.066" text="파일선택" />
																<input class="inp-file-hide" name="PC_FILE_1"
																type="file" id="file1" />
															</label> <input class="selected-file" type="text" disabled="true"
																placeholder="<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.067" text="파일을 선택해 주세요." />"
																aria-hidden="true" />
															<p class="info-txt">
																<spring:message
																	code="FRONT.COMMON.MENU.SPEAK.002.001.068"
																	text="* 첨부 파일은 jpg, png, gif, hwp, pdf, ppt, xls, zip 파일에 한해 등록이 가능합니다. / 최대 5개 첨부 가능" />
															</p>
														</div>
														<div class="file-list"></div> <form:errors path="file"
															cssStyle="color: #ff0000;" />
													</td>
												</tr>
											</tbody>
										</table>
										<div class="table-btn-wrap center">
											<!--s: 20200914 추가, 텍스트 수정-->
											<a class="bttn type01 style01" href="/speak" role="button">
												<span class="txt01"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.001.001.009.1" text="이용안내" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a> <a class="bttn type01 style01" href="#" id="saveButton"
												role="button"> <span class="txt01"><spring:message
														code="FRONT.COMMON.MENU.SPEAK.002.001.069" text="제출하기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
											<!--e: 20200914 추가, 텍스트 수정-->
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- e : 20200812 클래스 및 .contents-wrap 추가-->

					</form:form>

					<!-- 활성화시 class active 추가-->
					<div class="alert-pop-wrap" id="divResultN">
						<div class="alert-pop">
							<p class="title">
								<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.070"
									text="제보신청 등록이 완료되었습니다." />
							</p>
							<div class="txt-wrap">
								<!-- <p class="txt01">
										귀하의 접수번호는
										<span class="num">20200908001</span>
										입니다.
									</p>
									<p>
										접수번호는 결과확인 시 본인확인을 위해 사용됩니다.
										<br />
										분실 시 재발급은 안됩니다.
									</p> -->
								<spring:message code="FRONT.COMMON.MENU.TIPOFF.001.MOB"
									arguments="${param.id}" />
							</div>
							<button class="bttn type01 style01" type="button" title="확인"
								onclick="location.href='/speak';">
								<span class="txt01">확인</span>
							</button>
						</div>
					</div>
					<!--e: 20200908 alert 팝업 추가-->

					<!-- 활성화시 class active 추가-->
					<div class="alert-pop-wrap" id="divResultY">
						<div class="alert-pop">
							<p class="title">
								<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.070"
									text="제보신청 등록이 완료되었습니다." />
							</p>
							<div class="txt-wrap">&nbsp;</div>
							<button class="bttn type01 style01" type="button" title="확인"
								onclick="location.href='/speak';">
								<span class="txt01">확인</span>
							</button>
						</div>
					</div>
					<!--e: 20200908 alert 팝업 추가-->

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
		<%@ include file="/WEB-INF/views/front/layout/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/front/layout/after_script.jsp"%>
	<%--// 화면 로딩 완료 후 스크립트 처리 --%>
	<script type="text/javascript">
		var component = new ComponentUI();
		component.selectBox(".bttn-dropdown", 250);

		// file html
		function getFileHtml(idx) {

			var sb = new StringBuilder();

			sb.append('<label class="bttn-file-upload" for="{0}">', 'file'
					+ idx);
			sb
					.append('	<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.066" text="파일선택" javaScriptEscape="true" />');
			sb
					.append(
							'	<input class="inp-file-hide" name="{0}" type="file" id="{1}" />',
							'PC_FILE_' + idx, 'file' + idx);
			sb.append('</label>');

			return sb.toString();
		}

		// file list html
		function getFileListHtml(obj) {

			var sb = new StringBuilder();

			sb.append('<p class="file-item">');
			sb.append('	{0}', obj.name);
			sb.append('	<button class="btn-delete" type="button">');
			sb.append('		<i class="ico-file-delete" aria-hidden="true"></i>');
			sb
					.append('		<span class="hide-txt"><spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.071" text="파일삭제" javaScriptEscape="true" /></span>');
			sb.append('	</button>');
			sb.append('</p>');

			return sb.toString();
		}

		// file reset
		function fncResetFile(obj) {

			var agent = navigator.userAgent.toLowerCase();
			if ((navigator.appName == 'Netscape' && navigator.userAgent
					.search('Trident') != -1)
					|| (agent.indexOf("msie") != -1)) {
				$(obj).replaceWith($(obj).clone(true));
			} else {
				$(obj).val("");
			}
		}

		$(function() {

			$('a.dropdown-menu')
					.on(
							'click',
							function() {

								if ('<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.039" text="직접입력" javaScriptEscape="true" />' == $(
										this).html()) {
									$('#email2').val('');
									$('#email2').focus();
									$('#email2').removeAttr('readonly');
								} else {
									$('#email2').val($(this).html());
									$('#email2').attr('readonly', 'readonly');
								}
							});

			var regEmailDomain = '${speakVO.email2}';
			$('a.dropdown-menu').each(function() {
				if (regEmailDomain == $(this).html()) {
					$(this).trigger('click');
				}
			});

			// 파일 선택 event
			var fileCnt = 1;
			$(document)
					.on(
							'change',
							'input[type="file"]',
							function() {

								$('#file\\.errors').hide();
								
								// 용량 체크
								if($(this)[0].files[0].size > 1024 * 1024 * 20){
									var fileSizeErrMsg = '<spring:message code="FRONT.VALIDATE.FILE.UPLOAD.SIZE" />';
									fileSizeErrMsg = fileSizeErrMsg.replace('{0}', '20MB');
									fileSizeErrMsg = fileSizeErrMsg.replace('{1}', (Math.round($(this)[0].files[0].size / 1024 / 1024 * 100) / 100) + 'MB');
									alert(fileSizeErrMsg);
									fncResetFile(this); 
									return;
								}
								
								var length = $('input[type="file"]').length;
								if (length === 6) {

									fncResetFile($(this));
									alert('<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.072" text="첨부파일은 최대 5개까지 첨부 가능합니다." arguments="5" javaScriptEscape="true" />');
									return false;
								}
								
								fileCnt = fileCnt + 1;

								$('label[for="' + $(this).attr('id') + '"]')
										.hide();
								$('.input-file').prepend(
										getFileHtml(fileCnt));
								$('.file-list').append(
										getFileListHtml($(this)[0].files[0]));
							});

			// 파일 삭제 event
			$(document).on(
					'click',
					'.file-item button',
					function() {
						$('#file\\.errors').hide();
						var idx = $('.file-item button').index($(this));
						var length = $('input[type="file"]').length;

						$('input[type="file"]').eq(length - idx - 1).closest(
								'label').remove();
						$(this).closest('.file-item').remove();
					});

			// 제출하기 event
			$('#saveButton')
					.on(
							'click',
							function(e) {
								e.preventDefault();

								var form = $('#form');

								if ($('#anonymous').val() === 'N'
										&& !$('input[name="agreeAt"]').prop(
												'checked')) {

									alert('<spring:message code="FRONT.COMMON.MENU.SPEAK.002.001.073" text="개인정보 수집 및 이용에 관하여 동의해 주세요." javaScriptEscape="true" />');
									$('input[name="agreeAt"]').focus();
									return false;
								}

								/* if(!confirm("저장하시겠습니까?")) {
									return;
								} */

								// empty file 삭제
								if ($('input[type="file"]').length > 1) {
									$('input[type="file"]').eq(0).attr(
											'disalbed', true);
								}

								var data = new FormData(form[0]);
								$("#saveButton").prop("disabled", true);

								if ($('span[id$="errors"]').length > 0) {
									$('span[id$="errors"]').remove();
								}

								$
										.ajax({
											type : "POST",
											enctype : 'multipart/form-data',
											url : "/speak/tipoffProc",
											data : data,
											processData : false,
											contentType : false,
											cache : false,
											timeout : 600000,
											success : function(data) {
												$("#saveButton").prop(
														"disabled", false);
												if (data.result === true) {
													$('#divResultY').hide();
													$('#divResultN').hide();
													$('#divResultN').find(
															'em.colorB').html(
															data.id);
													$(
															'#divResult'
																	+ data.anonymous)
															.show();
												} else {
													if (data.errorList
															&& data.errorList.length
															&& data.errorList.length > 0) {
														data.errorList
																.forEach(function(
																		o, i) {
																	if (form
																			.find('#'
																					+ o.field).length > 0) {
																		form
																				.find(
																						'#'
																								+ o.field)
																				.closest(
																						'td')
																				.append(
																						'<span id="'+o.field+'.errors" style="color: #ff0000;">'
																								+ o.msg
																								+ '</span>');
																		if (i == 0) {
																			form
																					.find(
																							'#'
																									+ o.field)
																					.focus();
																			$(
																					window)
																					.scrollTop(
																							form
																									.find(
																											'#'
																													+ o.field)
																									.offset().top - 200);
																		}
																	} else if (o.field === 'file') {
																		form
																				.find(
																						'div.input-file')
																				.closest(
																						'td')
																				.append(
																						'<span id="'+o.field+'.errors" style="color: #ff0000;">'
																								+ o.msg
																								+ '</span>');
																	}
																});
													}

													// empty file 활성화
													if ($('input[type="file"]').length > 1) {
														$('input[type="file"]')
																.eq(0)
																.removeAttr(
																		'disalbed');
													}
												}
											},
											error : function(e) {
												debugger;
												alert('<spring:message code="FRONT.COMMON.MENU.ERROR.003.003" javaScriptEscape="true" />');
												$("#saveButton").prop(
														"disabled", false);
												// empty file 활성화
												if ($('input[type="file"]').length > 1) {
													$('input[type="file"]').eq(
															0).removeAttr(
															'disalbed');
												}
												console.log("ERROR : ", e);
											}
										});

								//form.submit();
							});

		});
	</script>
</body>
</html>