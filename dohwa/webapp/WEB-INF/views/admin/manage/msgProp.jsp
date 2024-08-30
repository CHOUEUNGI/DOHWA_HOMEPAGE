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
			<c:if test="${empty CODE }">
				<div class="wrap-cont">
					<h2 style="margin-bottom: 50px;">
						운영 관리 > 메시지 프로퍼티 관리
					</h2>
					<form:form id="form" method="post" enctype="multipart/form-data">
						<div class="wrap-tb tb-search">
							<table>
								<caption>기본정보</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:;">
								</colgroup>
								<tbody>
									<tr>
										<th><span class="required">필수항목</span>&nbsp;타입</th>
										<td>
											<div class="ip-area w100">
												<span class="radio-box">
													<input id="type1" name="type" type="radio" value="toDBfromMsgProp" <c:if test="${TYPE eq 'toDBfromMsgProp' }">checked</c:if> /><label for="type1">메시지 프로퍼티 값을 DB에 저장</label> <br>
													<input id="type2" name="type" type="radio" value="toMsgPropfromDB" <c:if test="${TYPE eq 'toMsgPropfromDB' }">checked</c:if>><label for="type2">DB 데이터를 메시지 프로퍼티 파일로 생성</label>  <br>
													<input id="type3" name="type" type="radio" value="uploadExceltoMsgPropDB" <c:if test="${TYPE eq 'uploadExceltoMsgPropDB' }">checked</c:if>><label for="type3">엑셀파일 업로드</label> <br>
													<input id="type4" name="type" type="radio" value="downloadExcelFromMsgProDB" <c:if test="${TYPE eq 'downloadExcelFromMsgProDB' }">checked</c:if>><label for="type4">엑셀파일 다운로드</label> <br>
													<input id="type5" name="type" type="radio" value="getMsgPropfromJsp" <c:if test="${TYPE eq 'getMsgPropfromJsp' }">checked</c:if>><label for="type5">JSP 파일에서 메시지 키 생성하기.</label>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>엑셀파일 업로드</th>
										<td>
											<div class="w100">
												<input type="file" name="excelFile"/>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="bx-btn a-right">
							<a class="btns btn-back-o" id="saveButton"><span>처리</span></a>
						</div>
					</form:form>
				</div>
			</c:if>
			<c:if test="${not empty CODE }">
				<div class="wrap-cont">
						<h2 style="margin-bottom: 50px;">
							관리자 관리 > 메시지 프로퍼티 관리 처리 결과
						</h2>
					<div class="wrap-tb tb-list">
						<table>
							<colgroup>
								<col style="width:10%;">
								<col style="width:;">
							</colgroup>
							<tbody>
									<tr>
										<th>결과코드</th>
										<td><c:out value="${CODE }"/></td>
									</tr>
									<tr>
										<th>메시지</th>
										<td><c:out value="${MSG }"/></td>
									</tr>
							</tbody>
						</table>
					</div>
					<div class="bx-btn a-right">
						<a class="btns btn-back-o" href="/admin/manage/msgProp"><span>목록</span></a>
					</div>
				</div>
			</c:if>
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
			form.attr('method', 'post');
			form.attr('action', 'msgPropProc');
			form.submit();
		});

	}(jQuery));
	</script>
</body>
</html>