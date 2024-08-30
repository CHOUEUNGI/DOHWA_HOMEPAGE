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
					투자정보 관리 > 주식 및 주주정보 > 주주총회  <c:if test="${invRefVO.seq > 0}"> 수정 </c:if><c:if test="${invRefVO.seq <= 0}"> 등록 </c:if>
				</h2>
				<form:form id="form" modelAttribute="stockVO"  method="post" enctype="multipart/form-data">
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
								<tr>
									<th><span class="required">필수항목</span>&nbsp;구분(연도)</th>
									<td>
										<div class="ip-area w5">
											<form:input path="yyyy" title="구분(연도)" type="text" class="ip-text" maxlength="4"></form:input>
										</div>
										<form:errors path="yyyy" cssStyle="color: #ff0000;" />
									</td>
								</tr>
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
										제&nbsp;
										<div class="ip-area w5">
											<form:input path="title" title="제목" type="text" class="ip-text"></form:input>
										</div>
										 &nbsp;기 주주총회
										<form:errors path="title" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;첨부파일</th>
									<td>
										<div class="w100">
										<c:choose>
										<c:when test="${not empty stockVO.fileOrgName}">
											<c:out value="${stockVO.fileOrgName}" /><button type="button" class="btn-img-delete"></button>
										</c:when>
										<c:otherwise>
											<input type="file" name="PC_FILE_1"/>
											<form:errors path="file" cssStyle="color: #ff0000;" />
										</c:otherwise>
										</c:choose>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="tr-title"> &nbsp; </td>
								</tr>
							</tbody>
						</table>
						<!-- 주주총회 안건 -->
						<table >
							<caption>주주총회 안건</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:50%;">
							</colgroup>
							<tbody>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주주총회 일시</th>
									<td  colspan="2">
										<div class="ip-area ico-calenadar">
											<form:input class="ip-text datepicker fk_start"
													type="text"
													path="meetDate"
													value=""
													readonly="readonly" />
										</div>
										<form:errors path="meetDate" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th><span class="required">필수항목</span>&nbsp;주주총회 장소</th>
									<td colspan="2">
										<div class="ip-area w100">
											<form:input path="meetPlace" title="주주총회 장소" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="meetPlace" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								<tr>
									<th colspan="2"><span class="required">필수항목</span>&nbsp;의안내용</th>
									<th><span class="required">필수항목</span>&nbsp;결의내용</th>
								</tr>
								<c:forEach begin="0" end="4" step="1" varStatus="meetStat">
								<tr>
									<td colspan="2">
										<div class="ip-area w100">
											<form:input path="stockMeetList[${meetStat.index }].agnd" title="의안내용" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="stockMeetList[${meetStat.index }].agnd" cssStyle="color: #ff0000;" />
									</td>
									<td>
										<div class="ip-area w100">
											<form:input path="stockMeetList[${meetStat.index }].rslt" title="결의내용" type="text" class="ip-text"></form:input>
										</div>
										<form:errors path="stockMeetList[${meetStat.index }].rslt" cssStyle="color: #ff0000;" />
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<form:errors path="stockMeetList" cssStyle="color: #ff0000;" />
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

			form.attr('method', 'post');
			<c:if test="${stockVO.seq > 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'update'}))
			</c:if>
			<c:if test="${stockVO.seq <= 0 }">
			form.append($('<input/>',{type:'hidden', name:'_method', value:'insert'}))
			</c:if>
			form.submit();
		});

		/* 첨부 파일 삭제 */
		$('.btn-img-delete').on('click', function() {
			$.getJSON('/admin/file/delete/<c:out value="${stockVO.fileId}" />', function() {
				window.location.reload();
			}).error(function() {console.log(arguments)});
		});

	}(jQuery));
	</script>
</body>
</html>