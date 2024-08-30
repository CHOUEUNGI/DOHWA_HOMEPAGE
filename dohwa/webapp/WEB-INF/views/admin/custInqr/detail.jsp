<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<h2 style="margin-bottom: 50px;">고객문의관리 답변(* 필수등록)</h2>
				<form:form id="form" modelAttribute="custInqrVO" method="post">
					<div class="wrap-tb tb-search">
						<table>
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
								<tr>
									<th>성명</th>
									<td>
										<c:out value="${custInqrVO.regNm}"></c:out>
									</td>
									<th>등록일</th>
									<td>
										<fmt:parseDate value="${custInqrVO.regDt}" pattern="yyyy-MM-dd'T'HH:mm" var="convRegDt" type="both"/>
										<fmt:formatDate value="${convRegDt}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td colspan="3">
										<c:out value="${custInqrVO.email}"></c:out>
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan="3">
										<c:out value="${custInqrVO.tel}"></c:out>
									</td>
								</tr>
								<tr>
									<th>문의사항 등록시 언어정보</th>
									<td colspan="3">
										<c:out value="${custInqrVO.lang}"></c:out>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">
										<c:out value="${custInqrVO.title}"></c:out>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<textarea rows="10" style="width:100%" readonly="readonly"><c:out value="${fn:replace(custInqrVO.cont, '&lt;br&gt;', newLineChar)}"/></textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<a href = "/download/file/<c:out value="${custInqrVO.fileId}"/>" target="_blank"><c:out value="${custInqrVO.fileOrgName}"/></a>

									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;답변</th>
									<td colspan="3">
										<div class="ip-area w90">
											<textarea rows="10" style="width:100%" name="answ" id="answ"><c:out value="${fn:replace(custInqrVO.answ, '&lt;br&gt;', newLineChar)}"/></textarea>
										</div>
										<form:errors path="answ" cssStyle="color: #ff0000;" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-line-g" href="/admin/custInqr"><span>취소</span></a>
						<c:if test="${custInqrVO.answYn eq '완료' }">
						<a class="btns btn-back-o" id="sendEmailButton"><span>이메일 재발송</span></a>
						</c:if>
						<c:if test="${custInqrVO.answYn ne '완료' }">
						<a class="btns btn-back-o" id="saveButton"><span>저장</span></a>
						</c:if>
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

		$('#saveButton').on('click', function(e) {
			e.preventDefault();

			if(!confirm("저장하시겠습니까?")) {
				return;
			}

			$('#answ').val($('#answ').val().replace(/(\n|\r\n)/g, '<br>'));

			form.attr('method', 'post');
			form.append($('<input/>',{type:'hidden', name:'_method', value:'update'}))
			form.submit();
		});

		$('#sendEmailButton').on('click', function(e) {
			e.preventDefault();

			if(!confirm("답변 이메일을 재발송하시겠습니까?")) {
				return;
			}

			form.attr('method', 'post');
			form.append($('<input/>',{type:'hidden', name:'_method', value:'sendEmail'}))
			form.submit();
		});
	}(jQuery));
	</script>
</body>
</html>