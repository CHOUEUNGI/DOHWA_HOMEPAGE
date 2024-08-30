<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h2 style="margin-bottom: 50px;">
				<c:choose>
					<c:when test="${invRefVO.typeCode eq 'INV_REF_EANNO'}">
					투자정보 관리 > 전자공고 및 공시 > 전자공고 <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
					</c:when>
					<c:when test="${invRefVO.typeCode eq 'INV_REF_IR'}">
					투자정보 관리 > IR자료실 > IR Book <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
					</c:when>
					<c:when test="${invRefVO.typeCode eq 'INV_REF_ANNR'}">
					투자정보 관리 > IR자료실 > Annual Report <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
					</c:when>
					<c:when test="${invRefVO.typeCode eq 'INV_REF_ANAR'}">
					투자정보 관리 > IR자료실 > Analyst Report <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
					</c:when>
				</c:choose>
				</h2>
				<form:form id="form" modelAttribute="invRefVO"  method="post" enctype="multipart/form-data">
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="<c:out value="${parentURI}"/>"><span>취소</span></a>
						<a class="btns btn-back-o" id="saveButton"><span>저장</span></a>
					</div>
					<div class="wrap-tb tb-search">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;언어</th>
									<td>
										<span class="radio-box">
											<form:radiobutton path="lang" value="KO" label="국문" />&nbsp;&nbsp;
											<form:radiobutton path="lang" value="EN" label="영문" />&nbsp;&nbsp;
											<form:radiobutton path="lang" value="ES" label="스페인" />&nbsp;&nbsp;
										</span>
										<form:errors path="lang" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<c:if test="${invRefVO.typeCode ne 'INV_REF_ANAR'}">
									<tr>
										<th><span class="required">필수항목</span>&nbsp;구분(연도)</th>
										<td>
											<div class="ip-area w5">
												<form:input path="yyyy" title="구분(연도)" type="text" class="ip-text" maxlength="4" readonly="readonly"></form:input>
											</div>
											<form:errors path="yyyy" cssStyle="color: #ff0000;" />
										</td>
									</tr>
								</c:if>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;공개여부</th>
									<td>
										<span class="radio-box">
											<form:radiobutton path="dispYn" value="N" label="비공개"/>&nbsp;&nbsp;
											<form:radiobutton path="dispYn" value="Y" label="공개" />
										</span>
										<form:errors path="dispYn" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;제목</th>
									<td>
										<div class="ip-area w100">
											<form:input path="title" title="제목" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="title" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;첨부파일</th>
									<td>
										<div class="w100">
										<c:choose>
										<c:when test="${not empty invRefVO.fileOrgName}">
											<c:out value="${invRefVO.fileOrgName}" /><button type="button" class="btn-img-delete"></button>
										</c:when>
										<c:otherwise>
											<input type="file" name="PC_FILE_1"/>
											<form:errors path="file" cssStyle="color: #ff0000;" />
										</c:otherwise>
										</c:choose>
										</div>
									</td>
								</tr>
								<c:if test="${invRefVO.typeCode eq 'INV_REF_ANAR'}">
								<tr>
									<th><span class="required">필수항목</span>&nbsp;발간일</th>
									<td>
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_start"
													type="text"
													path="pblDt"
													value=""
													readonly="readonly" />
										</div>
										<form:errors path="pblDt" cssStyle="color: #ff0000;" />
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
	'use strict';

	(function ($) {
		var form = $('#form');
		
		<c:if test="${invRefVO.seq > 0}"> 
			$('input[name="lang"]').each(function(){
				if(!$(this).is(':checked')){
					$(this).hide();
					$(this).next().hide();
				}
			});
		</c:if>

		$('#saveButton').on('click', function(e) {
			e.preventDefault();

			if(!confirm("저장하시겠습니까?")) {
				return;
			}

			form.attr('method', 'post');
			<c:if test="${invRefVO.seq > 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'update'}))
			</c:if>
			<c:if test="${invRefVO.seq <= 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'insert'}))
			</c:if>
			form.submit();
		});

		/* 첨부 파일 삭제 */
		$('.btn-img-delete').on('click', function() {
			$.getJSON('/admin/file/delete/<c:out value="${invRefVO.fileId}" />', function() {
				window.location.reload();
			}).error(function() {console.log(arguments)});
		});

	}(jQuery));
	</script>
</body>
</html>