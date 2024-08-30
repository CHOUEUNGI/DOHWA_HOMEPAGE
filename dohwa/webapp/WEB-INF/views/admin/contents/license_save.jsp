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
				<h2 style="margin-bottom: 30px;">면허 관리 ${licenseVO.seq eq 0 ? '등록' : '수정' }</h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" btn-cancel><span>취소</span></a>
					<a class="btns btn-back-o" btn-save><span>저장</span></a>
				</div>
				
				<c:url var="action" value="${requestScope['javax.servlet.forward.servlet_path']}" />
				<form:form id="form" action="${action }" modelAttribute="licenseVO" method="post" enctype="multipart/form-data">
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
								<th><span class="required">필수항목</span>&nbsp;업면허 명(국문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koTitle" class="ip-text" title="업면허 명(국문)" placeholder="제목을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="koTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;업면허 명(영문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enTitle" class="ip-text" title="업면허 명(영문)" placeholder="제목을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="enTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;업면허 명(스페인어)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esTitle" class="ip-text" title="업면허 명(스페인어)" placeholder="제목을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="esTitle" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;취득일자</th>
								<td>
									<div class="ip-area ico-calenadar">
										<form:input class="ip-text datepicker" type="text" path="acquireDt" value="" />
									</div> 
									<form:errors path="acquireDt" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;발급기관(국문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="koIssueAgency" class="ip-text" title="발급기관(국문)" placeholder="발급기관을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="koIssueAgency" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;발급기관(영문)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="enIssueAgency" class="ip-text" title="발급기관(영문)" placeholder="발급기관을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="enIssueAgency" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>&nbsp;발급기관(스페인어)</th>
								<td>
									<div class="ip-area w100">
										<form:input path="esIssueAgency" class="ip-text" title="발급기관(스페인어)" placeholder="발급기관을 입력해주세요." maxlength="100" />
									</div>
									<form:errors path="esIssueAgency" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;PC 첨부파일(국문)
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 430 X 630</p>
								</th>
								<td>
								
									<c:choose>
										<c:when test="${empty licenseVO.pcFile }">
									
										<div class="ip-area w100">
											<input type="file" name="PC_FILE_1" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.pcFile.orgName }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.pcFile.id}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
									
									<form:errors path="pcMessage" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>
									Mobile 첨부파일(국문)
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 535 X 790</p>
								</th>
								<td>
									
									<c:choose>
										<c:when test="${empty licenseVO.moFile }">
									
										<div class="ip-area w100">
											<input type="file" name="MO_FILE_1" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.moFile.orgName }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.moFile.id}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
									
									<form:errors path="moMessage" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;PC 첨부파일(영문)
								</th>
								<td>
								
									<c:choose>
										<c:when test="${empty licenseVO.pcFileEn }">
									
										<div class="ip-area w100">
											<input type="file" name="PCEN_FILE_2" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.pcFileEn }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.pcFileEnId}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>
									Mobile 첨부파일(영문)
								</th>
								<td>
									
									<c:choose>
										<c:when test="${empty licenseVO.moFileEn }">
									
										<div class="ip-area w100">
											<input type="file" name="MOEN_FILE_2" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.moFileEn }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.moFileEnId}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;PC 첨부파일(스페인)
								</th>
								<td>
								
									<c:choose>
										<c:when test="${empty licenseVO.pcFileEs }">
									
										<div class="ip-area w100">
											<input type="file" name="PCES_FILE_3" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.pcFileEs }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.pcFileEsId}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>
									Mobile 첨부파일(스페인)
								</th>
								<td>
									
									<c:choose>
										<c:when test="${empty licenseVO.moFileEs }">
									
										<div class="ip-area w100">
											<input type="file" name="MOES_FILE_3" />
										</div>
										
										</c:when>
										<c:otherwise>
										
										<div class="w100">
											<c:out value="${licenseVO.moFileEs }" />
											<a class="btns btn-line-g" data-file-id="${licenseVO.moFileEsId}"><span>삭제</span></a>
										</div>
										
										</c:otherwise>
									</c:choose>
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
	
		$(function() {
			
			// 취소 버튼 event
			$('[btn-cancel]').on('click', function() {
				
				var cancelForm = $('<form/>', {method:'get', action:'/admin/contents/license'});
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
					
					var deleteForm = $('<form/>', {method:'post', action:'/admin/contents/license/deleteFile/${licenseVO.seq }'});
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