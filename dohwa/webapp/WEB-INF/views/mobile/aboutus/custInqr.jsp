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
		<div id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<!-- 본 컨텐츠 시작 -->
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
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
						<div class="tab-menu-type01 center swiper-container">
							<%@ include file="/WEB-INF/views/mobile/layout/overview_tab_list.jsp" %>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont inquiry-cont">
							<div class="tab-menu-type02">
								<ul class="tab-list">
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/contactus"/>"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.009" text="연락처 &middot; 본사위치" /></span></a>
									</li>
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/overseas"/>"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.010" text="연락처 &middot; 해외지사" /></span></a>
									</li>
									<li class="active">
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/custInqr"/>"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.011" text="연락처 &middot; 문의사항" /></span></a>
									</li>
								</ul>
							</div>
							<div class="inner-tab-cont active">
								<c:if test="${custInqrVO.prvtTermsAgree ne 'Y' || custInqrVO.cptpTermsAgree ne 'Y'}">
									<div class="terms-cont" id="divTerms">
										<c:import url="./inc/inc_custInqr_terms_${_lang}.jsp"/>	<%--약관은 html 분기처리함 --%>
									</div>
								</c:if>
								<div id="divForms" <c:if test="${custInqrVO.prvtTermsAgree ne 'Y' || custInqrVO.cptpTermsAgree ne 'Y'}">style="display:none"</c:if>> <%--개발자가 임의대로 나눈 div 영역2. 폼입력 --%>
									<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.014" text="문의하기" /></h3>
									<div class="table-wrap-type01">
									<form:form id="form" modelAttribute="custInqrVO"  method="post" enctype="multipart/form-data" action="${mobileStartPath}aboutus/custInqr/reg">
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
												<col style="width:25%" />
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.015" text="이름" /></th>
													<td>
														<span class="input-txt">
															<form:input path="regNm" title="name" type="text"/>
														</span>
														<form:errors path="regNm" cssStyle="color: #ff0000;" />
													</td>
												</tr>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.016" text="이메일" /></th>
													<td>
														<div class="input-group input-email">
															<span class="input-txt">
																<form:input path="email" title="email id" type="text"/>
															</span>
															<span class="input-email-at">&#64;</span>
															<span class="input-txt">
																<form:input path="emailDomain" title="email domain" type="text"/>
															</span>
														</div>
														<div class="input-email-domain">
															<span class="selectbox">
																<select title="slect email domain ">
																	<option value=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.021" text="직접입력" /></option>
																	<option value="naver.com">naver.com</option>
																	<option value="gmail.com">gmail.com</option>
																	<option value="hanmail.net">hanmail.net</option>
																</select>
															</span>
														</div>
														<form:errors path="email" cssStyle="color: #ff0000;" />
													</td>
												</tr>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.017" text="연락처" /></th>
													<td>
														<span class="input-txt">
															<form:input path="tel" title="tel" type="text" maxlength="11"/>
														</span>
														<form:errors path="tel" cssStyle="color: #ff0000;" />
													</td>
												</tr>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.018" text="제목" /></th>
													<td>
														<span class="input-txt">
															<form:input path="title" title="title" type="text"/>
														</span>
														<form:errors path="title" cssStyle="color: #ff0000;" />
													</td>
												</tr>
												<tr>
													<th><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.019" text="내용" /></th>
													<td>
														<span class="input-txt">
															<form:textarea path="cont" title="content"/>
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
																<input class="inp-file-hide" type="file" id="file-upload"  name="PC_FILE_1"/>
															</label>
															<span class="selected-file" aria-hidden="true"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.023" text="선택된 파일 없음" /></span>
															<div class="file-list"></div>
															<p class="info-txt">
																<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.024" text="* 첨부 파일은 jpg, png, gif, hwp, pdf, ppt, xls, zip 파일에 한해 등록이 가능합니다. / 최대 용량 : 00MB" />
															</p>
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
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link2.jsp" %>
					</div>
				</div>
			</div>
			<!-- 본 컨텐츠 끝 -->
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<%--// 화면 로딩 완료 후 스크립트 처리 --%>
		<script type="text/javascript">
		$(function() {
			$(document).ready(function(){
				var form = $('#form');
				form.find('.input-email-domain select').on('change', function(){
					if('' == $(this).val()){
						$('#emailDomain').removeAttr('readonly');
					} else {
						$('#emailDomain').val($(this).val());
						$('#emailDomain').attr('readonly', 'readonly');
					}
				});
				
				// 전화번호입력시 숫자만 입력하게
				form.find('#tel').on('keyup', function() {
					$(this).val($(this).val().replace(/[^0-9]/gi, ''));
				});

				$('#saveButton').on('click', function(e) {
					e.preventDefault();
					
					$('#cont').val($('#cont').val().replace(/(\n|\r\n)/g, '<br>'));

					/* if(!confirm("저장하시겠습니까?")) {
						return;
					} */
					
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
			            		location.href="${mobileStartPath}aboutus/custInqr";
			            	} else {
			            		if(data.errorList && data.errorList.length && data.errorList.length > 0){
			            			data.errorList.forEach(function(o, i){
			            				if(form.find('#'+o.field).length > 0){
			            					form.find('#'+o.field).closest('td').append('<span id="'+o.field+'.errors" style="color: #ff0000;">'+o.msg+'</span>');
// 			            					if(i == 0){
// 			            						form.find('#'+o.field).focus();
			            						$(window).scrollTop(form.find('#'+o.field).offset().top - 200);
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
			            					var _e = $(obj).closest('td').find('input');
			            					'' === _e.eq(0).val() ? _e.eq(0).focus() : _e.eq(1).focus();
			            					
			            					$(window).scrollTop($('#divForms').offset().top - 200);
			            				} else if(0 === idx && 'tel.errors' === _id) {
				            				var _e = $(obj).prev().find('input');
				            				'' === _e.eq(0).val() || isNaN(_e.eq(0).val()) ? _e.eq(0).focus() : ''; 
				            						
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

				$('#divTerms a.bttn').on('click', function(e) {
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
						//$(window).scrollTop($('div.tab-menu-type02').offset().top);
						$('html, body').animate({scrollTop: $('div.tab-menu-type02').offset().top}, 500);
					}, 500);
				});

				<c:if test="${custInqrVO.prvtTermsAgree eq 'Y' || custInqrVO.cptpTermsAgree eq 'Y'}">
				setTimeout(function(){
					//$(window).scrollTop($('div.tab-menu-type02').offset().top);
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
						fileSizeErrMsg = fileSizeErrMsg.replace('{0}', (Math.round($(this)[0].files[0].size / 1024 / 1024 * 100) / 100) + 'MB');
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
					$selectedInp.html('');
					$('.file-list').html('<p class="file-item">'+selectedVal+'<button class="btn-delete" type="button"><i class="ico-file-delete" aria-hidden="true"></i><span class="hide-txt">파일삭제</span></button></p>');
				 });
			});
			
			$(document).on('click', '.file-item button', function() {
				$('#file\\.errors').hide();
				$('input[type="file"]').val('');
				$('input[type="file"]').parent('label').next('.selected-file').html('<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.023" text="선택된 파일 없음" />');
				$('.file-list').html('');
			});
		});
		</script>
	</body>
</html>