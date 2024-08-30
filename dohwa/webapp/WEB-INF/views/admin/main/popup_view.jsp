<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pcFile" value="NONE"/>
<c:set var="moFile" value="NONE"/>
<c:set var="pcFileKey" value="NONE"/>
<c:set var="moFileKey" value="NONE"/>
<c:forEach var="item" items="${mainPopupVO.files}">
<c:choose>
	<c:when test="${'PC' eq item.type}">
		<c:set var="pcFile" value="${item.orgName}"/>
		<c:set var="pcFileKey" value="${item.id}"/>
	</c:when>
	<c:when test="${'MO' eq item.type}">
		<c:set var="moFile" value="${item.orgName}"/>
		<c:set var="moFileKey" value="${item.id}"/>
	</c:when>
</c:choose>
</c:forEach>
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
				<h2 style="margin-bottom: 30px;">메인 팝업 <c:out value="${null eq mainPopupVO.seq ? '등록' : '수정'}" /></h2>
				<div class="bx-btn a-right">
					<a class="btns btn-line-g" href="/admin/main/popup"><span>취소</span></a>
					<a class="btns btn-back-o" id="btn-save"><span>저장</span></a>
				</div>
				<form:form id="form" action="/admin/main/popup/proc" modelAttribute="mainPopupVO" method="post" enctype="multipart/form-data">
				<form:hidden path="seq" />
				<div class="wrap-tb tb-search">
					<table>
						<colgroup>
							<col style="width:15%;">
							<col style="width:;">
							<col style="width:15%;">
							<col style="width:;">
						</colgroup>
						<tbody>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;언어</th>
								<td colspan="3">
									<div class="ip-area radio">
										<span><form:radiobutton path="lang" value="KO" label=" 국문" /></span>
										<span><form:radiobutton path="lang" value="EN" label=" 영문" /></span>
										<span><form:radiobutton path="lang" value="ES" label=" 스페인" /></span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;제목</th>
								<td colspan="3">
									<div class="ip-area w100">
										<form:input path="title" class="ip-text" title="타이틀" placeholder="제목을 입력해주세요." maxlength="350" />
									</div>
									<form:errors path="title" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;게시 시작일</th>
								<td>
									<c:set var="dispStDt" value="${mainPopupVO.dispStDt}"/>
									<c:set var="reDispStDt" value="${fn:replace(dispStDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reDispStDt}" pattern="yyyy-MM-dd HH:mm" var="convDispStDt" type="both"/>
									<fmt:formatDate var="syyyy" value="${convDispStDt}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="shh" value="${convDispStDt}" pattern="HH"/>
									<fmt:formatDate var="smm" value="${convDispStDt}" pattern="mm"/>
									<form:hidden path="dispStDt" />
									<form:hidden path="strDispStDt" />
									
									<div class="ip-area ico-calenadar">
										<input class="ip-text datepicker fk_start" id="sday" title="게시 시작일" placeholder="게시 시작일" value="<c:out value="${syyyy}"/>" />
									</div>&nbsp;&nbsp;
									<div class="ip-area w5">
										<input class="ip-text" id="shh" title="등록 시간" placeholder="시간" value="<c:out value="${shh}"/>" maxlength="2" />
									</div>&nbsp;시&nbsp;&nbsp;
									<div class="ip-area w5">
										<input class="ip-text" id="smm" title="등록 분" placeholder="분" value="<c:out value="${smm}"/>" maxlength="2" />
									</div>&nbsp;분
									<div>
										<form:errors path="dispStDt" cssStyle="color: #ff0000;"/>
									</div>
								</td>
								<th><span class="required">필수항목</span>&nbsp;게시 종료일</th>
								<td>
									<c:set var="dispEdDt" value="${mainPopupVO.dispEdDt}"/>
									<c:set var="reDispEdDt" value="${fn:replace(dispEdDt, 'T', ' ')}"/>
									<fmt:parseDate value="${reDispEdDt}" pattern="yyyy-MM-dd HH:mm" var="convDispEdDt" type="both"/>
									<fmt:formatDate var="eyyyy" value="${convDispEdDt}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="ehh" value="${convDispEdDt}" pattern="HH"/>
									<fmt:formatDate var="emm" value="${convDispEdDt}" pattern="mm"/>
									<form:hidden path="dispEdDt" />
									<form:hidden path="strDispEdDt" />
									
									<div class="ip-area ico-calenadar">
										<input class="ip-text datepicker fk_start" id="eday" title="게시 종료일" placeholder="게시 종료일" value="<c:out value="${eyyyy}"/>" />
									</div>&nbsp;&nbsp;
									<div class="ip-area w5">
										<input class="ip-text" id="ehh" title="등록 시간" placeholder="시간" value="<c:out value="${ehh}"/>" maxlength="2" />
									</div>&nbsp;시&nbsp;&nbsp;
									<div class="ip-area w5">
										<input class="ip-text" id="emm" title="등록 분" placeholder="분" value="<c:out value="${emm}"/>" maxlength="2" />
									</div>&nbsp;분
									<div>
										<form:errors path="dispEdDt" cssStyle="color: #ff0000;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;PC 팝업 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 416 X 600</p>
								</th>
								<td colspan="3">
								
								<c:if test="${'NONE' ne pcFile}">
									<div class="w100"><c:out value="${pcFile}" /><a class="btn-line-delete" data-btn="<c:out value="${pcFileKey}"/>"><span>삭제</span></a></div>
									<form:hidden path="pcFileName" value="${pcFile}" />
								</c:if>
								<c:if test="${'NONE' eq pcFile}">
									<div class="w100">
										<input type="file" name="pc_file_1" />
									</div>
									<form:errors path="pc_file_1" cssStyle="color: #ff0000;"/>
								</c:if>
								
							   </td>
							</tr>
							<tr>
								<th>
									<span class="required">필수항목</span>&nbsp;Mobile 팝업 이미지
									<p style="color: #ff0000; margin-top: 5px;">* 이미지 사이즈 : 710 X 880</p>
								</th>
								<td colspan="3">
								
								<c:if test="${'NONE' ne moFile}">
									<div class="w100"><c:out value="${moFile}" /><a class="btn-line-delete" data-btn="<c:out value="${moFileKey}"/>"><span>삭제</span></a></div>
									<form:hidden path="moFileName" value="${moFile}" />
								</c:if>
								<c:if test="${'NONE' eq moFile}">
									<div class="w100">
										<input type="file" name="mo_file_1" />
									</div>
									<form:errors path="mo_file_1" cssStyle="color: #ff0000;"/>
								</c:if>
																
							   </td>
							</tr>
							<tr>
								<th>이동 버튼명</th>
								<td colspan="3">
									<div class="ip-area w100">
										<form:input path="linkBtnNm" class="ip-text" title="버튼명" placeholder="버튼명 입력해주세요." maxlength="150" />
									</div>
									<form:errors path="linkBtnNm" cssStyle="color: #ff0000;"/>
								</td>
							</tr>
							<tr>
								<th>PC LINK URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="pcLinkUrl" class="ip-text" title="PC LINK URL" placeholder="PC LINK URL 입력해주세요." maxlength="150" />
									</div>
									<form:errors path="pcLinkUrl" cssStyle="color: #ff0000;"/>
								</td>
								<td colspan="2">
									<div class="ip-area radio">
										<span><form:radiobutton path="pcLinkYn" value="N" label=" 현재창" /></span>
										<span><form:radiobutton path="pcLinkYn" value="Y" label=" 새창" /></span>
									</div>
								</td>
							</tr>
							<tr>
								<th>MO LINK URL</th>
								<td>
									<div class="ip-area w100">
										<form:input path="moLinkUrl" class="ip-text" title="MO LINK URL" placeholder="MO LINK URL 입력해주세요." maxlength="150" />
									</div>
									<form:errors path="moLinkUrl" cssStyle="color: #ff0000;"/>
								</td>
								<td colspan="2">
									<div class="ip-area radio">
										<span><form:radiobutton path="moLinkYn" value="N" label=" 현재창" /></span>
										<span><form:radiobutton path="moLinkYn" value="Y" label=" 새창" /></span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="required">필수항목</span>&nbsp;노출 여부</th>
								<td colspan="3">
									<div class="ip-area radio">
										<span><form:radiobutton path="dispYn" value="N" label=" 미노출" /></span>
										<span><form:radiobutton path="dispYn" value="Y" label=" 노출" /></span>
									</div>
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
		// 시간
		$('#shh,#smm,#ehh,#emm').on('keyup', function() {
			var text = $(this).val().replace(/[^0-9]/g, '');
			if(('shh' === $(this).attr('id') || 'ehh' === $(this).attr('id')) && 23 < Number(text)) {
				text = '';
			} else if(('smm' === $(this).attr('id') || 'emm' === $(this).attr('id')) && 59 < Number(text)) {
				text = '';
			}
			$(this).val(text);
		});
	
		// 저장 버튼
		$('#btn-save').off('click').on('click', function() {
			var date = new Date();
			var yyyy = String(date.getFullYear());
			var mm = 1 === String(date.getMonth() + 1).length ? '0' + (date.getMonth() + 1) : String(date.getMonth() + 1);
			var dd = 1 === String(date.getDate()).length ? '0' + date.getDate() : String(date.getDate());
			
			var sday = $('#sday').val().replace(/[^0-9]/g, '');
			var shh = 1 === $('#shh').val().length ? '0' + $('#shh').val() : $('#shh').val();
			var smm = 1 === $('#smm').val().length ? '0' + $('#smm').val() : $('#smm').val();
			$('#strDispStDt').val(sday + shh + smm);
			
			var eday = $('#eday').val().replace(/[^0-9]/g, '');
			var ehh = 1 === $('#ehh').val().length ? '0' + $('#ehh').val() : $('#ehh').val();
			var emm = 1 === $('#emm').val().length ? '0' + $('#emm').val() : $('#emm').val();
			$('#strDispEdDt').val(eday + ehh + emm);
			
			$('#form').submit();
		});
		
		// 이미지 삭제
		$('[data-btn]').on('click', function() {
			if(confirm('선택한 이미지를 삭제 하시겠습니까?')) {
				$.getJSON('/admin/file/delete/' + $(this).data('btn'), function() {
					window.location.reload();
				}).error(function() {console.log(arguments)});
			}
		});
	</script>
</body>
</html>