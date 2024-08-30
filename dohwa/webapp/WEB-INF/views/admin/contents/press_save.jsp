<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h2 style="margin-bottom: 30px;">보도자료 관리 ${pressVO.seq eq 0 ? '등록' : '수정' }</h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" btn-cancel><span>취소</span></a>
					<a class="btns btn-back-o" btn-save><span>저장</span></a>
				</div>
				
				<c:url var="action" value="${requestScope['javax.servlet.forward.servlet_path']}" />
				<form:form id="form" action="${action }" modelAttribute="pressVO" method="post" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${searchVO.page }">
					<input type="hidden" name="searchText" value="${searchVO.searchText }">
					<input type="text" style="display: none;" />
				
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;공개여부</th>
								<td>
									<div class="ip-area selec">
										<span class="radio-box">
											<form:radiobutton path="dispYn" value="N" label="비공개" checked="checked" />&nbsp;&nbsp;
											<form:radiobutton path="dispYn" value="Y" label="공개" />
										</span>
									</div>
									<form:errors path="dispYn" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목</th>
								<td>
									<div class="ip-area w100">
										<form:input path="Title" class="ip-text" title="제목" placeholder="제목을 입력해주세요." maxlength="500" />
									</div>
									<form:errors path="Title" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;등록일자</th>
								<td>
									<div class="ip-area ico-calenadar">
										<form:input class="ip-text datepicker" type="text" path="writeDt" value="" />
									</div> 
									<form:errors path="writeDt" cssStyle="color: #ff0000;"/>
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
								<th>&nbsp;이미지 등록</th>
								<td>
									<c:choose>
										<c:when test="${empty pressVO.pcFile }">
										<div class="ip-area w100">
											<input type="file" name="PC_FILE_1" />
										</div>
										</c:when>
										<c:otherwise>
										<div class="w100">
											<c:out value="${pressVO.pcFile.orgName }" />
											<a class="btns btn-line-g" data-file-id="${pressVO.pcFile.id}"><span>삭제</span></a>
										</div>
										</c:otherwise>
									</c:choose>
									
									<form:errors path="pcMessage" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;이미지 리스트 썸네일 등록</th>
								<td>
									<c:choose>
										<c:when test="${empty pressVO.moFile }">
										<div class="ip-area w100">
											<input type="file" name="MO_FILE_1" />
										</div>
										</c:when>
										<c:otherwise>
										<div class="w100">
											<c:out value="${pressVO.moFile.orgName }" />
											<a class="btns btn-line-g" data-file-id="${pressVO.moFile.id}"><span>삭제</span></a>
										</div>
										</c:otherwise>
									</c:choose>
									<form:errors path="moMessage" cssStyle="color: #ff0000;"/>
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
								<th><span class="required">필수항목</span>&nbsp;내용</th>
								<td>
									<form:textarea id="Cont" path="Cont" maxlength="3000" />
									<form:errors path="Cont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
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
		var editor = new CKEditor( ['#Cont'] );
		
		$(function() {
			
			// 취소 버튼 event
			$('[btn-cancel]').on('click', function() {
				
				var cancelForm = $('<form/>', {method:'get', action:'/admin/contents/press'});
				cancelForm.append($('<input/>',{type:'hidden', name:'page', value:'${searchVO.page}'}));
				cancelForm.append($('<input/>',{type:'hidden', name:'searchText', value:'${searchVO.searchText}'}));
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
					
					var deleteForm = $('<form/>', {method:'post', action:'/admin/contents/press/deleteFile/${pressVO.seq }'});
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