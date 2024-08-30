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
		<div id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<!-- 20200805 스크롤 수정 start-->
						<div class="noti-scroll none">
							<span class="txt">Scroll</span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<!-- 20200805 스크롤 수정 end-->
					</div>
					<!-- s : 20200812 클래스 및 .contents-wrap 추가-->
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<%@ include file="/WEB-INF/views/front/layout/overview_tab_list.jsp" %>
							</div>
						</div>
						<div class="contents no-btm-type clfix">
							<span class="page-decs">
								<strong><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.007" text="05 PR ROOM" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<!-- s: 20200806 수정 -->
							<div class="section-cont">
								<div class="tab-menu-type02">
									<ul class="tab-list">
										<li>
											<a class="item" href="<c:url value="/aboutus/contactus" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.009" text="연락처 &middot; 본사위치" /></span></a>
										</li>
										<li>
											<a class="item" href="<c:url value="/aboutus/overseas" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.010" text="해외지사" /></span></a>
										</li>
										<li class="active">
											<a class="item" href="<c:url value="/aboutus/custInqr" />"><span class="txt" data-id=""><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.011" text="문의사항" /></span></a>
										</li>
									</ul>
								</div>
								<div class="inner-tab-cont active">
									<c:if test="${custInqrVO.prvtTermsAgree ne 'Y' || custInqrVO.cptpTermsAgree ne 'Y'}">
										<div id="divTerms">	<%--개발자가 임의대로 나눈 div 영역1. 약관 --%>
											<c:import url="./inc/inc_custInqr_terms_${_lang}.jsp"/>	<%--약관은 html 분기처리함 --%>
											<div class="agree-area">
												<span class="input-checkbox right">
													<input type="checkbox" id="chk02" name="chk01" />
													<label for="chk02"><span class="txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.012" text="위의 개인정보 제공에 동의합니다." /></span></label>
												</span>
											</div>
											<div class="bttn-area center">
												<a class="bttn type01 style01" href="#none" role="button" id="confirmTerms">
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.013" text="확인" /></span>
													<em class="ico01" aria-hidden="true"></em>
												</a>
											</div>
										</div>
									</c:if>

									<div id="divForms" <c:if test="${custInqrVO.prvtTermsAgree ne 'Y' || custInqrVO.cptpTermsAgree ne 'Y'}">style="display:none"</c:if>> <%--개발자가 임의대로 나눈 div 영역2. 폼입력 --%>
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.014" text="문의하기" /></h3>
									<div class="table-wrap-type01">
										<form:form id="form" modelAttribute="custInqrVO"  method="post" enctype="multipart/form-data" action="/aboutus/custInqr/reg">
											<form:input path="prvtTermsAgree" type="hidden" value="${empty custInqrVO.prvtTermsAgree ? 'N' : custInqrVO.prvtTermsAgree}"/>
											<form:input path="cptpTermsAgree" type="hidden" value="${empty custInqrVO.cptpTermsAgree ? 'N' : custInqrVO.cptpTermsAgree}"/>
											<input type="hidden" name="lang" value="${_lang}"/>
											<table class="table-col-type01 table-form-type">
												<caption>
													<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.014" text="문의하기" /></span>
													<span class="txt02">:<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.015" text="이름" /></span>
													<span class="txt03">,<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.016" text="이메일" /></span>
													<span class="txt04">,<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.017" text="연락처" /></span>
													<span class="txt05">,<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.018" text="제목" /></span>
													<span class="txt06">,<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.019" text="내용" /></span>
													<span class="txt07">,<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.020" text="첨부파일" /></span>
												</caption>
												<colgroup>
													<col style="width:240px" />
													<col />
												</colgroup>
												<tbody>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.015" text="이름" /></th>
														<td>
															<span class="input-txt">
																<form:input path="regNm" title="이름" type="text"/>
															</span>
															<form:errors path="regNm" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.016" text="이메일" /></th>
														<td>
															<div class="input-group input-email">
																<span class="input-txt">
																	<form:input path="email" title="이메일 아이디" type="text"/>
																</span>
																<span class="input-email-at">&#64;</span>
																<span class="input-txt">
																	<form:input path="emailDomain" title="이메일 도메인" type="text"/>
																</span>
																<span class="input-email-domain">
																	<div class="dropdown-item">
																		<!-- 활성화 클래스 : open -->
																		<button class="bttn-dropdown" type="button" role="button"><span><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.021" text="직접입력" /></span></button>
																		<ul class="dropdown-list">
																			<li><a class="dropdown-menu" href="#"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.021" text="직접입력" /></a></li>
																			<li><a class="dropdown-menu" href="#">naver.com</a></li>
																			<li><a class="dropdown-menu" href="#">gmail.com</a></li>
																			<li><a class="dropdown-menu" href="#">hanmail.net</a></li>
																		</ul>
																	</div>
																</span>
															</div>
															<form:errors path="email" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.017" text="연락처" /></th>
														<td>
															<div class="input-group input-phone">
																<span class="input-txt">
																	<form:input path="tel1" title="연락처" type="text" maxlength="3"/>
																</span>
																<span class="input-phone-dash">-</span>
																<span class="input-txt">
																	<form:input path="tel2" title="연락처" type="text" maxlength="4"/>
																</span>
																<span class="input-phone-dash">-</span>
																<span class="input-txt">
																	<form:input path="tel3" title="연락처" type="text" maxlength="4"/>
																</span>
															</div>
															<form:errors path="tel" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.018" text="제목" /></th>
														<td>
															<span class="input-txt">
																<form:input path="title" title="제목" type="text"/>
															</span>
															<form:errors path="title" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.019" text="내용" /></th>
														<td>
															<span class="input-txt">
																<form:textarea path="cont" title="내용"/>
															</span>
															<form:errors path="cont" cssStyle="color: #ff0000;" />
														</td>
													</tr>
													<tr>
														<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.020" text="첨부파일" /></th>
														<td>
															<div class="input-file">
																<label class="bttn-file-upload" for="file-upload">
																	<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.022" text="파일선택" />
																	<input class="inp-file-hide" type="file" id="file-upload" name="PC_FILE_1"/>
																</label>
																<input style="width: 60%;" class="selected-file" type="text" disabled="true" placeholder="<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.023" text="선택된 파일 없음" />" aria-hidden="true" />
																<span class="file-list" style="display:none;">
																	<button class="btn-delete" type="button">		
																		<i class="ico-file-delete" aria-hidden="true"></i>		
																		<span class="hide-txt">파일삭제</span>	
																	</button>
																</span>
																<p class="info-txt"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.024" text="* 첨부 파일은 jpg, png, gif, hwp, pdf, ppt, xls, zip 파일에 한해 등록이 가능합니다. / 최대 용량 : 00MB" /></p>
																<form:errors path="file" cssStyle="color: #ff0000;" />
															</div>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="table-btn-wrap center">
											<a class="bttn type01 style01" href="#none" role="button" id="saveButton">
												<span class="txt01"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.014" text="문의하기" /></span>
												<em class="ico01" aria-hidden="true"></em>
											</a>
										</div>
										</form:form>
									</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link2.jsp" %><%--하단 채용,사업소개 배너 영역 --%>
						</div>
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
		<script>
			var component = new ComponentUI();
			component.selectBox(".bttn-dropdown", 250);
		</script>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				var form = $('#form');
				form.find('a.dropdown-menu').on('click', function(){
					if('<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.021" text="직접입력" />' == $(this).html()){
						$('#emailDomain').removeAttr('readonly');
					} else {
						$('#emailDomain').val($(this).html());
						$('#emailDomain').attr('readonly', 'readonly');
					}
				});

				var regEmailDomain = '${custInqrVO.emailDomain}';
				form.find('a.dropdown-menu').each(function(){
					if(regEmailDomain == $(this).html()){
						$(this).trigger('click');
					}
				});

				$('#saveButton').on('click', function(e) {
					e.preventDefault();

					/* if(!confirm("저장하시겠습니까?")) {
						return;
					} */
					
					$('#cont').val($('#cont').val().replace(/(\n|\r\n)/g, '<br>'));
					
					var data = new FormData(form[0]);
					$("#saveButton").prop("disabled", true);
					
					if($('span[id$="errors"]').length > 0){
						$('span[id$="errors"]').remove();
					}
					
					$.ajax({
			            type: "POST",
			            enctype: 'multipart/form-data',
			            url: "/aboutus/custInqr/reg",
			            data: data,
			            processData: false,
			            contentType: false,
			            cache: false,
			            timeout: 600000,
			            success: function (data) {
			            	$("#saveButton").prop("disabled", false);
			            	if(data.result === true){
			            		alert(data.DOHWA_MESSAGE);
			            		location.href="/aboutus/custInqr";
			            	} else {
			            		if(data.errorList && data.errorList.length && data.errorList.length > 0){
			            			data.errorList.forEach(function(o, i){
			            				if(form.find('#'+o.field).length > 0){
			            					form.find('#'+o.field).closest('td').append('<span id="'+o.field+'.errors" style="color: #ff0000;">'+o.msg+'</span>');
// 			            					if(i == 0){
// 			            						form.find('#'+o.field).focus();
// 			            						$(window).scrollTop(form.find('#'+o.field).offset().top - 200);
// 			            					}
			            				} else if(o.field === 'tel'){
			            					form.find('#tel1').closest('td').append('<span id="'+o.field+'.errors" style="color: #ff0000;">'+o.msg+'</span>');
// 			            					form.find('#tel1').focus();
// 			            					$(window).scrollTop(form.find('#regNm').offset().top - 200);
			            				} else if(o.field === 'file'){
			            					form.find('div.input-file').closest('td').append('<span id="'+o.field+'.errors" style="color: #ff0000;">'+o.msg+'</span>');
			            				}
			            			});
			            			
			            			$('span[id$=".errors"]').each(function(idx, obj) {
			            				var _id = $(this).attr('id');
			            				if(0 === idx && 'email.errors' === _id) {
			            					var _e = $(obj).prev().find('input');
			            					'' === _e.eq(0).val() ? _e.eq(0).focus() : _e.eq(1).focus();
			            					
			            					$(window).scrollTop($('#divForms').offset().top - 200);
			            				} else if(0 === idx && 'tel.errors' === _id) {
				            				var _e = $(obj).prev().find('input');
				            				'' === _e.eq(0).val() || isNaN(_e.eq(0).val()) ? _e.eq(0).focus() : 
				            					'' === _e.eq(1).val() || isNaN(_e.eq(1).val()) ? _e.eq(1).focus() : 
				            						'' === _e.eq(2).val() || isNaN(_e.eq(2).val()) ? _e.eq(2).focus() : '';
				            						
				            				$(window).scrollTop($('#divForms').offset().top - 200);
			            				} else if(0 === idx) {
			            					if(0 !== $(obj).prev().find('input').length) {
			            						$(obj).prev().find('input').focus();
			            					} else {
			            						$(obj).prev().find('textarea').focus();
			            					}
			            					
			            					$(window).scrollTop($('#divForms').offset().top - 200);
			            				}
			            			});
			            		}
			            	}
			            },
			            error: function (e) {
			            	$("#saveButton").prop("disabled", false);
			                console.log("ERROR : ", e);
			            }
			        });
					
					//form.submit();
				});

				$('#confirmTerms').on('click', function(e) {
					e.preventDefault();
					if(!($('#chk01').is(':checked') && $('#chk02').is(':checked'))) {
						alert('<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.025" text="개인정보 동의에 체크해 주십시오." />');
						return;
					}
					$('#divTerms').hide();
					$('#divForms').show();
					$('#prvtTermsAgree').val('Y');
					$('#cptpTermsAgree').val('Y');
					setTimeout(function(){
						$('html, body').animate({scrollTop: $('div.tab-menu-type02').offset().top}, 500);
					}, 500);
				});

				<c:if test="${custInqrVO.prvtTermsAgree eq 'Y' || custInqrVO.cptpTermsAgree eq 'Y'}">
				setTimeout(function(){
					$('html, body').animate({scrollTop: $('div.tab-menu-type02').offset().top}, 500);
				}, 500);
				</c:if>

				$('input[type="file"]').on("change", function(){
					
					$('#file\\.errors').hide();
					
					var $this = $(this),
						selectedVal = $this.val().replace(/C:\\fakepath\\/i, '');
					
					// 용량 체크
					if($(this)[0].files[0].size > 1024 * 1024 * 20){
						var fileSizeErrMsg = '<spring:message code="FRONT.VALIDATE.FILE.UPLOAD.SIZE" />';
						fileSizeErrMsg = fileSizeErrMsg.replace('{0}', '20MB');
						fileSizeErrMsg = fileSizeErrMsg.replace('{1}', (Math.round($(this)[0].files[0].size / 1024 / 1024 * 100) / 100) + 'MB');
						alert(fileSizeErrMsg);
						$('input[type="file"]').val('');
						return;
					}

					if(window.FileReader){ // modern browser
						selectedVal = $(this)[0].files[0].name;
					} else { // old IE
						selectedVal = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
					}

					$selectedInp = $this.parent('label').next('.selected-file');
					$selectedInp.val(selectedVal);
					$('span.file-list').show();
				 });
				
				$('.btn-delete').on("click", function(){
					$('#file\\.errors').hide();
					$('input[type="file"]').val('');
					$('input[type="file"]').parent('label').next('.selected-file').val('<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.023" text="선택된 파일 없음" />');
					$('span.file-list').hide();
				 });

			});
		});
		
		</script>
	</body>
</html>