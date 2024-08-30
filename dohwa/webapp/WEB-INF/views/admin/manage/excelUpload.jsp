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
						운영 관리 > 초기 데이터 관리
					</h2>
					<form:form id="form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="lang" id="lang" value=""/>
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
													<input id="type1" name="type" type="radio" value="project_ko" <c:if test="${TYPE eq 'project' }">checked</c:if> /><label for="type1">프로젝트 엑셀 데이터 DB에 저장</label> <br>
													<input id="type2" name="type" type="radio" value="export_project_ko" <c:if test="${TYPE eq 'export_project_ko' }">checked</c:if> /><label for="type2">프로젝트 DB데이터 엑셀 다운로드(KO)</label> <br>
													<input id="type3" name="type" type="radio" value="export_project_en" <c:if test="${TYPE eq 'export_project_en' }">checked</c:if> /><label for="type3">프로젝트 DB데이터 엑셀 다운로드(EN)</label> <br>
													<input id="type4" name="type" type="radio" value="export_project_es" <c:if test="${TYPE eq 'export_project_es' }">checked</c:if> /><label for="type4">프로젝트 DB데이터 엑셀 다운로드(ES)</label> <br>
													<input id="type5" name="type" type="radio" value="check_image_exist" <c:if test="${TYPE eq 'check_image_exist' }">checked</c:if> /><label for="type5">프로젝트 이미지 존재여부 확인</label> <br>
													<input id="type6" name="type" type="radio" value="export_project_chk" <c:if test="${TYPE eq 'export_project_chk' }">checked</c:if> /><label for="type6">프로젝트 DB데이터 엑셀 다운로드(검증용)</label> <br>
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
							운영 관리 > 엑셀 업로드 처리 결과
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
						<a class="btns btn-back-o" href="/admin/manage/excelUpload"><span>목록</span></a>
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
			var type = form.find('input[name=type]:checked').val();
			
			if(type.indexOf('export_project_chk') > -1){
				form.attr('action', 'downloadExcelProjectListForCheck');
			} else if(type.indexOf('export_project_') > -1){
				$('#lang').val(type.replace('export_project_', '').toUpperCase());
				form.attr('action', 'downloadExcelProjectList');
			} else if(type.indexOf('check_image_exist') > -1){
				form.attr('action', 'downloadExcelProjectImageList');
			} else {
				form.attr('action', 'excelUploadProc');
			}
			form.attr('method', 'post');
			form.submit();
		});

	}(jQuery));
	</script>
</body>
</html>