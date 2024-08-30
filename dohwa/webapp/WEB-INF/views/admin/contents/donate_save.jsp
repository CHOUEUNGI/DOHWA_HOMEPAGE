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
				<h2 style="margin-bottom: 30px;">CSR(사회공헌) 관리 ${donateVO.seq eq 0 ? '등록' : '수정' }</h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" btn-cancel><span>취소</span></a>
					<a class="btns btn-back-o" btn-save><span>저장</span></a>
				</div>
				
				<c:url var="action" value="${requestScope['javax.servlet.forward.servlet_path']}" />
				<form:form id="form" action="${action }" modelAttribute="donateVO" method="post" enctype="multipart/form-data">
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
								<th><span class="required">필수항목</span>&nbsp;구분</th>
								<td>
									<div class="ip-area radio" style="">
										<form:radiobutton path="typeCode" value="01" label="희망나눔기금" checked="checked" />&nbsp;&nbsp;
										<form:radiobutton path="typeCode" value="02" label="봉사활동" />
 									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목(국문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koTitle" class="ip-text" title="제목(국문)" placeholder="제목을 입력해주세요." maxlength="500" />
									</div>
									<form:errors path="koTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목(영문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enTitle" class="ip-text" title="제목(영문)" placeholder="제목(영문)을 입력해주세요." maxlength="500" />
									</div>
									<form:errors path="enTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목(스페인)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esTitle" class="ip-text" title="제목(영문)" placeholder="제목(스페인)을 입력해주세요." maxlength="500" />
									</div>
									<form:errors path="esTitle" cssStyle="color: #ff0000;"/>
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
							<tr>
								<th><span class="required">필수항목</span>&nbsp;등록일자(영문)</th>
								<td>
									<div class="ip-area">
										<form:input path="writeDtEn" class="ip-text" title="등록일자(영문)" placeholder="등록일자(영문) 입력." maxlength="500" />
									</div> 
									<form:errors path="writeDtEn" cssStyle="color: #ff0000;"/>
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
								<th>&nbsp;이미지1 등록</th>
								<td>
									<c:if test="${not empty donateVO.mainFileName1}">
										<div class="w100"><c:out value="${donateVO.mainFileName1}" /><a class="btn-line-delete" data-btn="<c:out value="${donateVO.mainFileId1}"/>"><span>삭제</span></a></div>
										<form:hidden path="mainFileName1" value="${donateVO.mainFileName1}" />
									</c:if>
									<c:if test="${empty donateVO.mainFileName1}">
										<div class="w100">
											<input type="file" name="main_file_1" />
										</div>
										<form:errors path="main_file_1" cssStyle="color: #ff0000;"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>&nbsp;이미지2 등록</th>
								<td>
									<c:if test="${not empty donateVO.mainFileName2}">
										<div class="w100"><c:out value="${donateVO.mainFileName2}" /><a class="btn-line-delete" data-btn="<c:out value="${donateVO.mainFileId2}"/>"><span>삭제</span></a></div>
										<form:hidden path="mainFileName2" value="${donateVO.mainFileName2}" />
									</c:if>
									<c:if test="${empty donateVO.mainFileName2}">
										<div class="w100">
											<input type="file" name="main_file_2" />
										</div>
										<form:errors path="main_file_2" cssStyle="color: #ff0000;"/>
									</c:if>
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
								<th>&nbsp;내용(국문)</th>
								<td>
									<form:textarea id="koCont" path="koCont" maxlength="3000" />
									<form:errors path="koCont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;내용(영문)</th>
								<td>
									<form:textarea id="enCont" path="enCont" maxlength="3000" />
									<form:errors path="enCont" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;내용(스페인어)</th>
								<td>
									<form:textarea id="esCont" path="esCont" maxlength="3000" />
									<form:errors path="esCont" cssStyle="color: #ff0000;"/>
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
		var editor = new CKEditor( ['#koCont', '#enCont', '#esCont'] );
		
		// 메인 이미지 삭제
		$('[data-btn]').on('click', function() {
			if(confirm('선택한 이미지를 삭제 하시겠습니까?')) {
				$.getJSON('/admin/file/delete/' + $(this).data('btn'), function() {
					window.location.reload();
				}).error(function() {console.log(arguments)});
			}
		});
		
		$(function() {
			
			// 취소 버튼 event
			$('[btn-cancel]').on('click', function() {
				
				var cancelForm = $('<form/>', {method:'get', action:'/admin/contents/donate'});
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
					
					var deleteForm = $('<form/>', {method:'post', action:'/admin/contents/donate/deleteFile/${donateVO.seq }'});
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