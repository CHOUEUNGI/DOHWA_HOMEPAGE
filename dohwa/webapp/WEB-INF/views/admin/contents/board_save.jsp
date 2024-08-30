<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
</head>
<body>
	<div class="wrap"><a href="#contents" class="skip">본문바로가기</a>
		<div id="header"><%@ include file="/WEB-INF/views/admin/layout/header.jsp" %></div>
		<div id="container">
			<div id="lefter"><%@ include file="/WEB-INF/views/admin/layout/lefter.jsp" %></div>
			<div class="wrap-cont">
				<h2 style="margin-bottom: 30px;">게시판 관리 ${boardVO.seq eq 0 ? '등록' : '수정' }</h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" btn-cancel><span>취소</span></a>
					<a class="btns btn-back-o" btn-save><span>저장</span></a>
				</div>
				
				<c:url var="action" value="${requestScope['javax.servlet.forward.servlet_path']}" />
				<form:form id="form" action="${action }" modelAttribute="boardVO" method="post" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${searchVO.page }">
					<input type="hidden" name="searchText" value="${searchVO.searchText }">
					<input type="hidden" name="searchLangType" value="${searchVO.searchLangType }">

				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:100%;">
						</colgroup>
						<tbody>
							<tr>
								<td>
								
								<c:choose>
									<c:when test="${boardVO.seq > 0 }">
									
									<input type="hidden" name="lang" value="${boardVO.lang }">
									<div class="ip-area radio">
										<span><form:radiobutton path="lang" value="KO" label="국문" disabled="true" /></span>
										<span><form:radiobutton path="lang" value="EN" label="영문" disabled="true" /></span>
										<span><form:radiobutton path="lang" value="ES" label="스페인" disabled="true" /></span>
									</div>
									
									</c:when>
									<c:otherwise>
									
									<div class="ip-area radio">
										<span><form:radiobutton path="lang" value="KO" label="국문" /></span>
										<span><form:radiobutton path="lang" value="EN" label="영문" /></span>
										<span><form:radiobutton path="lang" value="ES" label="스페인" /></span>
									</div>
									
									</c:otherwise>
								</c:choose>
								
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목</th>
								<td>
									<div class="ip-area w100">
										<form:input path="title" class="ip-text" title="제목" placeholder="제목을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="title" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;등록일자</th>
								<td>
									<div class="ip-area ico-calenadar">
										<form:input class="ip-text datepicker" type="text" path="createDt" value="" disabled="disabled" />
									</div>
									<form:errors path="createDt" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							
							<c:if test="${boardVO.lang eq 'KO' }">
							
							<tr>
								<th><span class="required">필수항목</span>&nbsp;출처</th>
								<td>
									<div class="ip-area w100">
										<form:input path="refr" class="ip-text" title="출처" placeholder="언론사(출처)를 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="refr" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="url" class="ip-text" title="URL" placeholder="URL을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="url" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							
							</c:if>
							
							<tr>
								<th><span class="required">필수항목</span>&nbsp;게시글 공개여부</th>
								<td>
									<div class="ip-area radio">
										<span><form:radiobutton path="dispYn" value="N" label="비공개" checked="checked" /></span>
										<span><form:radiobutton path="dispYn" value="Y" label="공개" /></span>
									</div>
									<form:errors path="dispYn" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;메인 노출</th>
								<td>
									<div class="ip-area radio">
										<span><form:radiobutton path="mainYn" value="N" label="비공개" checked="checked" /></span>
										<span><form:radiobutton path="mainYn" value="Y" label="공개" /></span>
									</div>
									<form:errors path="mainYn" cssStyle="color: #ff0000;"/>
									(노출기간설정 :
									<div class="ip-area ico-calenadar">
										<form:input class="ip-text datepicker" type="text" path="mainDispSdt" value="" disabled="disabled" />
									</div>
									~
									<div class="ip-area ico-calenadar">
										<form:input class="ip-text datepicker" type="text" path="mainDispEdt" value="" disabled="disabled" />
									</div> 
									<form:errors path="mainDispMessage" cssStyle="color: #ff0000;" />
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;구분</th>
								<td>
									<div class="ip-area radio" style="">
										<form:radiobuttons path="typeCode" items="${typeList }" itemValue="value" itemLabel="koText" cssClass="radio-box" />
 									</div>
									<form:errors path="dispYn" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							
							<c:if test="${boardVO.lang ne 'KO' }">
							
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;PC 이미지 등록
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 1312 X 700</p>
								</th>
								<td>
								
									<c:choose>
										<c:when test="${fn:length(boardVO.pcFileList) <= 0 }">
										
										<div style="float: left; display: block;" id="pc-file-div">
											<div class="ip-area w80 add-file" style="display: block;">
												<input type="file" name="PC_FILE_1" style="width: 400px;" />
											</div>
										</div>
										<div style="float: right;">
											<a class="btns btn-back-o" data-target="#pc-file-div" plus-button><span>+</span></a>
											<a class="btns btn-line-g" data-target="#pc-file-div" minus-button><span>-</span></a>
										</div>
										
										</c:when>
										<c:otherwise>
										
											<div style="float: left; display: block;" id="pc-file-div">
											
											<c:forEach items="${boardVO.pcFileList }" var="pcFile">
											
												<div class="w100 add-file">
													<c:out value="${pcFile.orgName }" />
													<a class="btns btn-line-g" data-file-id="${pcFile.id}"><span>삭제</span></a>
												</div>
											
											</c:forEach>
											
											</div>
											
											<div style="float: right;">
												<a class="btns btn-back-o" data-target="#pc-file-div" plus-button><span>+</span></a>
												<a class="btns btn-line-g" data-target="#pc-file-div" minus-button><span>-</span></a>
											</div>
										
										</c:otherwise>
									</c:choose>
									<div style="clear: left;">
										<form:errors path="pcMessage" cssStyle="color: #ff0000;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>
									Mobile 이미지 등록
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 670 X 600</p>
								</th>
								<td>
									
									<c:choose>
										<c:when test="${fn:length(boardVO.moFileList) <= 0 }">
									
										<div style="float: left; display: block;" id="mo-file-div">
											<div class="ip-area w80 add-file" style="display: block;">
												<input type="file" name="MO_FILE_1" style="width: 400px;" />
											</div>
										</div>
										<div style="float: right;">
											<a class="btns btn-back-o" data-target="#mo-file-div" plus-button><span>+</span></a>
											<a class="btns btn-line-g" data-target="#mo-file-div" minus-button><span>-</span></a>
										</div>
										
										</c:when>
										<c:otherwise>
										
											<div style="float: left; display: block;" id="mo-file-div">
											
											<c:forEach items="${boardVO.moFileList }" var="moFile">
											
											<div class="w100">
												<c:out value="${moFile.orgName }" />
												<a class="btns btn-line-g" data-file-id="${moFile.id}"><span>삭제</span></a>
											</div>
											
											</c:forEach>
											
											</div>
											
											<div style="float: right;">
												<a class="btns btn-back-o" data-target="#mo-file-div" plus-button><span>+</span></a>
												<a class="btns btn-line-g" data-target="#mo-file-div" minus-button><span>-</span></a>
											</div>
										
										</c:otherwise>
									</c:choose>
									
									<div style="clear: left;">
										<form:errors path="moMessage" cssStyle="color: #ff0000;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;프로젝트 설명</th>
								<td>
									<form:textarea path="cont" maxlength="3000" />
									<form:errors path="cont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							
							</c:if>
							
						</tbody>
					</table>
				</div>
				
				</form:form>
				
			</div>
		</div>
		<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/admin/layout/after_script.jsp" %>
	<script type="text/javascript">
	
		// 추가/삭제할 이미지 input 개수
		function getTargetCount(t) {
			return $(t).find('div').length;
		}
		
		// 추가/삭제할 이미지 input Name
		function getTargetName(t) {
			return t.indexOf('pc') > -1 ? 'PC_FILE_' : 'MO_FILE_';
		}
		
		// 이미지 html 추가
		function setImageHtml(t) {
			
			if(getTargetCount(t) >= 5) return false;
			
			var sb = new StringBuilder();
			sb.append('<div class="ip-area w80 add-file" style="display: block;">');
			sb.append('	<input type="file" name="{0}" style="width: 400px;" />', getTargetName(t) + (getTargetCount(t)+1));
			sb.append('</div>');
			
			$(t).append(sb.toString());
		}
		
		// 이미지 html 삭제
		function removeImageHtml(t) {
			
			if(getTargetCount(t) <= 1) return false;
			
			$(t).find('div:last').remove();
		}
	
		$(function() {

			// CKEditor init
			if ($('#cont').length > 0) {
				var editor = new CKEditor( ['#cont'] );
			}
			
			// 언어 선택 event
			$('[name="lang"]').on('change', function() {
				
				var linkForm = $('<form/>', {method:'get', action:'${action }'});
				linkForm.append($('<input/>',{type:'hidden', name:'page', value:'${searchVO.page}'}));
				linkForm.append($('<input/>',{type:'hidden', name:'searchText', value:'${searchVO.searchText}'}));
				linkForm.append($('<input/>',{type:'hidden', name:'searchLangType', value:$(this).val()}));
				$('#form').after(linkForm);
				
				linkForm.submit();
			});
			
			// 이미지 input 추가 버튼 event
			$('[plus-button]').on('click', function() {
				
				setImageHtml($(this).data('target'));
			});

			// 이미지 input 삭제 버튼 event
			$('[minus-button]').on('click', function() {
				
				removeImageHtml($(this).data('target'));
			});
			
			// 취소 버튼 event
			$('[btn-cancel]').on('click', function() {
				
				var cancelForm = $('<form/>', {method:'get', action:'/admin/contents/board'});
				cancelForm.append($('<input/>',{type:'hidden', name:'page', value:'${searchVO.page}'}));
				cancelForm.append($('<input/>',{type:'hidden', name:'searchText', value:'${searchVO.searchText}'}));
				cancelForm.append($('<input/>',{type:'hidden', name:'searchLangType', value:'${searchVO.searchLangType}'}));
				$('#form').after(cancelForm);
				
				cancelForm.submit();
			});
			
			// 저장 버튼 event
			var isSubmit = false;
			$('[btn-save]').on('click', function() {
				
				if (isSubmit) return false;
				
				$('#form').submit();
				isSubmit = true;
			});
			
			// 파일 삭제 event
			$('[data-file-id]').on('click', function() {
				
				if (confirm('<spring:message code="ADMIN.VALIDATE.FILE.CONFIRM" javaScriptEscape="true" />')) {
					
					var deleteForm = $('<form/>', {method:'post', action:'/admin/contents/board/deleteFile/${boardVO.seq }'});
					deleteForm.append($('<input/>',{type:'hidden', name:'id', value:$(this).data('file-id')}))
					$('#form').after(deleteForm);
					
					deleteForm.submit();
				}
			});
			
			$.datepicker.formatDate();
		});
	
	</script>
</body>
</html>